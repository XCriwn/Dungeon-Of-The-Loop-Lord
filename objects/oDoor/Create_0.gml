if(global.floor_level == 1) image_index = 0;
if(global.floor_level == 2) image_index = 4;


var warp = instance_create_layer(x + sprite_width/2,y + sprite_height/2,"Tiles", oWarp);
//with warp{
//		target_x = 400;
//		target_y = 400;
//		target_rm = Room2;
//	}



//warp.target_rm = noone;
//warp.target_x = 0;
//warp.target_y = 0;

//if(global.floor_level == 1) {

//	warp.target_rm = Room2;
//	warp.target_x = 500;
//	warp.target_y = 500;

//}

//if(global.floor_level == 2) {

//	warp.target_rm = room3;
//	warp.target_x = 500;
//	warp.target_y = 500;

//}

//if(global.floor_level == 3) {

//	//warp.target_rm = Room4;
//	//warp.target_x = 0;
//	//warp.target_y = 0;

//}

//if(global.floor_level == 4) {

//	warp.target_rm = noone;
//	warp.target_x = 0;
//	warp.target_y = 0;

//}
