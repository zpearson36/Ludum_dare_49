/// @description Insert description here
// You can write your code in this editor
form = instance_create_layer(x, y, layer, oPlayerSmoke)
is_smoke = true

coef = 0
function new_form(nf)
{
	var tmp = form
	form = instance_create_layer(x, y, layer, nf.player_body)
	if(nf.object_index == oSlime.object_index)
	{
		form.splits_left = nf.splits_left
		if(nf.slime_index != -1) form.slime_index = nf.slime_index
		form.copies = ds_list_create()
		for(var i = 0; i < ds_list_size(nf.copies); i++)
		{
			form.copies[| i] = nf.copies[| i]
		}
	}
	instance_destroy(tmp)
	instance_destroy(nf)
	is_smoke = false
}

function leave_form()
{
	var tmp = form
	form = instance_create_layer(x, y, layer, oPlayerSmoke)
	is_smoke = true
	var new_tmp = instance_create_layer(x, y, layer, tmp.form_type)
	if(tmp.form_type.object_index == oSlime.object_index)
	{
		new_tmp.splits_left = tmp.splits_left
		new_tmp.slime_index = tmp.slime_index
		new_tmp.copies = ds_list_create()
		for(var i = 0; i < ds_list_size(tmp.copies); i++)
		{
			new_tmp.copies[| i] = tmp.copies[| i]
		}
	}
	instance_destroy(tmp)
}