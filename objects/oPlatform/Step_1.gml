/// @description Insert description here
// You can write your code in this editor
with oMassive
{
	if(collision_rectangle(other.bbox_left, other.bbox_top, other.bbox_right, other.bbox_top - 5, self, false, false))
	{
		array_push(other.riding_list, self)
	}
}

for(var i = 0; i < array_length(button_list); i++)
{
	if(i == 0) ok_to_move = button_list[i].pressed
	else ok_to_move = ok_to_move and button_list[i].pressed
}