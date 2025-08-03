z_key = keyboard_check(vk_enter) or keyboard_check(ord("Z"));

if(z_key) {room_goto(Room1); instance_create_layer(640, 1150, "Player", oPlayer); global.floor_level = 1;}