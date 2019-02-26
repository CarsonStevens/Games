// Load some font
if (os_type == os_windows || os_type == os_win32 || os_type == os_win8native)
    var _slash = "\\";
else
    var _slash = "/";
var _resdir = working_directory + _slash + "Fonts" + _slash; 
var _path = _resdir  + "starcraft.ttf";
show_debug_message("Loading from ... " + string(_path));

fntScore = font_add(_path, 150, false, false, 32, 128);

