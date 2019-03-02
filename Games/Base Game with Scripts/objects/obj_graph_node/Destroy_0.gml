/// @description Destroying node and all adjacent connection
var myx, myy;
myx = x;
myy = y;
with (obj_graph_connect)
{
    if ((s_x == myx) && (s_y == myy)) || ((f_x == myx) && (f_y == myy))
    {
        instance_destroy();
    }
}

