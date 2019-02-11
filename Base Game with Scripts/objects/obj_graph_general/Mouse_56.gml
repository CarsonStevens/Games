/// @description Creating nodes and connections
if (line_active)            //Connections
{
    var a;
    a = instance_nearest (mouse_x, mouse_y, obj_graph_node);
    if (a)
    {
        if (!line_start)   //First click 
        {
            line_start = instance_create (mouse_x, mouse_y, obj_graph_connect);                                                         
        }
        else               //Second click 
        {
            var into;
            into = false;
            with (line_start)
            {
                if ((a.x != s_x) || (a.y != s_y))   
                {
                    f_x = a.x;
                    f_y = a.y;
                    into = true;
                }
                x = (s_x + f_x) / 2;
                y = (s_y + f_y) / 2;
            }
            if (into)
            {
                line_start = noone;   
            }
        }
    }
}
else                    //Nodes
{
    var a;
    a = instance_nearest(mouse_x, mouse_y, obj_graph_node);
    if (a)
    {
        //Node isn't created if it too near at other
        if (sqrt(sqr(mouse_x - a.x) + sqr(mouse_y - a.y)) > node_distance) 
        {
            instance_create(mouse_x, mouse_y, obj_graph_node);
        }
    }
    else
    {
        instance_create(mouse_x, mouse_y, obj_graph_node);
    }
}

