draw_set_color(c_black);
if (sprite_index)
{
    draw_sprite (sprite_index, 0, x, y);
}
else
{
    draw_circle(x, y, 5, 0);
}
//draw_text(x, y - 25, myid);
/*if (!ct)
{    
    for (i = 0; i < obj_dijkstra_general.number_node; i+=1)
    {
        if (x == obj_dijkstra_general.node_x[i]) && (y == obj_dijkstra_general.node_y[i])
        {
            draw_set_color(c_red);
            draw_text(x, y - 20, "Length " + string(round(obj_dijkstra_general.D[i])));
        }
    }
}
else
{   
    for (i = 0; i < obj_dijkstra_general.number_node; i+=1)
    {
        if (x == obj_dijkstra_general.node_x[i]) && (y == obj_dijkstra_general.node_y[i])
        {
            draw_set_color(c_red);
            draw_text(x, y - 20, "Node " + string(i));
        }
    }
}*/

/* */
/*  */
