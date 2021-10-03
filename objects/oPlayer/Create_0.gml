/// @description Insert description here
// You can write your code in this editor
form = instance_create_layer(x, y, layer, oPlayerSmoke)
is_smoke = true


function new_form(nf)
{
	var tmp = form
	form = instance_create_layer(x, y, layer, nf.player_body)
	if(nf.object_index == oSlime.object_index) form.splits_left = nf.splits_left
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
	if(tmp.form_type.object_index == oSlime.object_index) new_tmp.splits_left = tmp.splits_left
	instance_destroy(tmp)
}