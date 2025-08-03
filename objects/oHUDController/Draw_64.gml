//Hp 

if(global.floor_level != 0){
	draw_set_color(c_red);
	//draw_rectangle(20,20,180,50, 0)//(20, 20, "HP: " + string(global.PlayerHP));



	draw_rectangle(48,30,(global.PlayerHP /100) * 127 + 48,41, 0)//max: 127 px
	draw_sprite(sHealthbar, image_index, 20,20)

	//COMMENT

	//Inventory
	var items = global.PlayerInventory;
	var y_offset = 50;

	//draw_sprite(sKey, image_index, 20, 50);

	for(var i =0; i < array_length(global.PlayerInventory); i++){
		if(global.PlayerInventory[i] != undefined) draw_sprite(global.PlayerInventory[i], image_index, 20 + i*20, 50);
	}
}