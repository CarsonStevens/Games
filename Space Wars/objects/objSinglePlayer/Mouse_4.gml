/// @description go to solo level

objScoreController.solo = true;
instance_destroy();
with(objTwoPlayer) instance_destroy();
room_goto(SoloInstructions);

