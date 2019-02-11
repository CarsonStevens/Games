if(hp <= 0) {
	
	instance_destroy();
	
	with(instance_create_layer(x,y,layer,objGooseDead)){
		//Direction enemy dies
		direction = other.hitfrom;
		hsp = lengthdir_x(3,direction);
		vsp = lengthdir_y(3,direction) - 2;
		if(sign(hsp) != 0) image_xscale = sign(hsp);
	}
}
