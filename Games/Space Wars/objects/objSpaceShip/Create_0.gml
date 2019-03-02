/// @description Define spaceship variables


//kinemetics
x_vel = 0;
y_vel = 0;
x_acc = 0;
y_acc = 0;
rotation = 0;
rotation_const = 5;
mass = 100;

//for adjusting thrust
thrust_const = 0.08;
thrusting = false;
max_velocity = 30;

//for adjusting firing delay
firing_delay = 0;

//Stats
fuel_max = 1000;
if(objScoreController.solo){
	fuel_max = 10000;
}
fuel = fuel_max;
missiles_max = 30;
//Make single player have more ammo
if(objScoreController.solo){
	missiles_max = 300;
}
missiles = missiles_max;




