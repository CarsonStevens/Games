globalvar I_AM_BIG;
I_AM_BIG = 64000;       //max length of connect, you can increase it
contact[0, 0] = 0;      //contact - - an array of connections length
number_node = 0;        //number_node - number of nodes
D[0] = 0;               //D - current distance from node to start node.
node_x[0] = 0;          //node_x/y array of coordinates of nodes
node_y[0] = 0;

//We need load graph which was created and saved in room r_matrix_create.
//Be sure what it was done.
dijkstra_load_graph("path_matrix.txt");

//This function must be called, after loading graph.
//It calculate and set distance.
dijkstra_set_start_data();

//Creating object who walk. It isn't necessary.
instance_create(node_x[0], node_y[0], obj_voyager);

