Wellcome to Iterators_gm
========================

** What is an iterator? **

An iterator is a special kind of data that you can iterate over.
For example, you can create iterators based on arrays, lists, maps, files, ranges, etc.

** Install ** 

2 - Go to Included files. Right click > "Open in exporer" and copy the "iterators_gm.gmez" extension file to other secure place.
3 - Then open your game or project and drag the iterators_gm.gmez to your game.
4 - Right click in iterators_gm extension and choose "Import Resources". "Import all". "Ok".
5 - Done! 

** Basic examples ** 

For example, to iterate over an array use it_array(arr)

    var my_array = array(1,4,5,6,7,2,6,212,643,534,211,13,12);
    
    var it = it_array(my_array);
    while (it_next(it)) {
        show_message(it[IT_VAL])
    }
    
You can use the special vars IT_VAL and IT_IND.

    var my_iterator = it_list(my_list);
    while (it_next(my_iterator)) { //Increment the iterator and update the next value
        show_message(my_iterator[IT_IND]); //The current index 
        show_message(my_iterator[IT_VAL]); //The current value 
    }

To see more examples check the examples included in the "examples" folder.
        
** What types of iterators can I use ** 

Chaeck the list inside the "built_in_iterators" folder. But the list grows with every update! 

** I want to create my OWN type of iterator ** 

First explore all the predefined iterators and understad how them work. 
Then you can create your custom iterator with the help of it_create().
Check it_create() for more info.

=====================================
====== CHECK MY OTHER ASSETS ========
=====================================

https://marketplace.yoyogames.com/publishers/1080/ciberman


** CONTACT ME **

Email: jhm.ciberman@gmail.com
(You can write me in english or spanish) 


Enjoy! 