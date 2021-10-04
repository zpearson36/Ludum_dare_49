/// @description Insert description here
// You can write your code in this editor
player_body = oPlayerSlime
state = SLIME_STATE.IDLE
splits_left = 1
slime_index = -1
copies = ds_list_create()
xspd = 0
yspd = 0

text_box_spawner = noone

function to_player_slime(prev_slime)
{
	var tmp = instance_create_layer(x, y, layer, oPlayerSlime)
	tmp.splits_left = splits_left
	tmp.slime_index = slime_index
	for(var i = 0; i < ds_list_size(copies); i++)
	{
		
		if(copies[| i].id != prev_slime) ds_list_add(tmp.copies, copies[| i])
	}
	/*var index = ds_list_find_index(prev_slime.copies, self)
	ds_list_delete(prev_slime.copies, index)*/
	with(tmp)
	{
		ds_list_add(prev_slime.copies, self)
	}
	oPlayer.form = tmp
	instance_destroy()
}