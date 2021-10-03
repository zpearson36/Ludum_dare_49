/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(vk_right)
   or keyboard_check(ord("D")))
{
	global.move_right = true
}
if(keyboard_check(vk_left)
   or keyboard_check(ord("A")))
{
	global.move_left = true
}
if(keyboard_check(vk_up)
   or keyboard_check(ord("W")))
{
	global.move_up = true
}
if(keyboard_check(vk_down)
   or keyboard_check(ord("S")))
{
	global.move_down = true
}
if(keyboard_check(vk_shift))
{
	global.move_jump = true
}
if(keyboard_check_pressed(vk_space))
{
	global.move_action = true
}
if(keyboard_check(ord("Q")))
{
    global.move_leave  = true
}
if(keyboard_check(ord("R")))
{
	game_restart()
}