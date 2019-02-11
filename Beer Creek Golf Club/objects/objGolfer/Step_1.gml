if(hp <= 0) {
	
	with(objClub) instance_destroy();
	//Destroy Golfer Sprite
	instance_destroy();
	
	with(instance_create_layer(x,y,layer,objGolferDead)){
		//Direction enemy dies
		direction = other.hitfrom;
		hsp = lengthdir_x(3,direction);
		vsp = lengthdir_y(3,direction) - 2;
		if(sign(hsp) != 0) image_xscale = sign(hsp) * other.size;
		image_yscale = other.size;
	}
}
