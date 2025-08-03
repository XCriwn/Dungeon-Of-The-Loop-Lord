step_countdown = 600;
max_step_countdown = 600;


// Room dimensions (in pixels)
room_width_px = room_width;
room_height_px = room_height;

// Tile size
tile_size = 32;

// Number of tiles horizontally and vertically
tiles_x = room_width_px div tile_size;
tiles_y = room_height_px div tile_size;


if(global.floor_level == 1) {createLevelOne(); setWall(); setKeyHole(); setDoor(); createEnemies("goblin", 10);}
else if(global.floor_level == 2) {createLevelTwo(); setWall(); setKeyHole(); setDoor();}
else if(global.floor_level == 3) {createLevelThree(); setWall(); setKeyHole(); setDoor();}
else if(global.floor_level == 4) {createLevelFour(); setWall(); }


setInstances()

function randomiseTile(){
	//returns 1,2,3
	//1 is the base
	random_var = irandom_range(1,10)
	if (random_var <= 7) {return 1;}
	if (random_var <= 9) {return 2;}
	return 3;
	
}

function randomiseTilelvl2(){
	//returns 4,5,6
	//1 is the base
	random_var = irandom_range(1,10)
	if (random_var <= 5) {return 4;}
	if (random_var <= 8) {return 5;}
	return 6;
	
}
function randomiseTilelvl3(){
	//returns 7,8,9
	//1 is the base
	random_var = irandom_range(1,10)
	if (random_var <= 5) {return 7;}
	if (random_var <= 8) {return 8;}
	return 9;
	
}


function createLevelOne(){
	// MAX WIDTH/HEIGHT IS 39; 39 FILLS ENTIRE BOARD WITH TILES

	// Create 2D tile array
	global.tile_array = array_create(tiles_x);

	for (var i = 0; i < tiles_x; i++) {
	    global.tile_array[i] = array_create(tiles_y);
	    for (var j = 0; j < tiles_y; j++) { //j are lines, i are columns
	        // Initialize each tile (e.g., 0 = empty (void), 1 = path(1), 2= path(2), 3= path(3), 4 = wall(1), 5 = w2, 6 = w3)
	        global.tile_array[i][j] = 0;
			if(!createEllipse(i,j,7) and i>6 and j>6 and i<34 and j<35) global.tile_array[i][j] = randomiseTile();
			if(i> 15 and i<25 and j>33 and j<39) global.tile_array[i][j] = randomiseTile();
	    }
	}
}


function createLevelTwo(){
	global.tile_array = array_create(tiles_x);

	for (var i = 0; i < tiles_x; i++) {
	    global.tile_array[i] = array_create(tiles_y);
	    for (var j = 0; j < tiles_y; j++) {
	        global.tile_array[i][j] = 0;

	        
	        var corridor_width = 9;
	        var corridor_height = 7;

	        // Vertical left corridor
	        var inLeftVertical = (i >= 2 && i < 2 + corridor_width) && (j >= 2 && j <= 35);

	        // Central horizontal corridor
	        var inHorizontalMiddle = (j >= 10 && j < 10 + corridor_height) && (i >= 2 && i <= 35);

	        // Central vertical corridor 
	        var inCenterVertical = (i >= 18 && i < 18 + corridor_width) && (j >= 5 && j <= 30);

	        // Top horizontal branch
	        var inTopBranch = (j >= 5 && j < 5 + corridor_height) && (i >= 18 && i <= 35);

	        // Bottom horizontal branch
	        var inBottomBranch = (j >= 15 && j < 15 + corridor_height) && (i >= 18 && i <= 35);

	        if (inLeftVertical || inHorizontalMiddle || inCenterVertical || inTopBranch || inBottomBranch) {
	            global.tile_array[i][j] = randomiseTilelvl2();
	        }
	    }
	}
}

