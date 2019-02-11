//free up the 2 room surfaces
if(surface_exists(room_from_surf)) surface_free(room_from_surf);
if(surface_exists(room_to_surf)) surface_free(room_to_surf);
//cleanup the transition variables
if(state >=6) script_execute(script_id,2,0,0,0,0,0,0)
//restore the application surface as the game had it set
application_surface_enable(app_surf_is_enabled);

