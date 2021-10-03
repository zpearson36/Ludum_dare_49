/// @description Insert description here
// You can write your code in this editor
switch state
{
	case SMOKESTATES.IDLE:
	{
		current_direction = DIRECTIONS.MOTIONLESS
		if(global.move_action and takeoverable != noone)
		{
			
			with(oPlayer)
			{
			    new_form(other.takeoverable)
			}
		}
		if(global.move_up)
		{
			yspd = -SMOKESPEED
			state = SMOKESTATES.MOVING
			current_direction = DIRECTIONS.UP
			break
		}
		if(global.move_down)
		{
			yspd = SMOKESPEED
			state = SMOKESTATES.MOVING
			current_direction = DIRECTIONS.DOWN
			break
		}
		if(global.move_left)
		{
			xspd = -SMOKESPEED
			state = SMOKESTATES.MOVING
			current_direction = DIRECTIONS.LEFT
			break
		}
		if(global.move_right)
		{
			xspd = SMOKESPEED
			state = SMOKESTATES.MOVING
			current_direction = DIRECTIONS.RIGHT
			break
		}
		break;
	}
	case SMOKESTATES.MOVING:
	{
		if(!global.move_right and !global.move_left and !global.move_up and !global.move_down)
		{
			state = SMOKESTATES.IDLE
			xspd = 0
			yspd = 0
			break;
		}
		if((global.move_right and current_direction != DIRECTIONS.RIGHT)
		or (global.move_left  and current_direction != DIRECTIONS.LEFT)
		or (global.move_up    and current_direction != DIRECTIONS.UP)
		or (global.move_down  and current_direction != DIRECTIONS.DOWN))
		{
			state = SMOKESTATES.IDLE
			xspd = 0
			yspd = 0
			break;
		}
		if(!just_created and collision_rectangle(x + (sign(xspd) * (SMOKEWIDTH / 2)), y - (SMOKEWIDTH / 2),
		                       x + (sign(xspd) * (SMOKEWIDTH / 2)) + xspd, y + (SMOKEWIDTH / 2),
			  				   oBarrier, false, false))
		{
			while(!collision_rectangle(x + (sign(xspd) * (SMOKEWIDTH / 2)), y - (SMOKEWIDTH / 2),
		                               x + (sign(xspd) * (SMOKEWIDTH / 2) + 1), y + (SMOKEWIDTH / 2),
							           oBarrier, false, false))
			{
				x += (sign(xspd) * 1)
			}
			state = SMOKESTATES.IDLE
			xspd = 0
			break;
		}
		if(!just_created and collision_rectangle(x - (SMOKEWIDTH / 2), y + (SMOKEWIDTH / 2),
		                       x + (SMOKEWIDTH / 2), y + (SMOKEWIDTH / 2) + yspd,
							   oBarrier, false, false))
	    {
			while(!collision_rectangle(x - (SMOKEWIDTH / 2), y + (SMOKEWIDTH / 2),
		                               x + (SMOKEWIDTH / 2), y + (SMOKEWIDTH / 2) + 1,
							           oBarrier, false, false))
			{
				y += 1
			}
			image_index = 0
			state = SMOKESTATES.IDLE
			break;
		}
		x += xspd
		y += yspd
	}
}

if(collision_rectangle(x + (sign(xspd_offset) * (SMOKEWIDTH / 2)), y - (SMOKEWIDTH / 2),
		               x + (sign(xspd_offset) * (SMOKEWIDTH / 2)) + xspd_offset, y + (SMOKEWIDTH / 2),
			  		   oBarrier, false, false))
{
	while(!collision_rectangle(x + (sign(xspd_offset) * (SMOKEWIDTH / 2)), y - (SMOKEWIDTH / 2),
		                       x + (sign(xspd_offset) * (SMOKEWIDTH / 2) + 1), y + (SMOKEWIDTH / 2),
							   oBarrier, false, false))
	{
		x += (sign(xspd_offset) * 1)
	}
	xspd_offset = 0
}
x += xspd_offset

if(collision_rectangle(x - (SMOKEWIDTH / 2), y + (SMOKEWIDTH / 2),
		                       x + (SMOKEWIDTH / 2), y + (SMOKEWIDTH / 2) + yspd_offset,
							   oBarrier, false, false))
{
	while(!collision_rectangle(x - (SMOKEWIDTH / 2), y + (SMOKEWIDTH / 2),
		                        x + (SMOKEWIDTH / 2), y + (SMOKEWIDTH / 2) + 1,
							    oBarrier, false, false))
	{
		y += 1
	}
	yspd_offset = 0
}
y += yspd_offset