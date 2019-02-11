/// @description Destroing nodes and connections
if (line_active)    //Connections
{
    var a;
    a = instance_nearest(mouse_x, mouse_y, obj_graph_connect);
    with (a)
    {
        instance_destroy();
    }
    line_start = noone;  
}
else                //Nodes
{
    var a;
    a = instance_nearest(mouse_x, mouse_y, obj_graph_node);
    with (a)
    {
        instance_destroy();
    }
}

