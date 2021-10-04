/// @description Insert description here
// You can write your code in this editor
//text = "This function is the same as the collision_rectangle() function, only instead of just detecting one instance in collision at a time, it will detect multiple instances. You supply the x/y positions of the top left and bottom right of the area to check along with the object to check for, and you can set the check to be precise (in which case all instances being checked will need to have precise collision masks) and whether the check should include the calling instance or not."
//text2 = "You supply a DS list too, so the id values of any instances that are colliding with the calling instance will be added to the end of the given list. You can clear the list before calling this function so that it only contains results from this function call. You also have the option to order the instances based on their distances from the centre of the rectangular area to their origins. The function returns the number of instances found, or 0 if none are found."
txt_array = []
max_text_length = 78
can_exit = false
alarm[0] = 60
x = (room_width / 2) - 375
y = (room_height / 2) - 250
//show_debug_message(string_length(text))

function string_split(str, del)
{
	var string_array = []
	var starting_pos = 1
	while(string_pos_ext(del, str, starting_pos))
	{
		var pos = string_pos_ext(del, str, starting_pos)
		//show_debug_message(pos)
		array_push(string_array, string_copy(str, starting_pos, pos - starting_pos))
		starting_pos = pos + 1
	}
	array_push(string_array, string_copy(str, starting_pos, string_length(str)))
	return string_array
}

function add_text(str)
{
	var vocab_array = string_split(str, " ")
	show_debug_message(vocab_array)
	var tmp_string = vocab_array[0]
	var add_last_string = false
	for(var i = 1; i < array_length(vocab_array); i++)
	{
		if(string_length(tmp_string + " " + vocab_array[i]) <= max_text_length)
		{
			tmp_string = tmp_string + " " + vocab_array[i]
	        add_last_string = true
		}
		else
		{
			array_push(txt_array, tmp_string)
			tmp_string = vocab_array[i]
	        add_last_string = false
		}
	}
	if(add_last_string) array_push(txt_array, tmp_string)
}