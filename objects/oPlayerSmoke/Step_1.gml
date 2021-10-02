/// @description Insert description here
// You can write your code in this editor
c_color = c_yellow
takeoverable = collision_circle(x, y, SMOKEWIDTH / 2, oTakeoverable, false, false)
if(takeoverable != noone)
{
	c_color = c_lime
}