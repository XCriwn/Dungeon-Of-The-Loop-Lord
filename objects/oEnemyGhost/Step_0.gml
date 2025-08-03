// Destroy enemy if HP is 0
if (HP <= 0) {
	if(sprite_index != GhostDeath) {sprite_index = GhostDeath; image_speed = 1; image_index = 0;}
	if(image_index >= image_number - 1) {
		instance_destroy()
	}
	exit;
}

// Find player
var player = instance_nearest(x, y, oPlayer);
if (player == noone) exit;

// Distance to player
var dist = point_distance(x, y, player.x, player.y);

// Calculate angle early
var angle = point_direction(x, y, player.x, player.y);

// Update sprite based on angle (when not attacking)
if (!shooting) {
    if (angle >= 45 && angle < 135) sprite_index = GhostUp;
    else if (angle >= 135 && angle < 225) sprite_index = GhostLeft;
    else if (angle >= 225 && angle < 315) sprite_index = GhostDown;
    else sprite_index = GhostatckRight;
}

// Atack direction
player_proximity = -1;
if (dist <= range) {
    if (angle >= 45 && angle < 135) player_proximity = 1;   // Up
    else if (angle >= 135 && angle < 225) player_proximity = 2; // Left
    else if (angle >= 225 && angle < 315) player_proximity = 3; // Down
    else player_proximity = 0; // Right
}

// Movement
if (!shooting && dist <= detect_range && dist > range && can_move) {
    var move_x = lengthdir_x(0.75, angle);
    var move_y = lengthdir_y(0.75, angle);

    // Wall collision check
    if (!place_meeting(x + move_x, y, oWall) and !place_meeting(x + move_x, y, oPlayer)  and !place_meeting(x + move_x, y, oEnemyGhost)) {
        x += move_x;
    }

    if (!place_meeting(x, y + move_y, oWall) and !place_meeting(x, y + move_y, oPlayer) and !place_meeting(x, y + move_y, oEnemyGhost)) {
        y += move_y;
    }
}

//Attacking animation
if (player_proximity >= 0 && !shooting) {
    shooting = true;
    can_move = false;
    
    switch (player_proximity) {
        case 0: sprite_index = GhostatckRight; break;
        case 1: sprite_index = GhostatckUp; break;
        case 2: sprite_index = GhostatckLeft; break;
        case 3: sprite_index = GhostatckDown; break;
    }
    
    image_speed = 1; // Optional: control animation speed
    image_index = 0;
}

if (shooting) {
    // Damage player at frame 3
    if (image_index >= 1 && image_index < 1.5 && dist <= range) {
        global.PlayerHP -= damage;
    }

    // Reset after animation ends
    if (image_index >= image_number - 1) {
        shooting = false;
        can_move = true;
        player_proximity = -1;
        image_index = 0;
        image_speed = 0.2;
    }
}