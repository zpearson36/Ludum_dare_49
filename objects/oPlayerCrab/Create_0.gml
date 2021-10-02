/// @description Insert description here
// You can write your code in this editor
enum CRAB_STATE
{
	IDLE                   = 0,
	WALKING                = 1,
	FALLING                = 2,
	CLIMBINGWALLIDLE       = 3,
	CLIMBINGWALLWALKING    = 4,
	CLIMBINGCEILINGIDLE    = 5,
	CLIMBINGCEILINGWALKING = 6
}
form_type = oCrab
state = CRAB_STATE.IDLE
xspd = 0
yspd = 0