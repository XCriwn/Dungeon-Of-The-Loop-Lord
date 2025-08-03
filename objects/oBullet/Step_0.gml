if(deathTimer == 0){instance_destroy()}
else deathTimer --;

switch(facingDirectionBullet){

	case 0: direction = 0; image_angle = 0; break;
	case 1: direction = 180; image_angle = 180; break;
	case 2: direction = 270; image_angle = 270; break;
	case 3: direction = 90; image_angle = 90; break;

}

speed = 4;

//show_debug_message("facing direction = " + string(facingDirectionBullet));