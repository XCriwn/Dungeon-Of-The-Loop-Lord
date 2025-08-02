var warp = instance_create_layer(x,y,"Tiles", oWarp);

if(room == Room1) image_index = 0;
if(room == Room2) image_index = 4;

warp.target_rm = Room2;
warp.target_x = 0;
warp.target_y = 0;