/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case SLIME_STATE.IDLE:
	{
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
		break;
	}
	case SLIME_STATE.WALKING:
	{
		
		if(!collision_rectangle(x - (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2),
		                        x + (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2) + 1,
			  				    oBarrier, false, false))
		{
			yspd = FALLINGSPEED
			state = SLIME_STATE.FALLING
			break;
		}
		if(!global.move_right and !global.move_left)
		{
			state = SLIME_STATE.IDLE
			xspd = 0
			break;
		}
		if((global.move_right and image_xscale == -1) or (global.move_left and image_xscale == 1))
		{
			state = SLIME_STATE.IDLE
			xspd = 0
			break;
		}
		if(global.move_down)
		{
			y += 4
			state = SLIME_STATE.CROUCHEDWALKING
			break;
		}
		if(global.move_jump)
		{
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
			state = SLIME_STATE.IDLE
			xspd = 0
			break;
		}
		x += xspd
		break;
	}
	case SLIME_STATE.CROUCHING:
	{
		/*if(!collision_rectangle(x - (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2),
		                        x + (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2) + 1,
			  				    oBarrier, false, false))
		{
			yspd = 3
			state = SLIME_STATE.FALLING
			break;
		}*/
		show_debug_message(image_index)
		if(image_index >= 3)
		{
			state = SLIME_STATE.CROUCHED
		}
		break;
	}
	case SLIME_STATE.CROUCHED:
	{
		/*if(!collision_rectangle(x - (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2),
		                        x + (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2) + 1,
			  				    oBarrier, false, false))
		{
			yspd = 3
			state = SLIME_STATE.FALLING
			break;
		}*/
		sprite_index = sSlime_Crouched
		if(global.move_down)
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
			state = SLIME_STATE.IDLE
			xspd = 0
			break;
		}
		break;
	}
	case SLIME_STATE.CROUCHEDWALKING:
	{
		/*if(!collision_rectangle(x - (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2),
		                        x + (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2) + 1,
			  				    oBarrier, false, false))
		{
			yspd = 3
			state = SLIME_STATE.FALLING
			break;
		}*/
		if(global.move_down)
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
}