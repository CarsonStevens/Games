//Applies gravity
vsp += grv;


/*
 * Collision Code:
 * sign(): gives sign of var
 *
 * FIX: Flags for animation instead of checking
 *
 *
*/

//Horizontal Collision
if(place_meeting(x + hsp, y, objConcrete)){
	while(!place_meeting(x + sign(hsp), y, objConcrete)){
		x += sign(hsp);
	}	
	hsp = -hsp;
}


//Vertical Collision
if(place_meeting(x, y + vsp, objConcrete)){
	while(!place_meeting(x, y + sign(vsp), objConcrete)){
		y += sign(vsp);
	}	
	vsp = 0;
}


x += hsp;
y += vsp;

/*
* Animation
*/

if(!place_meeting(x, y+1, objConcrete)){

	//sprite_index = sprPlayerJumping;
	image_speed = 1;
	image_index = jumpFrame;
	if(sign(vsp) > 0) && (image_index < 3){
		jumpFrame++;
	}

}
else{
	if(hsp == 0){
		sprite_index = sprGolferStanding;
	}
	else{
		sprite_index = sprGolferWalking;
	}
}

//Sets sprite's direction
if (hsp != 0) image_xscale = sign(hsp) * size;
image_yscale = size;
