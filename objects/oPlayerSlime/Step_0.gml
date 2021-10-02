/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case PLAYER_STATE.IDLE:
	{
		xspd = 0
		sprite_index = sSlime_Idle
		if(!collision_rectangle(x - (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2),
		                        x + (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2) + 1,
			  				    oBarrier, false, false))
		{
			yspd = 3
			state = PLAYER_STATE.FALLING
			break;
		}
		if(global.move_right)
		{
			state = PLAYER_STATE.WALKING;
			image_xscale = 1;
			xspd = SLIMESPEED
			break;
		}
		if(global.move_left)
		{
			state = PLAYER_STATE.WALKING;
			image_xscale = -1
			xspd = -SLIMESPEED
			break;
		}
		if(global.move_down)
		{
			state = PLAYER_STATE.CROUCHING
		    sprite_index = sSlime_Crouch
			break;
		}
		if(global.move_jump)
		{
			state = PLAYER_STATE.JUMPING;
			image_index = 0
			break;
		}
		break;
	}
	case PLAYER_STATE.WALKING:
	{
		
		if(!collision_rectangle(x - (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2),
		                        x + (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2) + 1,
			  				    oBarrier, false, false))
		{
			yspd = 3
			state = PLAYER_STATE.FALLING
			break;
		}
		if(!global.move_right and !global.move_left)
		{
			state = PLAYER_STATE.IDLE
			xspd = 0
			break;
		}
		if((global.move_right and image_xscale == -1) or (global.move_left and image_xscale == 1))
		{
			state = PLAYER_STATE.IDLE
			xspd = 0
			break;
		}
		if(global.move_down)
		{
			state = PLAYER_STATE.CROUCHEDWALKING
			break;
		}
		if(global.move_jump)
		{
			state = PLAYER_STATE.JUMPING;
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
			state = PLAYER_STATE.IDLE
			xspd = 0
			break;
		}
		x += xspd
		break;
	}
	case PLAYER_STATE.CROUCHING:
	{
		if(!collision_rectangle(x - (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2),
		                        x + (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2) + 1,
			  				    oBarrier, false, false))
		{
			yspd = 3
			state = PLAYER_STATE.FALLING
			break;
		}
		show_debug_message(image_index)
		if(image_index >= 3)
		{
			state = PLAYER_STATE.CROUCHED
		}
		break;
	}
	case PLAYER_STATE.CROUCHED:
	{
		if(!collision_rectangle(x - (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2),
		                        x + (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2) + 1,
			  				    oBarrier, false, false))
		{
			yspd = 3
			state = PLAYER_STATE.FALLING
			break;
		}
		sprite_index = sSlime_Crouched
		if(global.move_down)
		{
			if(global.move_right)
			{
				state = PLAYER_STATE.CROUCHEDWALKING;
				image_xscale = 1;
				xspd = SLIMESPEED
				break;
			}
			if(global.move_left)
			{
				state = PLAYER_STATE.CROUCHEDWALKING;
				image_xscale = -1
				xspd = -SLIMESPEED
				break;
			}
		}
		else
		{
			state = PLAYER_STATE.IDLE
			xspd = 0
			break;
		}
		break;
	}
	case PLAYER_STATE.CROUCHEDWALKING:
	{
		if(!collision_rectangle(x - (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2),
		                        x + (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2) + 1,
			  				    oBarrier, false, false))
		{
			yspd = 3
			state = PLAYER_STATE.FALLING
			break;
		}
		if(global.move_down)
		{
			if(!global.move_right and !global.move_left)
			{
				state = PLAYER_STATE.CROUCHED
				xspd = 0
				break;
			}
			if((global.move_right and image_xscale == -1) or (global.move_left and image_xscale == 1))
			{
				state = PLAYER_STATE.CROUCHED
				xspd = 0
				break;
			}
		}
		else
		{
			state = PLAYER_STATE.IDLE
			xspd = 0
			break;
		}
		sprite_index = sSlime_CrouchWalk
		x += xspd
		break;
	}
	case PLAYER_STATE.JUMPING:
	{
		sprite_index = sSlime_Jumping
		if(image_index >= 5)
		{
			state = PLAYER_STATE.FALLING
			break;
		}
		x += xspd
		break;
	}
	case PLAYER_STATE.FALLING:
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
			state = PLAYER_STATE.LANDING
			break;
		}
		y += yspd
		x += xspd
		break;
	}
	case PLAYER_STATE.LANDING:
	{
		sprite_index = sSlime_Landing
		if(image_index >= 3)
		{
			state = PLAYER_STATE.IDLE
			break;
		}
		break;
	}
}