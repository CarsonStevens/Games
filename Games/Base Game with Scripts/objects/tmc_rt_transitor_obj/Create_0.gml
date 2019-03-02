//room to go to
room_to = room;
//script for transition
script_id = tmc_rt_trans_default;

//if the application surface was on or off
app_surf_is_enabled = application_surface_is_enabled();
//the room images in the for of surfaces
room_from_surf = -1;
room_to_surf = -1;
//the state of all this nonesense
state = 0; 
/*
0 = start
1 turned on app surf
2 captured app surface for room from
3 changing to room to
4 changed to room to
5 captured app surface for room to
6 doing transition
7 done transition
8 reset app surf
-1 fail
*/


/* */
/*  */
