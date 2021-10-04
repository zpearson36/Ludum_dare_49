/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(vk_right)
   or keyboard_check(ord("D"))
   or gamepad_axis_value(0,gp_axislh) > .3)
{
	global.move_right = true
}
if(keyboard_check(vk_left)
   or keyboard_check(ord("A"))
   or gamepad_axis_value(0,gp_axislh) < -.3)
{
	global.move_left = true
}
if(keyboard_check(vk_up)
   or keyboard_check(ord("W"))
   
   or gamepad_axis_value(0,gp_axislv) < -.3)
{
	global.move_up = true
}
if(keyboard_check(vk_down)
   or keyboard_check(ord("S"))
   or gamepad_axis_value(0,gp_axislv) > .3)
{
	global.move_down = true
}
if(keyboard_check(vk_shift)
   or gamepad_button_check(0,gp_face1))
{
	global.move_jump = true
}
if(keyboard_check_pressed(vk_space)
   or gamepad_button_check_pressed(0,gp_face4))
{
	global.move_action = true
}
if(keyboard_check_pressed(vk_tab)
   or gamepad_button_check_pressed(0,gp_face3))
{
	global.move_action2 = true
}
if(keyboard_check_pressed(ord("Q"))
   or gamepad_button_check_pressed(0,gp_face2))
{
    global.move_takeover  = true
}
if(keyboard_check_pressed(ord("R"))
   or gamepad_button_check_pressed(0,gp_select))
{
	global.reset_position = true
}
if(keyboard_check_pressed(vk_enter)
   or gamepad_button_check_pressed(0,gp_face1))
{
	global.move_select = true
}