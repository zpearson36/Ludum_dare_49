/// @description Insert description here
// You can write your code in this editor
if(state == CRAB_STATE.CLIMBINGWALLIDLE)
{
	var tmp_rot = 1
	if(image_angle == -180) tmp_rot = -1
    draw_rectangle_color(x - (CRABWIDTH / 2), y + (tmp_rot * (CRABHEIGHT / 2)),
		                 x + (CRABWIDTH / 2), y + (tmp_rot * (CRABHEIGHT / 2) + 5), c_blue, c_blue, c_blue, c_blue, false)
}