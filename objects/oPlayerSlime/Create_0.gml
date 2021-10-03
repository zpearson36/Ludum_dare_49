/// @description Insert description here
// You can write your code in this editor
enum SLIME_STATE
{
	IDLE            = 0,
	WALKING         = 1,
	CROUCHING       = 2,
	CROUCHED        = 3,
	CROUCHEDWALKING = 4,
	JUMPING         = 5,
	FALLING         = 6,
	LANDING         = 7,
	SPLITTING       = 8,
	SPLITFINISH     = 9,
	ABSORBING       = 10,
	ABSORBED        = 11
}
slime_index = 0
in_tight_spot = false
splits_left = 1
copies = ds_list_create()
form_type = oSlime
state = SLIME_STATE.IDLE
xspd = 0
yspd = 0
can_reabsorb = false
image_blend = c_white

function switch_to_copy()
{
	var tmp_index = slime_index + 1
	if (tmp_index > ds_list_size(copies)) tmp_index = 0
	var next_copy = noone
	for(var i = 0; i < ds_list_size(copies); i++)
	{
		if(copies[| i].slime_index == tmp_index) next_copy = copies[| i]
	}
	
	if(next_copy == noone)
	{
		return;
	}
	
	var tmp_self_id = self.id
	var tmp_next_id = next_copy.id
	next_copy.to_player_slime(tmp_self_id)
	to_slime(tmp_next_id)
}

function to_slime(prev_slime)
{
	var tmp = instance_create_layer(x, y, layer, oSlime)
	tmp.splits_left = splits_left
	tmp.slime_index = slime_index
	for(var i = 0; i < ds_list_size(copies); i++)
	{
		if(copies[| i].id != prev_slime) ds_list_add(tmp.copies, copies[| i])
	}
	var index = ds_list_find_index(oPlayer.form.copies, self)
	ds_list_delete(oPlayer.form.copies, index)
	with(tmp)
	{
		ds_list_add(oPlayer.form.copies, self)
	}
	instance_destroy()
}

function remove_from_copies_list(old_id)
{
	if(slime_index > old_id.slime_index) slime_index -= 1
	var tmp = ds_list_create()
	for(var i = 0; i < ds_list_size(copies); i++)
	{
		if(copies[| i].id != old_id.id) ds_list_add(tmp, copies[| i])
	}
	var tmp2 = copies
	copies = tmp
	ds_list_destroy(tmp2)
}