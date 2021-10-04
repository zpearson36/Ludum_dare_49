/// @description Insert description here
// You can write your code in this editor
if
(
(
global.move_jump      or
global.move_action    or
global.move_action2   or
global.move_takeover  or
global.move_select    or
global.reset_position
) and
can_exit
)
{
	instance_destroy()
}