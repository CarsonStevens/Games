/// @description for ship warp drive

//Create portal at original spot
with(instance_create_layer(x,y,layer,objPortal)){}

x = irandom_range(0, room_width);
y = irandom_range(0, room_height);

//Create portal at new spot
with(instance_create_layer(x,y,layer,objPortal)){}
