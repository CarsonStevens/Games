/// @description game restart
instance_destroy();
if(objScoreController.solo == true){
	room_goto(EndSolo)
}
else{
	room_goto(Level1);
}
