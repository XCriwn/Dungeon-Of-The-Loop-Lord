var isKey = false;


for(var i =0; i < array_length(global.PlayerInventory); i++){
	if(global.PlayerInventory[i] == sKey) {isKey = true;}
}

if(isKey == true) {
	global.Secrets[0] = true; 
	instance_destroy(other); 
	audio_play_sound(sHihihiha, 1, false);
	
	for(var i =0; i < array_length(global.PlayerInventory); i++){
		if(global.PlayerInventory[i] == sKey) global.PlayerInventory[i] = undefined;
	}
}