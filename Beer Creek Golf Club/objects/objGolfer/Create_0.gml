/// @description Overwrites Variable Definitions
//Movement Variables
vsp = 0;
grv = 0.3;
walksp = 3;
hsp = walksp;

//Animation Variables
jumpFrame = 0;

//Enemy Variables
hp = 7;
flash = 0;
hitfrom = 0;

//Give Golfer Weapon
club = instance_create_layer(x, y, "Bullets", objClub);
if(!instance_exists(club)){
	club = instance_create_layer(x, y, "Bullets", objClub);
	club.x = x;
	club.y = y;
}
//Make club face the right direction
club.image_xscale = image_xscale;