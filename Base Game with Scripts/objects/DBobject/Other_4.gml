/// @description Wrapping distance variables

//These are the vars for seamless wrapping at the room's border, they rely on a fake border at distance "global.roomborder" from the room's actual border.
//Obviously, the "fake" room size would be room_width/height minus two times that border then.
//This only needs to be called at the room's start, because room properties only change upon entering a new room.
hwrap=(room_height-2*global.roomborder);
wwrap=(room_width-2*global.roomborder);

