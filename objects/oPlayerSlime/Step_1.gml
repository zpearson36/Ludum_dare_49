/// @description Insert description here
// You can write your code in this editor
image_blend = c_white
can_reabsorb = false
if(collision_circle(x, y, SLIMEHEIGHT, oSlime, false, false))
{
	can_reabsorb = true
	image_blend = c_green
}