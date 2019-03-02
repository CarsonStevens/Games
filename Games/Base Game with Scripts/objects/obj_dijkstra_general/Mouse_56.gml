//Here is choice of goal position.
var st, fn, sc, fc;
st = instance_nearest(obj_voyager.x, obj_voyager.y, obj_dijkstra_node);
fn = instance_nearest(mouse_x, mouse_y, obj_dijkstra_node);

sc = st.myid;
fc = fn.myid;

//Ok. This is most important part.
//sc and fc are positions start and finish nodes.
//Positions in node_x/y arrays.
//For example if you use numbers 0 and 3, program will find nodes on position 0 and 3
//and will create path between it.
p_base = dijkstra_path_find(sc, fc);

//Path adjustment and setting up it to voyager
path_set_kind(p_base, 1);
path_set_closed(p_base, 0);
with (obj_voyager)
{
    path_start(obj_dijkstra_general.p_base, 3, 0, 1);
}

