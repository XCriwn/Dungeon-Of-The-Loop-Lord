//if place_meeting(x,y, oPlayer) and !instance_exists(oTransition){
//	var instantiated = instance_create_depth(0,0, -9999, oTransition);
//	instantiated.target_x = target_x;
//	instantiated.target_y = target_y;
//	instantiated.target_rm = target_rm;
//	//show_debug_message("X = " + string(target_x) + " Y = " + string(target_y) + "target_rm = " + string(target_rm));

//	if(global.floor_level == 1) {
//		global.floor_level = 2;
//	}

//	if(global.floor_level == 2) {
//		global.floor_level = 3;
//	}

//	if(global.floor_level == 3) {
//		//TODO
//	}

//	if(global.floor_level == 4) {

//		//TODO
//	}
// //room_goto(target_rm);

//}

if place_meeting(x,y, oPlayer){
	
	if (global.floor_level == 1) {
		room_goto(Room2);
		}
		
	if(global.floor_level == 2) {
		room_goto(room3);
		}

	global.floor_level++;

}