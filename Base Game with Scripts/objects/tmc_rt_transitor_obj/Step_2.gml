if(state == 6) //trasition, first since call often
{
    state = state;
    exit;
}
else if(state == 8) //done
{
    instance_destroy();
    exit;
}
else if(state == -1) //error, done
{
    instance_destroy();
    exit;
}
else if(state == 0) //init, turn app surf on if off
{
    application_surface_enable(true);
    state = 1;
    exit;
}
else if(state == 2) //got the room from surf goto room asked
{
    state = 3;
    room_goto(room_to);
    exit;
}
else if(state == 3) //switched room
{
    state = 4;
    exit;
}

