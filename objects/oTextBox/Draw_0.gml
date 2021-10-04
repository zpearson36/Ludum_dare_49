/// @description Insert description here
// You can write your code in this editor
draw_sprite(sprite_index, -1, x, y)
//draw_text(x + 25, y + 25, text)
for(var i = 0; i < array_length(txt_array); i++)
{
	draw_text(x + 25,
	    y + (25 * (1 + i)),
		txt_array[i])
}
draw_text(x + 25, y + (25 * (4 + i)), "(Press Any Button to Continue)")