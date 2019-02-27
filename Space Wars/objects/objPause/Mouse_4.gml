/// @description pause action
if(activated){
	instance_activate_all()
	activated = false;
	if (instance_exists(objPauseLogo)){	
		with(objPauseLogo) instance_destroy();
	}
}
else{
	instance_deactivate_all(true);
	activated = true;
	if !(instance_exists(objPauseLogo)){	
		with(instance_create_layer(room_width/2, room_height/2, layer, objPauseLogo)){}
	}

}