function createLevelThree(){
	global.tile_array = array_create(tiles_x);

	for (var i = 0; i < tiles_x; i++) {
	    global.tile_array[i] = array_create(tiles_y);
	    for (var j = 0; j < tiles_y; j++) {
	        global.tile_array[i][j] = 0;

	        // TALLER ROOM & CORRIDOR REGIONS
	        var inLeftRoom = (i >= 2 && i < 20) && (j >= 2 && j < 35);
	        var inMiddleCorridor = (i >= 20 && i < 36) && (j >= 12 && j < 25);
	        var inRightRoom = (i >= 36 && i < 52) && (j >= 2 && j < 35);

	        // SHRUNKEN & CENTERED VOIDS
	        var inTopLeftVoid = (i >= 7 && i < 12) && (j >= 6 && j < 11);
	        var inBottomLeftVoid = (i >= 7 && i < 12) && (j >= 26 && j < 31);
	        var inMiddleVoid = (i >= 27 && i < 30) && (j >= 16 && j < 21);
	        var inRightVoid = (i >= 42 && i < 46) && (j >= 13 && j < 24);

	        // FINAL TILE DECISION
	        var inPlayableArea = 
	            (inLeftRoom || inMiddleCorridor || inRightRoom)
	            && !(inTopLeftVoid || inBottomLeftVoid || inMiddleVoid || inRightVoid);

	        if (inPlayableArea) {
	            global.tile_array[i][j] = randomiseTilelvl3();
	        }
	    }
	}
}



	
function createLevelFour() {
	alarm[0] = 3;
 
    global.tile_array = array_create(tiles_x);

    for (var i = 0; i < tiles_x; i++) {
        global.tile_array[i] = array_create(tiles_y);
        for (var j = 0; j < tiles_y; j++) {
         
            if (createEllipse(i, j, 16)) {
                global.tile_array[i][j] = randomiseTilelvl3(); 
            } else {
                global.tile_array[i][j] = 0; 
            }
        }
    }
}
	
function createEllipse(i,j,radius){

    var center_x = tiles_x div 2;
    var center_y = tiles_y div 2;
    //var radius = min(tiles_x, tiles_y) div 2 - 2; // avoid hitting borders

    // Calculate distance from center
    var dx = i - center_x;
    var dy = j - center_y;
    var dist = sqrt(dx*dx + dy*dy);

    if (dist <= radius) {
        // Inside the circle → assign a random tile
        return 1;
    }
	return 0;
}

function setWall(){
	
	for (var i = 1; i < tiles_x-1; i++) {
	    for (var j = 1; j < tiles_y-1; j++) {
			if((global.tile_array[i][j] != 0) and (global.tile_array[i][j+1] == 0 or global.tile_array[i][j-1] == 0 or 
			global.tile_array[i+1][j] == 0 or global.tile_array[i-1][j] == 0 or
			global.tile_array[i+1][j+1] == 0 or global.tile_array[i+1][j-1] == 0 or 
			global.tile_array[i-1][j+1] == 0 or global.tile_array[i-1][j-1] == 0)){
				if(global.floor_level == 1)global.tile_array[i][j] = randomiseTile() * (-1); //NEGATIVE VALUES WILL BE WALLS
				if(global.floor_level == 2)global.tile_array[i][j] = randomiseTilelvl2() * (-1);
				if(global.floor_level == 3)global.tile_array[i][j] = randomiseTilelvl3() * (-1);
				if(global.floor_level == 4)global.tile_array[i][j] = randomiseTilelvl3() * (-1);
			}
		}
	}
}

function setKeyHole() {
	var candidates = [];

	// Gather all valid wall positions into an array
	for (var i = 1; i < tiles_x - 1; i++) {
		for (var j = 1; j < tiles_y - 1; j++) {
			var invalid = 0;
			if(global.tile_array[i][j-1]<0 and global.tile_array[i-1][j]<0) invalid++;
			if(global.tile_array[i][j+1]<0 and global.tile_array[i-1][j]<0) invalid++;
			if(global.tile_array[i][j-1]<0 and global.tile_array[i+1][j]<0) invalid++;
			if(global.tile_array[i][j+1]<0 and global.tile_array[i+1][j]<0) invalid++;
			
			if (global.tile_array[i][j] < 0 and invalid == 0) {
				array_push(candidates, [i, j]); // Store coordinates as a 2-element array
			}
		}
	}

	// If any walls exist, pick one at random
	if (array_length(candidates) > 0) {
		var chosen = candidates[irandom(array_length(candidates) - 1)];
		var x_index = chosen[0];
		var y_index = chosen[1];
		
		global.tile_array[x_index][y_index] = -999;
	}
}

