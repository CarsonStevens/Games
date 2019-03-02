// Inherit the parent event
event_inherited();

//Inheritted because use of different hp with other
with(other){
	//Update hit vairabls
	hp -= 25;
	flash = 3;
	
	//this other refers to the bullet
	hitfrom = other.direction;
}

//Destroys Bullet
instance_destroy();
