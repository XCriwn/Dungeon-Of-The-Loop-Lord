// Destroy enemy if HP is 0
if (HP <= 0) {
	if(sprite_index != Elvl3Death) {sprite_index = Elvl3Death; image_speed = 1; image_index = 0;}
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
    if (angle >= 45 && angle < 135) sprite_index = Elvl3B;
    else if (angle >= 135 && angle < 225) sprite_index = Elvl3L;
    else if (angle >= 225 && angle < 315) sprite_index = elvl3F;
    else sprite_index = Elvl3R;
}

// ====== PLAYER PROXIMITY ATTACK DIRECTION ======
player_proximity = -1;
if (dist <= range) {
    if (angle >= 45 && angle < 135) player_proximity = 1;   // Up
    else if (angle >= 135 && angle < 225) player_proximity = 2; // Left
    else if (angle >= 225 && angle < 315) player_proximity = 3; // Down
    else player_proximity = 0; // Right
}

// ====== MOVEMENT ======
if (!shooting && dist <= detect_range && dist > range && can_move) {
    var move_x = lengthdir_x(1, angle);
    var move_y = lengthdir_y(1, angle);

    // Wall collision check
    if (!place_meeting(x + move_x, y, oWall) and !place_meeting(x + move_x, y, oPlayer)  and !place_meeting(x + move_x, y, oEnemyLvl3)) {
        x += move_x;
    }

    if (!place_meeting(x, y + move_y, oWall) and !place_meeting(x, y + move_y, oPlayer) and !place_meeting(x, y + move_y, oEnemyLvl3)) {
        y += move_y;
    }
}

// ====== ATTACKING / PUNCHING ANIMATION ======
if (player_proximity >= 0 && !shooting) {
    shooting = true;
    can_move = false;
    
    switch (player_proximity) {
        case 0: sprite_index = Elvl3atckR; break;
        case 1: sprite_index = Elvl3atckB; break;
        case 2: sprite_index = Elvl3atckB; break;
        case 3: sprite_index = Elvl3atckF; break;
    }
    
    image_speed = 1; // Optional: control animation speed
    image_index = 0;
}

if (shooting) {
    attack_timer++;

    
    if (!attack_done && attack_timer == 10 && dist <= range) {
        global.PlayerHP -= damage;
        attack_done = true;
    }

    // End attack after, say, 20 frames
    if (attack_timer >= 25) {
        shooting = false;
        can_move = true;
        player_proximity = -1;
        attack_timer = 0;
        attack_done = false;
    }
}