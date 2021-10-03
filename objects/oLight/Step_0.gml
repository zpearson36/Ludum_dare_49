/// @description Insert description here
// You can write your code in this editor
for(var i = 0; i < array_length(button_list); i++)
{
	if(i == 0) is_green = button_list[i].is_pressed
	else is_green = is_green and button_list[i].is_pressed
}