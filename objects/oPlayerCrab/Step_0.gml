/// @description Insert description here
// You can write your code in this editor
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
			yspd = 3
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
			yspd = 3
			state = CRAB_STATE.FALLING
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
}