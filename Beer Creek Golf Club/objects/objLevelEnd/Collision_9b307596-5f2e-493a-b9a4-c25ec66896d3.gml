/// @description Move to next Room

with(objPlayer){
	if(hasControl){
		hasControl = false;
		SlideTransition(TRANS_MODE.GOTO, other.target);
	}
}
