/// @description Insert description here
// You can write your code in this editor
enum SMOKESTATES
{
	IDLE   = 0,
	MOVING = 1
}

enum DIRECTIONS
{
	MOTIONLESS,
	UP,
	DOWN,
	LEFT,
	RIGHT
}

state = SMOKESTATES.IDLE
xspd = 0
yspd = 0
c_color = c_yellow
current_direction = DIRECTIONS.MOTIONLESS
takeoverable = noone
just_created = true