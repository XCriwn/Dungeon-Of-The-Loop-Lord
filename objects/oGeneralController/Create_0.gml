if (instance_number(oGeneralController) > 2) {
    instance_destroy()
}

randomize();

global.floor_level = 4;

room_goto(Room4);

if(global.floor_level == 1) instance_create_layer(640, 1150, "Player", oPlayer);
if(global.floor_level == 2) instance_create_layer(640, 940, "Player", oPlayer);
if(global.floor_level == 3) instance_create_layer(600, 900, "Player", oPlayer);
if(global.floor_level == 4) instance_create_layer(640, 1000, "Player", oPlayer);

window_set_fullscreen(1);

global.lvl1_key_drop_chance = 25;
global.Secrets[0] = false;
global.Secrets[1] = false;
global.Secrets[2] = false;

//if (instance_number(oGeneralController) > 1) {
//    instance_destroy(); // Prevent duplicates if another was placed by accident
//}
