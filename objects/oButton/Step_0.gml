/// @description Insert description here
// You can write your code in this editor
if(collision_rectangle(x - 10, y, x + 10, y - 16, oMassive, true, false))
{
	if(!pressed) audio_play_sound(ButtonPressed, 100000, false)
	pressed = true
	if(text_box_spawner != noone)
	{
		instance_destroy(text_box_spawner)
		text_box_spawner = noone
	}
}
else
{
	if(pressed) audio_play_sound(ButtonReleased, 100000, false)
	pressed = false
}