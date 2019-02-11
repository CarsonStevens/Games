//other refers to Golfer
with(other){
	//Update hit vairabls
	hp -= 15;
	flash = 3;
	
	//this other refers to the bullet
	hitfrom = other.direction;
}

//Destroys Bullet
instance_destroy();
