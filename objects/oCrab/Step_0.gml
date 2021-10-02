/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
//show_debug_message(image_angle)
//show_debug_message(sign(xspd))
//show_debug_message(state)
switch state
{
	case CRAB_STATE.IDLE:
	{
		sprite_index = sCrab_Idle
		if(!collision_rectangle(x - (CRABWIDTH / 2), y + (CRABHEIGHT / 2),
		                        x + (CRABWIDTH / 2), y + (CRABHEIGHT / 2) + 1,
			  				    oBarrier, false, false))
		{
			yspd = FALLINGSPEED
			state = CRAB_STATE.FALLING
			break;
		}
		break;
	}
	case CRAB_STATE.WALKING:
	{
		break;
	}
	case CRAB_STATE.FALLING:
	{
		sprite_index = sCrab_Idle
		if(collision_rectangle(x - (CRABWIDTH / 2), y + (CRABHEIGHT / 2),
		                       x + (CRABWIDTH / 2), y + (CRABHEIGHT / 2) + yspd,
							   oBarrier, false, false))
	    {
			var tmp = true
			while(tmp)
			{
				y += 1
				if(collision_rectangle(x - (CRABWIDTH / 2) + 5, y + (CRABHEIGHT / 2),
		                               x + (CRABWIDTH / 2) - 5, y + (CRABHEIGHT / 2),
					                   oBarrier, false, false))
			    {
					tmp = false
				}
			}
			show_debug_message(yspd)
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
		break;
	}
	case CRAB_STATE.CLIMBINGWALLWALKING:
	{
		break;
	}
	case CRAB_STATE.CLIMBINGCEILINGIDLE:
	{
		break;
	}
	case CRAB_STATE.CLIMBINGCEILINGWALKING:
	{
		break;
	}
}