//This object manage system of graph create
//You can have only one system of graph create in the moment

line_active = false;        //Program works in two modes. Set nodes - line_active = false.
                            //And set connections - line_active = true.

node_distance = 30;         //This is minimum distance between nodes.    
                            //Set it zero, if you don't need this option.              
                            
//Support variables
line_start = noone;
matrix[0,0] = 0;

