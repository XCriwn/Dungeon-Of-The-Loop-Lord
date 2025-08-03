facingDirectionBullet = global.facingDirectionBullet;

switch(facingDirectionBullet){

	case 0: direction = 0; image_angle = 0; break;
	case 1: direction = 45; image_angle = 45; break;
	case 2: direction = 90; image_angle = 90; break;
	case 3: direction = 135; image_angle = 135; break;
	case 4: direction = 180; image_angle = 180; break;
	case 5: direction = 225; image_angle = 225; break;
	case 6: direction = 270; image_angle = 270; break;
	case 7: direction = 315; image_angle = 315; break;

}

deathTimer = 180;
bulletDamage = 35;

rand = irandom(3);
