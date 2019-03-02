/// @description Drawing which can be delete.
for (i = 0; i < number_node; i+=1)
{
    for (j = 0; j < number_node; j+=1)
    {
        if ((contact[i,j] > 0) && (contact[i,j] < 64000))
        {
            draw_set_color(c_black);
            draw_line(node_x[i], node_y[i], node_x[j], node_y[j]);
            //draw_set_color(c_blue);                     
            //draw_text((node_x[i] + node_x[j]) / 2, (node_y[i] + node_y[j]) / 2 - 20, "lgth " + string(round(contact[i, j])));
        }
    }
}

