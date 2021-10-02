/// @description Insert description here
// You can write your code in this editor
enum PLAYER_STATE
{
	IDLE            = 0,
	WALKING         = 1,
	CROUCHING       = 2,
	CROUCHED        = 3,
	CROUCHEDWALKING = 4,
	JUMPING         = 5,
	FALLING         = 6,
	LANDING         = 7
}

state = PLAYER_STATE.IDLE
xspd = 0
yspd = 0