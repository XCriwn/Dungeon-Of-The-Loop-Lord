
randomize();

global.floor_level = 1;

room_goto(Room1);

instance_create_layer(640, 1150, "Player", oPlayer);
window_set_fullscreen(1);


function reset_draw(){

draw_set_alpha(1);
draw_set_color(c_white);

}


global.lvl1_key_drop_chance = 25;
global.Secrets[0] = false;
global.Secrets[1] = false;
global.Secrets[2] = false;