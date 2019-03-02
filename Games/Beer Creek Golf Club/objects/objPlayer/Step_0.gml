//Get Player Input
if(hasControl){
	
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space);
	key_charge = keyboard_check(ord("S")) || mouse_check_button(mb_right);


	if(key_charge){
		chargesp = 0;
		charge += 1;
	}
	else{
		chargesp = 1;
	}
}
else{
	key_left = 0;
	key_right = 0;
	key_jump = 0;
}


//Calculate Movement
//Calcuates left and right for when both are pressed
var move = (key_right - key_left);
hsp = move * walksp * chargesp;

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
	hsp = 0;
}

//For Jumping
if(place_meeting(x, y+1, objConcrete)) && (key_jump){
	//Amount to jump by
	vsp = -8;
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

	sprite_index = sprPlayerJumping;
	image_speed = 1;
	image_index = jumpFrame;
	if(sign(vsp) > 0) && (image_index < 3){
		jumpFrame++;
	}

}

else{
	if(hsp == 0){
		sprite_index = sprPlayerStanding;
		if(key_charge){
			sprite_index = sprPlayerCharging;
		}
	}
	else{
		sprite_index = sprPlayerWalking;
	}
}

//Sets sprite's direction
if (hsp != 0){
	image_xscale = sign(hsp);
}