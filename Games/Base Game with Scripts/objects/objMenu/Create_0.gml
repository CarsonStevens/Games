/// @description GUI//Menu setup
#macro SAVEFILE "Save.sav"

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

// 200 is off screen. Used to bring text onto the screen
menu_x = gui_width + 200;
menu_y = gui_height - gui_margin;
//Where text will end up
menu_x_taget = gui_width - gui_margin;
menu_speed = 25; //lower is faster
menu_font = fMenu;
menu_itemheight = font_get_size(fMenu);
//Number to set for each command
menu_committed = -1;
//So that the player can't select more than one option before one has executed.
menu_control = true;

//More efficient to declare final size ([2]) at start, so memory doesn't have to be allocated multiple times (each resize).
menu[2] = "New Game"
menu[1] = "Continue"
menu[0] = "Quit"

//How many entries there are
menu_items = array_length_1d(menu);

//Predefine variable
menu_cursor = 2;