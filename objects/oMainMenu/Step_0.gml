/// @description Insert description here
// You can write your code in this editor
if(menu_control)
{
	if(global.move_up)
	{
		menu_control = false
		alarm[0] = 15
		menu_cursor += 1
		if(menu_cursor >= menu_items) menu_cursor = 0
	}
	if(global.move_down)
	{
		menu_control = false
		alarm[0] = 15
		menu_cursor -= 1
		if(menu_cursor < 0) menu_cursor = menu_items - 1
	}
	if(global.move_select or global.move_action)
	{
		menu[menu_cursor].action()
	}
}
