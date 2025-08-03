z_key = keyboard_check(vk_enter) or keyboard_check(ord("Z"));

if(z_key) {room_goto(Room1); global.floor_level=1; instance_create_layer(640, 1150, "Player", oPlayer);}