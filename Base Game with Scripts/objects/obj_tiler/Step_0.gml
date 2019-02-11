if(mouse_check_button(mb_left))//Add a tile (1 on the grid)
{
var xx = mouse_x div 32;
var yy = mouse_y div 32;
xx = clamp(xx, 0, ds_grid_width(Tile_Grid/32)-1);
yy = clamp(yy, 0, ds_grid_height(Tile_Grid/32)-1);
Tile_Grid[# xx, yy] = 1;
scr_update_tile(Tile_Grid, xx, yy, global.Tilemap_Wall, 1);
}
else if(mouse_check_button(mb_right))//Remove a tile(0 on the grid)
{
var xx = mouse_x div 32;
var yy = mouse_y div 32;
xx = clamp(xx, 0, ds_grid_width(Tile_Grid/32)-1);
yy = clamp(yy, 0, ds_grid_height(Tile_Grid/32)-1);
Tile_Grid[# xx, yy] = 0;
scr_update_tile(Tile_Grid, xx, yy, global.Tilemap_Wall, 1);
}