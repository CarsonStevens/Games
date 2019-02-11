if(hp <= 0) {
	
	//Destroy Cart Sprite
	instance_destroy();
	
	with(instance_create_layer(x,y,layer,objCartDead)){
		//Direction enemy dies
		y -= 30;
		direction = other.hitfrom;
		hsp = lengthdir_x(3,direction);
		vsp = lengthdir_y(3,direction) - 5;
		if(sign(hsp) != 0) image_xscale = sign(hsp);
	}
	
	
	

}
