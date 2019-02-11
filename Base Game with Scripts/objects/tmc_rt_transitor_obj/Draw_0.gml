//we turned on athe app surface and the game rendered room from on it?
if(state == 1)
{
    //safety check on app surface
    if(surface_exists(application_surface))
    {
        //allocate a surface for room from
        var w = surface_get_width(application_surface);
        var h = surface_get_height(application_surface);
        room_from_surf = surface_create(w,h);
        //success?
        if(!surface_exists(room_from_surf))
        {
            //oops, crap out
            show_debug_message("tmc_room_transition: Error Room From Surface");
            state = -1;
            //but still perform the room goto
            room_goto(room_to);
            exit;
        }
        else
        {
            //copy the app surf to the room from surf
            surface_copy(room_from_surf,0,0,application_surface);
            //set to got to next room
            state = 2;
        }
        
    }
    else
    {
        //wth? app surf failed? impossible!!
        show_debug_message("tmc_room_transition: Error App Surface Room From");
        ///crap out
        state = -1;
        //but do the room change
        room_goto(room_to);
        exit;
    }
}
else if(state == 4) //we got to the goto room? 
{
    //make sure the from and app surf is still good
    if(surface_exists(application_surface) && surface_exists(room_from_surf))
    {
        //now grab the goto room surface
        var w = surface_get_width(application_surface);
        var h = surface_get_height(application_surface);
        room_to_surf = surface_create(w,h);
        //success?
        if(!surface_exists(room_to_surf))
        {
            //crap, bug out
            show_debug_message("tmc_room_transition: Error Room To Surface");
            state = -1;
            //room_goto(room_to);
            exit;
        }
        else
        {
            //yes, copy the room to image (app surf) to the room to surface
            surface_copy(room_to_surf,0,0,application_surface);
            state = 5;
            //tell the script to allocate it's variables
            var x1 = 0;
            var y1 = 0;
            var x2 = room_width;
            var y2 = room_height;
            var xs = 1;
            var ys = 1;
            if(view_enabled)
            {
                x1 = __view_get( e__VW.XView, view_current );
                y1 = __view_get( e__VW.YView, view_current );
                x2 = x1 + __view_get( e__VW.WView, view_current );
                y2 = y1 + __view_get( e__VW.HView, view_current );
                xs = __view_get( e__VW.WView, view_current )/__view_get( e__VW.WPort, view_current )
                ys = __view_get( e__VW.HView, view_current )/__view_get( e__VW.HPort, view_current )
            }
    
            script_execute(script_id,0,x1,y1,x2,y2,xs,ys)
            //script_execute(script_id,0,0,0,0,0,0,0)
            //ready to go
            state = 6;
        }
        
    }
    else
    {
        //what? a suface got nuked?
        //which one? and log
        if(!surface_exists(room_from_surf))
            show_debug_message("tmc_room_transition: Error Room To Surface Lost Before Init Ended");
        else
            show_debug_message("tmc_room_transition: Error App Surface Room To");
        //crap out
        state = -1;
        //room_goto(room_to);
        exit;
    }
}

//if we got both room surfaces
if(state == 6)
{
    //and they still good
    if(surface_exists(room_from_surf) and surface_exists(room_to_surf))
    {
        //transition using script specified
        var x1 = 0;
        var y1 = 0;
        var x2 = room_width;
        var y2 = room_height;
        var xs = 1;
        var ys = 1;
        if(view_enabled)
        {
            x1 = __view_get( e__VW.XView, view_current );
            y1 = __view_get( e__VW.YView, view_current );
            x2 = x1 + __view_get( e__VW.WView, view_current );
            y2 = y1 + __view_get( e__VW.HView, view_current );
            xs = __view_get( e__VW.WView, view_current )/__view_get( e__VW.WPort, view_current )
            ys = __view_get( e__VW.HView, view_current )/__view_get( e__VW.HPort, view_current )
        }

        var v = script_execute(script_id,1,x1,y1,x2,y2,xs,ys)
        //script told us it's done?
        if(v > 0) 
        {
            //cleanup 
           state = 7;
           //now done in destroy
           //script_execute(script_id,2)
           state = 8;
            
        }
    }
    else
    {
        //one of the surfaces got lost
        //move to destroy
        //script_execute(script_id,2);
        //which one? and show error
        if(!surface_exists(room_from_surf))
            show_debug_message("tmc_room_transition: Error Room From Surface Lost During Transition");
        if(!surface_exists(room_to_surf))
            show_debug_message("tmc_room_transition: Error Room To Surface Lost During Transition");
        //crap out
        state = -1;
            
    }
}

