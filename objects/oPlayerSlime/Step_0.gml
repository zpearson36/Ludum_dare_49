/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case SLIME_STATE.IDLE:
	{
		if(global.move_leave)
		{
			oPlayer.leave_form()
		}
		xspd = 0
		sprite_index = sSlime_Idle
		if(!collision_rectangle(x - (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2),
		                        x + (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2) + 1,
			  				    oBarrier, false, false))
		{
			yspd = FALLINGSPEED
			state = SLIME_STATE.FALLING
			break;
		}
		if(global.move_right)
		{
			state = SLIME_STATE.WALKING;
			image_xscale = 1;
			xspd = SLIMESPEED
			break;
		}
		if(global.move_left)
		{
			state = SLIME_STATE.WALKING;
			image_xscale = -1
			xspd = -SLIMESPEED
			break;
		}
		if(global.move_down)
		{
			//y += 4
			state = SLIME_STATE.CROUCHING
		    sprite_index = sSlime_Crouch
			break;
		}
		if(global.move_jump)
		{
			state = SLIME_STATE.JUMPING;
			image_index = 0
			break;
		}
		if(global.move_action)
		{
			if(can_reabsorb)
			{
				state = SLIME_STATE.ABSORBING
				image_index = 0
				break;
			}
			else
			{
				state = SLIME_STATE.SPLITTING
				image_index = 0
				break;
			}
		}
		/*if(global.move_action2)
		{
			switch_to_copy()
			break;
		}*/
		break;
	}
	case SLIME_STATE.WALKING:
	{
		if(!audio_is_playing(moving_sound))
		{
			//moving_sound = Slime1//choose(Slime1, Slime2, Slime3)
			audio_play_sound(moving_sound, 1000000, false)
		}
		if(!collision_rectangle(x - (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2),
		                        x + (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2) + 1,
			  				    oBarrier, false, false))
		{
			audio_stop_sound(moving_sound)
			yspd = FALLINGSPEED
			state = SLIME_STATE.FALLING
			break;
		}
		if(!global.move_right and !global.move_left)
		{
			audio_stop_sound(moving_sound)
			state = SLIME_STATE.IDLE
			xspd = 0
			break;
		}
		if((global.move_right and image_xscale == -1) or (global.move_left and image_xscale == 1))
		{
			audio_stop_sound(moving_sound)
			state = SLIME_STATE.IDLE
			xspd = 0
			break;
		}
		if(global.move_down)
		{
			audio_stop_sound(moving_sound)
			y += 4
			state = SLIME_STATE.CROUCHEDWALKING
			break;
		}
		if(global.move_jump)
		{
			audio_stop_sound(moving_sound)
			state = SLIME_STATE.JUMPING;
			image_index = 0
			break;
		}
		sprite_index = sSlime_Walk
		if(collision_rectangle(x + (sign(xspd) * (SLIMEWIDTH / 2)), y - (SLIMEHEIGHT / 2),
		                       x + (sign(xspd) * (SLIMEWIDTH / 2)) + xspd, y + (SLIMEHEIGHT / 2),
			  				   oBarrier, false, false))
		{
			while(!collision_rectangle(x + (sign(xspd) * (SLIMEWIDTH / 2)), y - (SLIMEHEIGHT / 2),
		                               x + (sign(xspd) * (SLIMEWIDTH / 2) + 1), y + (SLIMEHEIGHT / 2),
							           oBarrier, false, false))
			{
				x += (sign(xspd) * 1)
			}
			audio_stop_sound(moving_sound)
			state = SLIME_STATE.IDLE
			xspd = 0
			break;
		}
		x += xspd
		break;
	}
	case SLIME_STATE.CROUCHING:
	{
		if(!audio_is_playing(crouching_sound)) audio_play_sound(crouching_sound, 100000, false)
		if(image_index >= 3)
		{
			state = SLIME_STATE.CROUCHED
		}
		break;
	}
	case SLIME_STATE.CROUCHED:
	{
		sprite_index = sSlime_Crouched
		in_tight_spot = false
		if(collision_rectangle(x - (SLIMEWIDTH / 2) + 5, y - (SLIMEHEIGHT / 2),
		                       x + (SLIMEWIDTH / 2) - 5, y - (SLIMEHEIGHT / 2),
			  				   oBarrier, false, false))
		{
			in_tight_spot = true
		}
		if(global.move_down or in_tight_spot)
		{
			if(global.move_right)
			{
				state = SLIME_STATE.CROUCHEDWALKING;
				image_xscale = 1;
				xspd = SLIMESPEED
				y += 4
				break;
			}
			if(global.move_left)
			{
				state = SLIME_STATE.CROUCHEDWALKING;
				image_xscale = -1
				xspd = -SLIMESPEED
				
				y += 4
				break;
			}
		}
		else
		{
			if(in_tight_spot) break;
			state = SLIME_STATE.IDLE
			xspd = 0
			break;
		}
		break;
	}
	case SLIME_STATE.CROUCHEDWALKING:
	{
		if(!audio_is_playing(crouched_moving_sound)) audio_play_sound(crouched_moving_sound, 100000, false)
		in_tight_spot = false
		if(collision_rectangle(x - (SLIMEWIDTH / 2) + 5, y - (SLIMEHEIGHT / 2),
		                       x + (SLIMEWIDTH / 2) - 5, y - (SLIMEHEIGHT / 2),
			  				   oBarrier, false, false))
		{
			in_tight_spot = true
		}
		if(global.move_down or in_tight_spot)
		{
			if(!global.move_right and !global.move_left)
			{
				state = SLIME_STATE.CROUCHED
				xspd = 0
				y -= 4
				break;
			}
			if((global.move_right and image_xscale == -1) or (global.move_left and image_xscale == 1))
			{
				state = SLIME_STATE.CROUCHED
				xspd = 0
				y -= 4
				break;
			}
		}
		else
		{
			if(in_tight_spot) break;
			state = SLIME_STATE.IDLE
			xspd = 0
			y -= 4
			break;
		}
		sprite_index = sSlime_CrouchWalk
		if(collision_rectangle(x + (sign(xspd) * (CROUCHEDSLIMEWIDTH / 2)), y - (CROUCHEDSLIMEHEIGHT / 2),
		                       x + (sign(xspd) * (CROUCHEDSLIMEWIDTH / 2)) + xspd, y + (CROUCHEDSLIMEHEIGHT / 2),
			  				   oBarrier, false, false))
		{
			while(!collision_rectangle(x + (sign(xspd) * (CROUCHEDSLIMEWIDTH / 2)), y - (CROUCHEDSLIMEHEIGHT / 2),
		                               x + (sign(xspd) * (CROUCHEDSLIMEWIDTH / 2) + 1), y + (CROUCHEDSLIMEHEIGHT / 2),
							           oBarrier, false, false))
			{
				x += (sign(xspd) * 1)
			}
			state = SLIME_STATE.CROUCHED
			xspd = 0
			break;
		}
		x += xspd
		break;
	}
	case SLIME_STATE.JUMPING:
	{
		if(!audio_is_playing(jumping_sound)) audio_play_sound(jumping_sound, 100000, false)
		sprite_index = sSlime_Jumping
		if(image_index >= 5)
		{
			state = SLIME_STATE.FALLING
			break;
		}
		x += xspd
		break;
	}
	case SLIME_STATE.FALLING:
	{
		sprite_index = sSlime_Falling
		if(collision_rectangle(x + (sign(xspd) * (SLIMEWIDTH / 2)), y - (SLIMEHEIGHT / 2),
		                       x + (sign(xspd) * (SLIMEWIDTH / 2)) + xspd, y + (SLIMEHEIGHT / 2),
			  				   oBarrier, false, false))
		{
			while(!collision_rectangle(x + (sign(xspd) * (SLIMEWIDTH / 2)), y - (SLIMEHEIGHT / 2),
		                               x + (SLIMEWIDTH / 2) + (sign(xspd) * 1), y + (SLIMEHEIGHT / 2),
							           oBarrier, false, false))
			{
				x += (sign(xspd) * 1)
			}
			xspd = 0
		}
		if(collision_rectangle(x - (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2),
		                       x + (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2) + yspd,
							   oBarrier, false, false))
	    {
			while(!collision_rectangle(x - (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2),
		                               x + (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2) + 1,
							           oBarrier, false, false))
			{
				y += 1
			}
			image_index = 0
			state = SLIME_STATE.LANDING
			break;
		}
		y += yspd
		x += xspd
		break;
	}
	case SLIME_STATE.LANDING:
	{
		sprite_index = sSlime_Landing
		if(image_index >= 3)
		{
			state = SLIME_STATE.IDLE
			break;
		}
		break;
	}
	case SLIME_STATE.SPLITTING:
	{
		if(!audio_is_playing(jumping_sound)) audio_play_sound(jumping_sound, 100000, false)
		sprite_index = sSlime_Jump_Full
		if(splits_left <= 0)
		{
			state = SLIME_STATE.SPLITFINISH
			break;
		}
		if(image_index >= 4)
		{
			var tmp = instance_create_layer(x, y - 17, layer, oSlime)
			for(var i = 0; i < ds_list_size(copies); i++)
			{
				tmp.copies[| i] = copies[| i]
			}
			ds_list_add(tmp.copies, self)
			ds_list_add(copies, tmp)
			tmp.slime_index = ds_list_size(copies)
			splits_left -= 1
			tmp.splits_left = 0
			state = SLIME_STATE.SPLITFINISH
			break;
		}
		break;
	}
	case SLIME_STATE.SPLITFINISH:
	{
		if(image_index >= 10)
		{
			state = SLIME_STATE.IDLE
			break
		}
		break;
	}
	case SLIME_STATE.ABSORBING:
	{
		if(!audio_is_playing(absorbing_sound)) audio_play_sound(absorbing_sound, 100000, false)
		sprite_index = sSlime_Landing
		var tmp = collision_circle(x, y, SLIMEHEIGHT, oSlime, false, false)
		/*remove_from_copies_list(tmp.id)
		for(var i =0; i < ds_list_size(copies); i++)
		{
			copies[| i].remove_from_copies_list(tmp)
		}*/
		instance_destroy(tmp)
		splits_left += 1
		state = SLIME_STATE.ABSORBED
		break;
	}
	case SLIME_STATE.ABSORBED:
	{
		if(image_index >= 4) state = SLIME_STATE.IDLE
		break;
	}
	
}