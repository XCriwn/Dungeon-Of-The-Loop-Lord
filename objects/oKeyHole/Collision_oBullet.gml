
if(global.floor_level == 1){

	var isKey = false;

	for(var i =0; i < array_length(global.PlayerInventory); i++){
		if(global.PlayerInventory[i] == sKey) {isKey = true;}
	}

	if(isKey == true) {
		global.Secrets[0] = true; 
		instance_destroy(other); 
		audio_play_sound(sndHihihiha, 1, false);
	
		for(var i =0; i < array_length(global.PlayerInventory); i++){
			if(global.PlayerInventory[i] == sKey) global.PlayerInventory[i] = undefined;
		}
	}
}
else if(global.floor_level == 2){

	global.Secrets[1] = true;
	audio_play_sound(sndHihihiha, 1, false);
	instance_destroy(other); 

}
else if(global.floor_level == 3){

	global.Secrets[2] = true;
	audio_play_sound(sndHihihiha, 1, false);
	instance_destroy(other); 

}

if(global.Secrets[0] = true and global.Secrets[1] = true and global.Secrets[2] = true){
	
	global.floor_level = 4;
	room_goto(Room4);
	oPlayer.x = 640;
	oPlayer.y = 1000;

}