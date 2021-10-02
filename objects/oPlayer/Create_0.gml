/// @description Insert description here
// You can write your code in this editor
form = instance_create_layer(x, y, layer, oPlayerSmoke)


function new_form(nf)
{
	var tmp = form
	form = instance_create_layer(x, y, layer, nf.player_body)
	instance_destroy(tmp)
	instance_destroy(nf)
}