/// @description Insert description here
// You can write your code in this editor
enum SLIME_STATE
{
	IDLE            = 0,
	WALKING         = 1,
	CROUCHING       = 2,
	CROUCHED        = 3,
	CROUCHEDWALKING = 4,
	JUMPING         = 5,
	FALLING         = 6,
	LANDING         = 7,
	SPLITTING       = 8,
	SPLITFINISH     = 9,
	ABSORBING       = 10,
	ABSORBED        = 11
}
in_tight_spot = false
splits_left = 1
copies = []
form_type = oSlime
state = SLIME_STATE.IDLE
xspd = 0
yspd = 0
can_reabsorb = false
image_blend = c_white