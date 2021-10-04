/// @description Insert description here
// You can write your code in this editor
var text_box = instance_create_layer(x, y, layer_get_id("TextBox"), oTextBox)

for(var i = 0; i < array_length(text_list); i++)
{
	text_box.add_text(text_list[i])
}