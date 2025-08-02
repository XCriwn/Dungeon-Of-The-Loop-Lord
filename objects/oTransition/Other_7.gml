//anim end
if(room != target_rm) room_goto(target_rm);

show_debug_message("X = " + string(target_x) + " Y = " + string(target_y) + 
	"target_rm = " + string(target_rm));
	
oPlayer.x = target_x;
oPlayer.y = target_y;


//fade out

image_speed = -1;