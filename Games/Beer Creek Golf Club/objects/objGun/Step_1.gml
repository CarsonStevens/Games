//Set position and angle
x = objPlayer.x;
y = objPlayer.y;

image_angle = point_direction(x, y, mouse_x, mouse_y);

firingDelay--;
recoil = max(0,recoil-1);
if(mouse_check_button(mb_left) || keyboard_check(ord("W"))) && (firingDelay < 0){
	firingDelay = 10;
	recoil = 19;
	if(objPlayer.charge < 10){
		ScreenShake(2,10);
		with(instance_create_layer(x,y,"Bullets", objBullet)){
			//Where to set charged speed
			speed = 3;
			//Other in with statement refers to current obj (gun)
			direction = other.image_angle + random_range(-3, 3);
			image_angle = direction;
		}
	}
	if(objPlayer.charge >= 10) && (objPlayer.charge < 60){
		ScreenShake(4, 15);
		with(instance_create_layer(x,y,"Bullets", objBullet2)){
			//Where to set charged speed
			speed = 5;
			//Other in with statement refers to current obj (gun)
			direction = other.image_angle + random_range(-3, 3);
			image_angle = direction;
		}
	}
	if(objPlayer.charge >= 60) && (objPlayer.charge < 100){
		ScreenShake(6, 20);
		with(instance_create_layer(x,y,"Bullets", objBullet3)){
			//Where to set charged speed
			speed = 10;
			//Other in with statement refers to current obj (gun)
			direction = other.image_angle + random_range(-3, 3);
			image_angle = direction;
		}
	}
	if(objPlayer.charge >= 100){
		ScreenShake(8, 25);
		with(instance_create_layer(x,y,"Bullets", objBullet4)){
			//Where to set charged speed
			speed = 15;
			//Other in with statement refers to current obj (gun)
			direction = other.image_angle + random_range(-3, 3);
			image_angle = direction;
		}
	}
	objPlayer.charge = 0;
}

//Given an original x,y, angle, and distances, gives a new x and y
x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_y(recoil, image_angle);

//FLip gun when mouse is between 90 and 270
if(image_angle > 90) && (image_angle < 270){
	image_yscale = -1;
}
else{
	image_yscale = 1;
}