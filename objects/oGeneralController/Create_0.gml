
randomize();

global.floor_level = 1;

if(global.floor_level == 1) room_goto(Room1);
if(global.floor_level == 2) room_goto(Room2);
if(global.floor_level == 3){} //room_goto(Room1);

if(global.floor_level == 1 and !instance_exists(oPlayer)) instance_create_layer(640, 1150, "Player", oPlayer);
if(global.floor_level == 2 and !instance_exists(oPlayer)) instance_create_layer(640, 1150, "Player", oPlayer);
if(global.floor_level == 3 and !instance_exists(oPlayer)) instance_create_layer(640, 1150, "Player", oPlayer);

show_debug_message("IT RAN: " + string(global.floor_level));


window_set_fullscreen(1);

global.lvl1_key_drop_chance = 25;
global.Secrets[0] = false;
global.Secrets[1] = false;
global.Secrets[2] = false;

//if (instance_number(oGeneralController) > 1) {
//    instance_destroy(); // Prevent duplicates if another was placed by accident
//}
