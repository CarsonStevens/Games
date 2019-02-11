Tile_Grid = ds_grid_create(room_width/32, room_height/32);
ds_grid_clear(Tile_Grid, 0);

global.Layer_Wall = layer_create(-100);
global.Tilemap_Wall = layer_tilemap_create(global.Layer_Wall, 0, 0, til_wall, room_width, room_height);

/*
Any comments or questions?
jonathan.naztail@gmail.com

Please leave a review on the marketplace.

To help you create tileset I suggest to download Tile47Jo:

Topic: https://forum.yoyogames.com/index.php?threads/tile47jo-auto-tile-tool.17222/

Direct download: www.naztail.com/tile47jo/Tile47Jo.zip