function setDoor(){ //COMMENT 2

	var candidates = [];

	// Gather all valid wall positions into an array
	for (var i = 1; i < tiles_x - 1; i++) {
		for (var j = 1; j < tiles_y - 1; j++) {
			var invalid = 0;
			if(global.tile_array[i][j-1]<0 and global.tile_array[i-1][j]<0) invalid++;
			if(global.tile_array[i][j+1]<0 and global.tile_array[i-1][j]<0) invalid++;
			if(global.tile_array[i][j-1]<0 and global.tile_array[i+1][j]<0) invalid++;
			if(global.tile_array[i][j+1]<0 and global.tile_array[i+1][j]<0) invalid++;
			if(global.tile_array[i][j] < -900) invalid++;
			
			if (global.tile_array[i][j] < 0 and invalid == 0) {
				array_push(candidates, [i, j]); // Store coordinates as a 2-element array
			}
		}
	}

	// If any walls exist, pick one at random
	if (array_length(candidates) > 0) {
		var chosen = candidates[irandom(array_length(candidates) - 1)];
		var x_index = chosen[0];
		var y_index = chosen[1];
		
		global.tile_array[x_index][y_index] = -1000;
	}

}
	

function createEnemies(instance, numberOfEnemies){
	var tile_width = array_length(global.tile_array);        // columns (X)
	var tile_height = array_length(global.tile_array[0]);    // rows (Y)

	for (var i = 0; i < numberOfEnemies; i++) {
		var valid = false;
		var col = 0;
		var row = 0;

		repeat (100) { // safety limit
			col = irandom(tile_width - 2) + 1;   // avoid outermost edges
			row = irandom(tile_height - 2) + 1;

			var tile_value = global.tile_array[col][row];

			// Check that center tile is walkable
			if (tile_value >= 1) {
				valid = true;

				// Check surrounding 8 tiles
				for (var dx = -1; dx <= 1; dx++) {
					for (var dy = -1; dy <= 1; dy++) {
						if (dx == 0 && dy == 0) continue; // skip center tile

						var neighbor = global.tile_array[col + dx][row + dy];
						if (neighbor <= 0) { // wall or void
							valid = false;
							break;
						}
					}
					if (!valid) break;
				}
			}
			
			// If tile is valid, check distance to player
			if (valid) {
				var tileX = col * tile_size;
				var tileY = row * tile_size;

				var dist_to_player = point_distance(tileX, tileY, oPlayer.x, oPlayer.y);
				if (dist_to_player < 300) {
					valid = false; // too close
				}
			}

			if (valid) break;
		}

		if (valid) {
			var tileX = col * tile_size;
			var tileY = row * tile_size;

			switch(instance) {
				case "goblin":
					instance_create_layer(tileX, tileY, "Enemies", oEnemyGoblin);
					break;
			}
		}
	}
}

