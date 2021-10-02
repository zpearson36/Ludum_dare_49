/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case SLIME_STATE.IDLE:
	{
		sprite_index = sSlime_Idle
		if(!collision_rectangle(x - (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2),
		                        x + (SLIMEWIDTH / 2), y + (SLIMEHEIGHT / 2) + 1,
			  				    oBarrier, false, false))
		{
			yspd = FALLINGSPEED
			state = SLIME_STATE.FALLING
			break;
		}
		break;
	}
	case SLIME_STATE.WALKING:
	{
		break;
	}
	case SLIME_STATE.CROUCHING:
	{
		break;
	}
	case SLIME_STATE.CROUCHED:
	{
		break;
	}
	case SLIME_STATE.CROUCHEDWALKING:
	{
		break;
	}
	case SLIME_STATE.JUMPING:
	{
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