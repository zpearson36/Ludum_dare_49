/// @description Insert description here
// You can write your code in this editor
if(ok_to_raise and raised < height)
{
	y -= 1
	raised += 1
	audio_play_sound(DoorSliding, 100000, false)
}
if(!ok_to_raise and raised > 0)
{
	y += 1
	raised -= 1
	audio_play_sound(DoorSliding, 100000, false)
}