function setInstances(){

var tile_size = 32;
var tiles_x = array_length(global.tile_array);
var tiles_y = array_length(global.tile_array[0]);


for (var i = 0; i < tiles_x; i++) {
    for (var j = 0; j < tiles_y; j++) {
        var tile = global.tile_array[i][j];
		//show_debug_message("tile: " + string(tile))
        var xx = i * tile_size;
        var yy = j * tile_size;
        
        // Choose color based on tile type
        switch (tile) {
			
			case -1000:
			var tile_1 = instance_create_layer(xx,yy,"Tiles", oDoor);
			with tile_1{
				image_index = 0;
			};   // keyhole 1
			break; 
			
			case -999:
			var tile_1 = instance_create_layer(xx,yy,"Tiles", oKeyHole);
			with tile_1{
				image_index = 0;
			};   // keyhole 1
			break;
			case -9: 
			var tile_2 = instance_create_layer(xx,yy,"Tiles", o3WallTile);
			with tile_2{
				image_index = 0;
			};   // wall floor 3
			break;  
			
			case -8: 
			var tile_3 = instance_create_layer(xx,yy,"Tiles", o3WallTile);
			with tile_3{
				image_index = 1;
			};   // wall floor 3
			break;   
			
			case -7: 
			var tile_4 = instance_create_layer(xx,yy,"Tiles", o3WallTile);
			with tile_4{
				image_index = 2;
			};   //wall floor 3
			break;   
			case -6: 
			var tile_2 = instance_create_layer(xx,yy,"Tiles", o2WallTile);
			with tile_2{
				image_index = 0;
			};   // wall floor 2
			break;  
			
			case -5: 
			var tile_3 = instance_create_layer(xx,yy,"Tiles", o2WallTile);
			with tile_3{
				image_index = 1;
			};   // wall floor 2
			break;   
			
			case -4: 
			var tile_4 = instance_create_layer(xx,yy,"Tiles", o2WallTile);
			with tile_4{
				image_index = 2;
			};   //wall floor 2
			break;   

			case -3: 
			var tile_1 = instance_create_layer(xx,yy,"Tiles", oWallTile);
			with tile_1{
				image_index = 0;
			};   // wall floor 1
			break;  
			
			case -2: 
			var tile_1 = instance_create_layer(xx,yy,"Tiles", oWallTile);
			with tile_1{
				image_index = 1;
			};   // wall floor 1
			break;   
			
			case -1: 
			var tile_1 = instance_create_layer(xx,yy,"Tiles", oWallTile);
			with tile_1{
				image_index = 2;
			};   //wall floor 1
			break;   
			
            case 0:
			var tile_1 = instance_create_layer(xx,yy,"Tiles", oFloorTile);
			with tile_1{
				image_index = 0;
			};   // floor 1
			break;   // empty
			
            case 1:  
			var tile_1 = instance_create_layer(xx,yy,"Tiles", oFloorTile);
			with tile_1{
				image_index = 1;
			};   // floor 1
			break;
			
            case 2: 
			var tile_1 = instance_create_layer(xx,yy,"Tiles", oFloorTile);
			with tile_1{
				image_index = 2;
			};   // floor 1
			break;
			
			case 3:
			var tile_1 = instance_create_layer(xx,yy,"Tiles", oFloorTile);
			with tile_1{
				image_index = 3;
			};   // floor 1
			break;
			
			case 4:  
			var tile_1 = instance_create_layer(xx,yy,"Tiles", o2FloorTile);
			with tile_1{
				image_index = 1;
			};   // floor 2
			break;
			
            case 5: 
			var tile_1 = instance_create_layer(xx,yy,"Tiles", o2FloorTile);
			with tile_1{
				image_index = 2;
			};   // floor 2
			break;
			
			case 6:
			var tile_1 = instance_create_layer(xx,yy,"Tiles", o2FloorTile);
			with tile_1{
				image_index = 3;
			};   // floor 2
			break;
				case 7:  
			var tile_1 = instance_create_layer(xx,yy,"Tiles", o3FloorTile);
			with tile_1{
				image_index = 1;
			};   // floor 3
			break;
			
            case 8: 
			var tile_1 = instance_create_layer(xx,yy,"Tiles", o3FloorTile);
			with tile_1{
				image_index = 2;
			};   // floor 3
			break;
			
			case 9:
			var tile_1 = instance_create_layer(xx,yy,"Tiles", o3FloorTile);
			with tile_1{
				image_index = 3;
			};   // floor 3
			break;

			
            default:  break;   // unknown
			
        }
        
    }
}



}

//show_debug_message("tile_array: " + string(global.tile_array))