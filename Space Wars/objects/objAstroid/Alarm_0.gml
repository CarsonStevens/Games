/// @description Create another astroid

var count = 0;
var temp_x = 0;
var temp_y = 0;
if!(instance_number(objAstroid > 10)){
	if(irandom_range(0,1) == 0){
		temp_x = 0;
	}
	else{
		temp_x = room_width;
	}
	temp_y = irandom_range(0,room_height);
	with(instance_create_layer(temp_x, temp_y, layer, objAstroid)){
		//Set up variables
	}
}
