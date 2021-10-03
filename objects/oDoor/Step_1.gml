/// @description Insert description here
// You can write your code in this editor
for(var i = 0; i < array_length(light_list); i++)
{
	if(i == 0) ok_to_raise = light_list[i].is_green
	else ok_to_raise = ok_to_raise and light_list[i].is_green
}