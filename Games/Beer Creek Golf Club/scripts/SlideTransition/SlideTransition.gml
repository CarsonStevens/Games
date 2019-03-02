/// @description SlideTransition(mode, targetRoom)
/// @arg Mode sets transition mode between NEXT, RESTART, and GOTO
/// @arg Target sets target room when using the GOTO mode

with(objTransition){
	
	/*
	 * Brackets "[]" provide optional arguments while "argument#" is required.
	 *		mode is with brackets because not every mode needs a target.
	 */
	 
	mode = argument[0];
	if(argument_count > 1){
		target = argument[1];
	}
}
	