//Set view object to the spawned "bla" instance of the "follow" object at room start (for persistent rooms)
if !instance_exists(bla){bla=instance_create(room_width*0.5,room_height*0.5,follow);}
bla=instance_nearest(x,y,follow)
__view_set( e__VW.Object, 0, bla )

