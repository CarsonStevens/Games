//other refers to Goose
with(other){
	//Update hit vairabls
	hp--;
	flash = 3;
	
	//this other refers to the bullet
	hitfrom = other.direction;
}

//Destroys Bullet
instance_destroy();
