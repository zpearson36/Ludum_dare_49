/// @description Insert description here
// You can write your code in this editor
/*mapBtns = []
array_push(mapBtns, instance_create_depth(x, y, -5000, oMainMenuButton))
mapBtns[0].txt = "BITCHES"*/
if(audio_is_playing(BGMusic2)) audio_stop_sound(BGMusic2)
audio_play_sound(BGMusic, 10000000, true)
menu_surface = surface_create(1, 1)

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 100;

menu_x = gui_width - gui_margin
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 25;
menu_font = fMainMenu;
menu_itemheight = font_get_size(fMainMenu);
menu_committed = -1;
menu_control = true;

menu[0] = instance_create_layer(menu_x - 150, menu_y - menu_itemheight * (0 * 1.5), layer, oMainMenuButton)
menu[1] = instance_create_layer(menu_x - 150, menu_y - menu_itemheight * (1 * 1.5), layer, oMainMenuButton)
menu[2] = instance_create_layer(menu_x - 150, menu_y - menu_itemheight * (2 * 1.5), layer, oMainMenuButton)
menu[3] = instance_create_layer(menu_x - 150, menu_y - menu_itemheight * (3 * 1.5), layer, oMainMenuButton)

menu[3].txt = "New Game"
menu[2].txt = "Controls"
menu[1].txt = "Credits"
menu[0].txt = "Quit"

menu[0].action = function(){game_end()}
menu[1].action = function(){}
menu[2].action = function(){}
menu[3].action = function(){audio_stop_sound(BGMusic); room_goto(LevelOne)}

menu_items = array_length_1d(menu)
menu_cursor = 3