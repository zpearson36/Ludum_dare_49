/// @description Insert description here
// You can write your code in this editor
show_debug_message(image_angle)
switch state
{
	case CRAB_STATE.IDLE:
	{
		xspd = 0
		sprite_index = sCrab_Idle
		if(!collision_rectangle(x - (CRABWIDTH / 2), y + (CRABHEIGHT / 2),
		                        x + (CRABWIDTH / 2), y + (CRABHEIGHT / 2) + 1,
			  				    oBarrier, false, false))
		{
			yspd = FALLINGSPEED
			state = CRAB_STATE.FALLING
			break;
		}
		sprite_index = sCrab_Idle
		if(global.move_right)
		{
			state = CRAB_STATE.WALKING;
			image_xscale = 1;
			xspd = CRABSPEED
			break;
		}
		if(global.move_left)
		{
			state = CRAB_STATE.WALKING;
			image_xscale = -1
			xspd = -CRABSPEED
			break;
		}
		break;
	}
	case CRAB_STATE.WALKING:
	{
		if(!collision_rectangle(x - (CRABWIDTH / 2), y + (CRABHEIGHT / 2),
		                        x + (CRABWIDTH / 2), y + (CRABHEIGHT / 2) + 1,
			  				    oBarrier, false, false))
		{
			/*yspd = 3
			state = CRAB_STATE.FALLING*/
			image_angle -= (sign(xspd) * 90)
			y += CRABWIDTH
			state = CRAB_STATE.CLIMBINGWALLIDLE
			break;
		}
		if(!global.move_right and !global.move_left)
		{
			state = CRAB_STATE.IDLE
			xspd = 0
			break;
		}
		if((global.move_right and image_xscale == -1) or (global.move_left and image_xscale == 1))
		{
			state = CRAB_STATE.IDLE
			xspd = 0
			break;
		}
		sprite_index = sCrab_Walking
		x += xspd
		break;
	}
	case CRAB_STATE.FALLING:
	{
		sprite_index = sCrab_Idle
		if(collision_rectangle(x + (sign(xspd) * (CRABWIDTH / 2)), y - (CRABHEIGHT / 2),
		                       x + (sign(xspd) * (CRABWIDTH / 2)) + xspd, y + (CRABHEIGHT / 2),
			  				   oBarrier, false, false))
		{
			while(!collision_rectangle(x + (sign(xspd) * (CRABWIDTH / 2)), y - (CRABHEIGHT / 2),
		                               x + (CRABWIDTH / 2) + (sign(xspd) * 1), y + (CRABHEIGHT / 2),
							           oBarrier, false, false))
			{
				x += (sign(xspd) * 1)
			}
			xspd = 0
		}
		if(collision_rectangle(x - (CRABWIDTH / 2), y + (CRABHEIGHT / 2),
		                       x + (CRABWIDTH / 2), y + (CRABHEIGHT / 2) + yspd,
							   oBarrier, false, false))
	    {
			while(!collision_rectangle(x - (CRABWIDTH / 2), y + (CRABHEIGHT / 2),
		                               x + (CRABWIDTH / 2), y + (CRABHEIGHT / 2) + 1,
							           oBarrier, false, false))
			{
				y += 1
			}
			image_index = 0
			state = CRAB_STATE.IDLE
			break;
		}
		y += yspd
		x += xspd
		break;
	}
	case CRAB_STATE.CLIMBINGWALLIDLE:
	{
		if(global.move_jump)
		{
			image_angle = 0
			state = CRAB_STATE.FALLING
			yspd = FALLINGSPEED
			break;
		}
		if(global.move_down)
		{
			state = CRAB_STATE.CLIMBINGWALLWALKING;
			image_xscale = 1;
			xspd = CRABSPEED
			break;
		}
		if(global.move_up)
		{
			state = CRAB_STATE.CLIMBINGWALLWALKING;
			image_xscale = -1
			xspd = -CRABSPEED
			break;
		}
		break;
	}
	case CRAB_STATE.CLIMBINGWALLWALKING:
	{
		
		var tmp_rot = 1
		if(image_angle == -90 || image_angle == 270) tmp_rot = -1
		if(!collision_rectangle(x + (tmp_rot * (CRABWIDTH / 2)), y - (CRABHEIGHT / 2),
		                        x + (tmp_rot * ((CRABWIDTH / 2) + 5)), y + (CRABHEIGHT / 2),
			  				    oBarrier, false, false))
		{
			/*yspd = 3
			state = CRAB_STATE.FALLING*/
			image_angle += (tmp_rot * sign(xspd) * 90)
			if(abs(image_angle) == 360) image_angle = 0
			x += (tmp_rot * CRABWIDTH)
			if(image_angle == 0)
			{
				state = CRAB_STATE.IDLE
			}
			else
			{
			    state = CRAB_STATE.CLIMBINGCEILINGIDLE
			}
			break;
		}
		if(!global.move_up and !global.move_down)
		{
			state = CRAB_STATE.CLIMBINGWALLIDLE
			xspd = 0
			break;
		}
		if((global.move_down and image_xscale == -1) or (global.move_up and image_xscale == 1))
		{
			state = CRAB_STATE.CLIMBINGWALLIDLE
			xspd = 0
			break;
		}
		y += xspd
		break;
	}
	case CRAB_STATE.CLIMBINGCEILINGIDLE:
	{
		if(global.move_jump)
		{
			image_angle = 0
			state = CRAB_STATE.FALLING
			yspd = FALLINGSPEED
			break;
		}
		if(global.move_right)
		{
			state = CRAB_STATE.CLIMBINGCEILINGWALKING;
			image_xscale = -1;
			xspd = CRABSPEED
			break;
		}
		if(global.move_left)
		{
			state = CRAB_STATE.CLIMBINGCEILINGWALKING;
			image_xscale = 1
			xspd = -CRABSPEED
			break;
		}
		break;
	}
	case CRAB_STATE.CLIMBINGCEILINGWALKING:
	{
		if(!collision_rectangle(x - (CRABWIDTH / 2), y - (CRABHEIGHT / 2),
		                        x + (CRABWIDTH / 2), y - (CRABHEIGHT / 2) - 5,
			  				    oBarrier, false, false))
		{
			image_angle += (sign(xspd) * 90)
			y -= CRABWIDTH
			state = CRAB_STATE.CLIMBINGWALLIDLE
			break;
		}
		if(!global.move_left and !global.move_right)
		{
			state = CRAB_STATE.CLIMBINGCEILINGIDLE
			xspd = 0
			break;
		}
		if((global.move_down and image_xscale == -1) or (global.move_up and image_xscale == 1))
		{
			state = CRAB_STATE.CLIMBINGCEILINGIDLE
			xspd = 0
			break;
		}
		x += xspd
		break;
	}
}