var isKey = false;

for(var i =0; i < array_length(global.PlayerInventory); i++){
	if(global.PlayerInventory[i] == sKey) isKey = true;
}

if(irandom(100) < global.lvl1_key_drop_chance and !isKey and !global.Secrets[0]){

	array_push(global.PlayerInventory, sKey);

}

if (global.PlayerHP < 100) {
    global.PlayerHP += 3;
    if (global.PlayerHP > 100) {
        global.PlayerHP = 100;
    }
}