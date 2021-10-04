/// @description Insert description here
// You can write your code in this editor
if(height > 0)
{
	if(ok_to_move and raised < height)
	{
		y -= 1
		for(var i = 0; i < array_length(riding_list); i++)
		{
			riding_list[i].state = CRAB_STATE.IDLE
			riding_list[i].y -= 1
		}
		
		raised += 1
		//audio_play_sound(DoorSliding, 100000, false)
	}
	if(!ok_to_move and raised > 0)
	{
		for(var i = 0; i < array_length(riding_list); i++)
		{
			riding_list[i].y += 1
		}
		y += 1
		raised -= 1
		//audio_play_sound(DoorSliding, 100000, false)
	}
}
if(distance > 0)
{
	if(ok_to_move and moved < abs(distance))
	{
		for(var i = 0; i < array_length(riding_list); i++)
		{
			riding_list[i].x += 1 * sign(distance)
		}
		x += 1 * sign(distance)
		moved += 1
		//audio_play_sound(DoorSliding, 100000, false)
	}
	if(!ok_to_move and moved > 0)
	{
		for(var i = 0; i < array_length(riding_list); i++)
		{
			riding_list[i].x -= 1 * sign(distance)
		}
		x -= 1 * sign(distance)
		moved += 1
		//audio_play_sound(DoorSliding, 100000, false)
	}
}
