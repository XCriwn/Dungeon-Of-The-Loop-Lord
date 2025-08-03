/// @description Movement and keyboard inputs for it

if(global.PlayerHP <= 0) {room_goto(GameOver); instance_destroy()}

right_key = keyboard_check(vk_right) or keyboard_check(ord("D"));
left_key = keyboard_check(vk_left) or keyboard_check(ord("A"));
up_key = keyboard_check(vk_up) or keyboard_check(ord("W"));
down_key = keyboard_check(vk_down) or keyboard_check(ord("S"));
z_key = keyboard_check(vk_enter) or keyboard_check(ord("Z"));
x_key = keyboard_check(ord("X"));
var runKey = ord("X");

xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;

if(z_key and shooting == false) {
	shooting = true;
	can_move = false;
	global.facingDirectionBullet = facingDirection;
	switch(facingDirection){
		case 0: sprite_index = sPlayerGunRight; break;
		case 1: sprite_index = sPlayerGunLeft; break;
		case 2: sprite_index = sPlayerGunDown; break;
		case 3: sprite_index = sPlayerGunUp; break;
		default: break;
	}
	image_index = 0;
}
if(shooting){
	//show_debug_message("image index: " + string(image_index) + " sprite_index: " + string(sprite_index));
	if(image_index == 3) {
		var bullet = instance_create_layer(x, y,"Enemies", oBullet)
		audio_play_sound(sndBullet, 1, false);
	}
	if(image_index >= 5) {
		can_move = true;
		shooting = false; 
	}
	
}

if(can_move){
	
	//Check for running
	if(keyboard_check(runKey)){
		
		xspd = round(xspd * 1.5);
		yspd = round(yspd * 1.5);
	}
	
	//Sprite check
	if xspd > 0 {sprite_index = sPlayerRight; facingDirection = 0} 
	else if xspd < 0 {sprite_index = sPlayerLeft; facingDirection = 1}
	else if yspd > 0 {sprite_index = sPlayerDown; facingDirection = 2}
	else if yspd < 0 {sprite_index = sPlayerUp; facingDirection = 3}
	
	if (xspd == 0 and yspd == 0) {
		switch(facingDirection){
		case 0: sprite_index = sPlayerIdleRight; break;
		case 1: sprite_index = sPlayerIdleLeft; break;
		case 2: sprite_index = sPlayerIdleDown; break;
		case 3: sprite_index = sPlayerIdleUp; break;
		default: break;
		}
	}

	//Collision
	if place_meeting(x+xspd, y, oWall){
		xspd = 0;
	}

	if place_meeting(x, y+yspd, oWall){
		yspd = 0;
	}


	if(xspd != 0 or yspd != 0) {
		image_speed = 1;
		if(keyboard_check(runKey) and !shooting) image_speed = 2;
	} else{
		image_speed = 1;
	}

	x += xspd;
	y += yspd;
	global.PlayerPositionX = x;
	global.PlayerPositionY = y;
	//show_debug_message("x= " + string(x) + "y= " + string(y))
	//show_debug_message("x= " + string(global.PlayerPositionX) + "y= " + string(global.PlayerPositionY))
	
	//if(keyboard_check_pressed(ord("Q") && room = rShadowWorld)){
		
	//}
	
}


var cam = view_camera[0]
var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

// Center on the player
var cam_x = x - cam_w / 2;
var cam_y = y - cam_h / 2;

//check the room to not be smaller

var offset_x= room_width - cam_w, offset_y = room_height - cam_h;

if(room_width < cam_w) offset_x = offset_x/2;
if(room_height < cam_h) offset_y = offset_y/2;

// Optional: clamp to room size
cam_x = clamp(cam_x, 0, offset_x);
cam_y = clamp(cam_y, 0, offset_y);

// Apply to camera
camera_set_view_pos(view_camera[0], cam_x, cam_y);

//DEBUG ONLY
//if(counter % 60 == 0) {
//	show_debug_message("x= " + string(oPlayer.x) + "y = " + string(oPlayer.y))
//}
//counter ++;

//show_debug_message("x= " + string(xspd) + " ; y = " + string(yspd) + " ; speed = " + string(move_spd))