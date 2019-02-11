with (DBobject) {
///Configuration - Make tweaks here


    /////////////////////////////////////////////////
    //   ULTIMATE SEAMLESS BACKGROUND GENERATOR    //
    // --------------------------------------------//
    // STARS, NEBULAS, CLOUDS, DONUTS, YOU NAME IT //
    /////////////////////////////////////////////////


// PRE-USAGE:

// 1.) You need to define a global variable called global.roomborder before you start using this, if you don't want to use the seamless wrapping just put it to zero, but BEFORE you use this (in an initiation room like in the example, called "init" here).
// =========================================================================================================================================================================================================================================|

// 2.) Use square sprites WITH CENTERED ORIGINS!!!! for best results. You will also need a background color, for nebula/stars preferably black!
// ============================================================================================================================================|

// 3.) For the parallax, try to use reasonable values as proposed at that section below.
// =====================================================================================|

// 4.) You need AT LEAST one view, you CANNOT use this without views, there will be another simplified version for that included at some point.
// =====================================================================================================================|

// 5.) Surface support is not implemented yet, but when it is, remember that you cannot use animating sprites, surface quirk unfortunately.
// ========================================================================================================================================|

// 6.) This background generator fully supports seamlessly wrapping rooms with centered player, see included example.
// ==================================================================================================================|

// 7.) The upper part is "EZ MODE", which quickly generates starfields for you based on some parameters and toggles. 
//     In the advanced tweaks section, you can do this per layer and you can change some more delicate settings.
// =================================================================================================================|

// 8.) To use this with different configurations for multiple rooms, copy this ENTIRE (yes all of it) creation code into the creation code of the instance
//     of this object in said room and then change/tweak things over there. COPY THE ENTIRE THING, or things will break. Examples included, but they still use the old config so they are partially incomplete (but work).
// ======================================================================================================================================================================================================================|

// 9.) At the very bottom there is a trouble-shooting section, you can adjust (technical) things there that might cause issues.
// ===========================================================================================================================|


//set this to 'true' to use the advanced tweaks override at the bottom.

    use_advanced_mode=true;

    
//IMPORTANT: When using the advanced mode, interpolating may get toggled on/off depending on what you pick.
//The problem is that there is no way to retrieve the value from the global configuration to set it back to what it was, so you MUST do this manually below.
//If you have it ticked on, set it to "true", if you have it ticked off, set it to "false":

    interpolation=true;
    
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



    /////////////////////////////
    // EZ MODE - QUICK 'N EASY //
    /////////////////////////////

    /////////////////////////////
    

// USAGE:

// In the SECOND "for" loop below, you need to change the sprites in the "choose" function to your own, you can add as many as you want, or just one if you want a single star/sprite variety.
// EXAMPLE: choose(star1) or choose(star1,star1,star1...) - all layers have same sprite; choose(star1,star2) - layers alternate between the two sprites, this is PER layer, not per star.
// The amount of layers has NO IMPACT on performance, maximum -useful- value will be equal to the amount of stars, where every star has its own movement plane.

// [room_bgcolor=false] - Whether to use the room's background color (if it has one). False means you configure room color here, at the variable "backg_color".
// [backg_color=c_black] - The background color of the room
// [stars=250] - This is the amount of stars/sprites that will be in the view at once, this number will be split over the amount of layers.
// [layers=10] - This is the number of distinct layers. Each layer can have distinct properties as you will see later.
// [skip_layers=0] - This is the number of layers to skip from start, you might want to use this for testing.
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//-parameters-\\

    room_bgcolor    =       false;
    backg_color     =       c_black;
    stars           =       250;
    layers          =       10;
    skip_layers     =       0;


//-loops-\\
//DON'T TOUCH

    for(i=skip_layers;i<layers+1;i++){startypes[i]=-1;} //array initialization, every "-1 layer" will not be calculated or drawn.


//CHANGE THIS - choose(sprite1,sprite2...)

    for(i=skip_layers;i<layers+1;i++){startypes[i]=choose(star3,star2,star1,star1,star1,star1);}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





// Below is the parallax setup. Do -NOT- touch the nested "for" loop at all, just change the value for "strength" and "fieldspeed".

// [strength=50] - Increase "strength" for more contrast between the layers. Negative values make no difference. 0 means no parallax. 100 means that the first and the last layer will have the maximum difference possible (back layer will stand still and front layer will move at object layer speed) stay between 0 - 100.
// [fieldspeed=100] - Decrease "fieldspeed" to SLOW DOWN the starfield, it basically offsets the parallax factors. Negative values make no difference. try to stay around 0 - 100
// [invert_pf=false] - This makes the layers on the background actually move faster than layers on the foreground, use it for cool effects!
// NOTICE: This section has been rewritten, no more weird behavior, strength and fieldspeed both get clamped at 0 and 100 to prevent weird stuff from happening.

// With the "for" loop below, the first layer will always move directly with the view, the last layer will always move the slowest of all.
// If you want different parallax behavior, use the manual override at the advanced section below.
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//CHANGE THESE

    strength        =       40;
    fieldspeed      =       100;
    invert_pf       =       false;

    
//DON'T TOUCH

if!(invert_pf){for(j=0;j<layers;j++){pf[layers-j-1]=1+(((10*median(0,strength,100)*(j/1000)))/layers)-(median(0,fieldspeed,100)/100);if (pf[layers-j-1]>1) {pf[layers-j-1]=1};if (pf[layers-j-1]<0) {pf[layers-j-1]=0};};}
else{for(j=0;j<layers;j++){pf[j]=1+(((10*median(0,strength,100)*(j/1000)))/layers)-(median(0,fieldspeed,100)/100);if (pf[j]>1) {pf[j]=1};if (pf[j]<0) {pf[j]=0};};}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





// Below are some starfield-wide properties, these go for the entire starfield, ALL layers, for more control see the "advanced tweaks" part below.

// [scale=1] - Scale all stars, scale 1 is same as the sprite's size.
// [rotation=0] - Rotate all stars, again, this goes for EACH star, each star will rotate by this amount of degrees.
// [color=c_white] - Randomizes color blending. c_white basically means no blending.
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//-parameters-\\

    starscale       =       1;
    rotation        =       0;
    color           =       c_white;  //for all color codes: http://docs.yoyogames.com/source/dadiospice/002_reference/drawing/color%20and%20blending/index.html

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





// Below are the randomization toggles, they randomize certain aspects of ALL layers, for more control see the "advanced tweaks" part below.

// [randomscale=true,upperbound=2,lowerbound=0.5] - set random scale to "1" to enable it. You can set the bounds with "upperbound" and "lowerbound", which determine the highest and lowest possible star size.
// [randomrotation=false] - Randomly rotates each star.
// [iirandom=true] - Randomizes image_index per star. Useful if you have animating stars and don't want all of them to blink at the same time.
// [randomalpha=false,upperalpha=0,loweralpha=1] - Randomizes transparency of each star, use upper/lower alpha to determine bounds (floats between 0 - 1)
// [randomcolor=false] - Randomizes blending color for each star, works best for gray/white stars, but feel free to experiment :D
// [blendmode=0] - blending mode of all layers (0=normal 1=additive). Use additive if you want a bright effect.
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//-parameters-\\

    randomscale     =      true;
    upperbound      =      2;
    lowerbound      =      0.5;
    
    randomrotation  =      false;
    
    iirandom        =      true;
    
    randomalpha     =      false;
    upperalpha      =      1;
    loweralpha      =      0.75;
    
    randomcolor     =      false;
    
    blendmode       =      0;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//INITIALIZATION OF STARFIELD, DON'T TOUCH OR YOUR FINGERS WILL BURN HARD AND FALL OFF YOUR HAND, JUST READ THE COMMENTS TO UNDERSTAND WHAT HAPPENS //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Initializing variables for view speed determination and initial starfield
    xchange=0;
    ychange=0;
    firstrun=1;
    pvx=__view_get( e__VW.XView, 0 );
    pvy=__view_get( e__VW.YView, 0 );
    timer=2;
    firstgenerated=0;
    zoomfactor=1;
    initstarcount=stars
    manual_x=0;
    manual_y=0;
    manual_control=0;


//prepare bounds
    startval_a[0]=0
    for(w=0;w<layers;w++){startval_a[w+1]=startval_a[w]+round((stars/layers));}
    startval_a[layers]=stars

//since weights are actually taken in account during drawing, we must initialize them first even though they don't get used or an error will follow.
    for(j=0;j<layers;j++){realweight[j]=1;}

//Randomizing seed
    random_set_seed(irandom(1000));

//Starting the loop for the layers
    for(j=0;j<layers;j++)
    {
    //Starting the loop for each of the stars per layer
        for(i=floor(j*((stars)/layers));i<floor((j+1)*((stars)/layers));i++) 
        {
        //Applying random properties and initializing arrays for them. If randomization was turned off, the single variable setting will be used instead. If advanced mode is used, this part will not be executed.
            if (use_advanced_mode=0)
            {
        //Determine sprite width/height of each layer and store it in an array
            h[j] = sprite_get_height(startypes[j])
            w[j] = sprite_get_width(startypes[j])
            
            randscale[i]=(lowerbound+random(upperbound-lowerbound))*randomscale*starscale+!randomscale*starscale
            rot[i]=randomrotation*irandom(360)+rotation
            iistart[i]=(iirandom*irandom(sprite_get_number(startypes[j])))+!iirandom*image_index
            randalpha[i]=randomalpha*(loweralpha+random(upperalpha))+!randomalpha*1
            randcolor[i]=randomcolor*make_color_rgb(random(255),random(255),random(255))+!randomcolor*color
            
            
        //determine sprite border based on maximum possible size (at 45 degree angle)
            hborder[i]=h[j]*randscale[i]*sqrt(2) //if you have tilted sprites, the sqrt(2) is the factor required to find the max width/height of a SQUARE sprite, which occurs when it is at an angle of 45 degrees.
            wborder[i]=w[j]*randscale[i]*sqrt(2) //This is by the theorem of Pythagoras a = sqrt(b^2 + c^2) (actually a^2 = b^2 + c^2) with 'a' being the long side of a right triangle (a square/rectangle consists of two right triangles). If b = c, then it becomes sqrt(2*c^2) = c*sqrt(2), where c can be either width or height since it was equal to b, thus it is used for both of them here.
            wborder_o[i]=wborder[i] //extra array used for temp zooming solution
            hborder_o[i]=hborder[i] //extra array used for temp zooming solution
            prototype_zoom[j]=0 //Since it's not that useful yet, only available in advanced mode
            }
    
        //Initialize the other arrays we are going to use, see draw event for details.
            prevxview[i]=0
            prevyview[i]=0
            xview_b[i]=0
            yview_b[i]=0
            wview_b[i]=0
            hview_b[i]=0
            starx[i]=0
            stary[i]=0
            pf_offset[i]=0
    //end of star loop
        }
//end of layer loop
    }
//done

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////







    ////////////////////////////////////
    // ADVANCED MODE - ROUGH 'N DIRTY //
    ////////////////////////////////////

    ////////////////////////////////////

    
// USAGE:

// Just change things under: 1.) global tweaks, 2.) weight adjustments, 3.) layer section. They are indicated with some comment slashes (////) above/around them.
// If you need more than the eight provided layers, you simply copy and paste the last layer under itself and change the "j" index (from 7 to 8 in this case).
// The video available at the marketplace (and on youtube) details the entire process of adjusting and adding layers.

// Layers get drawn ontop of eachother, this means that layer0 (with j=0) gets drawn at the background, layer1 ontop of it, layer2 ontop of that, etc etc.
// Before the loops start, it has a nice weight section where you set the weight per layer (default value is 1 for each of them).
// Examples for the first eight layers can be found below. Below the entire section, some more randomization examples are provided.



if (use_advanced_mode==1)
{
//INIT - Initializing some extra vars required to make this work fluently
    addlayer=1;
    totalweight=0;
    leftover=0;
    startval=0;
    startval_a[0]=0;
    manual_x=0;
    manual_y=0;

    
/////////////////////////////////////////////////
//GLOBAL TWEAKS - CHANGE STUFF HERE IF YOU NEED//
    stars               =       250;
    backg_color         =       c_black;
    manual_control      =       true;           //manual_control allows you to control the panning of the field with the variables "manual_x" and "manual_y".
    alpha_clamping      =       0.01;           //do not draw sprites with an alpha below this value. Set higher to increase performance, especially useful with the alpha faders.
    
    
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//WEIGHT ADJUSTMENTS - CHANGE STUFF HERE IF YOU NEED - Lower than 1 reduces the amount of stars for that layer, higher than 1 increases the amount of stars for that layer.//
    weight[0]=0.05
    weight[1]=0.5
    weight[2]=0.05
    weight[3]=5
    weight[4]=1
    weight[5]=1
    weight[6]=1
    weight[7]=1
//etc.. add more if you have more layers that need weight adjustments, layers get automatically reweighted below to fit the amount of stars
//WARNING: YOU NEED TO ADD A WEIGHT FOR EVERY LAYER YOU GOT, OR IT WILL NOT WORK. Example: If you have 8 different layers, your last index for weight would be 7, so weight[7] is the last index (since [0] is also a layer).


//Basing amount of layers on amount of weights
    layers=array_length_1d(weight)
    for(w=0;w<layers;w++){realweight[w]=1;}
//reweighting, spreading the un-used part over all the layers to fit star count, DON'T TOUCH
    for(w=0;w<layers;w++){totalweight=totalweight+weight[w];}
    leftover=(layers-totalweight)/(layers+1)
    for(w=0;w<layers;w++){realweight[w]=(weight[w]+weight[w]*leftover);}
//prepare array with pre-defined bounds
    startval_a[0]=0
    for(w=0;w<layers;w++){startval_a[w+1]=startval_a[w]+round(realweight[w]*(stars/layers));}
    startval_a[layers]=stars





for(j=0;j<layers;j++)
{
//Some initialization
    h[j] = 1
    w[j] = 1
    lin_int[j]          =       1       
    animates[j]         =       1       
    random_ii_start[j]  =       0       
    a_jitter[j]         =       0       
    a_j_intensity[j]    =       5       
    a_j_frequency[j]    =       15       
    adv_blend_mode[j]   =       0    
    scale_to_zoom[j]    =       0 
    prototype_zoom[j]   =       0      
//Start star loop while taking in account weights
for(i=startval_a[j];i<startval_a[j+1];i++) 
{
//Some more initialization
    ii_start_val[i]=0
    hborder[i]=0
    wborder[i]=0
    s_scale[i]=0   
    s_angle[i]=0       
    s_alpha[i]=1       
    s_color[i]=c_white 
    s_index[i]=0  



///////////////////////////////////////////////
//LAYER SECTION - START TWEAKING LAYERS BELOW//

//---LAYER 0---\\ (the first/top layer)
if (j==(0))
    {
        //MAIN - main properties of the layer, such as parallax factor and sprite.
    startypes[j]        =       star3       //sprite to use, you can have multiple sprites per layer if you use a function like "choose". set to -1 to disable the layer.
    pf[j]               =       0.1         //parallax factor, stay between 0 and 1, where 0 means that the layer will move on the same layer as objects, and 1 means that the layer will not visibly move at all. So larger = slower.
    pf_offset[i]        =       random_range(-0,0)   //random parallax offset per star on the layer, keep small if you still want distinctiveness between the layers, normally (-0,0) (you could try somehting like (-0.05,0.05)).
    
        //SPRITE PROPERTIES - you can randomize these parameters for cool effects, check examples below the layer system.
    s_scale[i]          =       1           //sprite scale in both directions
    s_angle[i]          =       0           //sprite angle
    s_alpha[i]          =       1           //sprite alpha
    s_color[i]          =       c_white     //c_white //c_white //color blending for sprite, c_white means no color blending
    s_index[i]          =       0           //image index within the sprite to start with, handy if you don't want animating sprites and instead want to display many variations of a single sprite (with a random function obviously), make sure to turn off animation.
    
        //LAYER PROPERTIES - randomization here is meaningless, so don't do it to keep consistency.
    lin_int[j]          =       true        //whether linear interpolation should be enabled for this layer, 1 for enabled, 0 for disabled (disable it if you want pixelated graphics).
    animates[j]         =       false       //whether the layer should animate according to the animations of the sprites within
    random_ii_start[j]  =       false       //randomize the starting image index so animations don't happen synchronously 
    a_jitter[j]         =       false       //adds some jitter to the animation, cool for lighting effects
    a_j_intensity[j]    =       5           //increase for more intense jitter, use whole numbers (integers)
    a_j_frequency[j]    =       60          //frequency of jitter effect, the number is the amount of jitter changes per second, set to room speed for fastest jitter
    adv_blend_mode[j]   =       false       //additive blending (blend_mode=1) is good for things that need to be bright
    scale_to_zoom[j]    =       false       //whether the sprites in this layer should scale along with the zoom option. Good idea to turn it on for nebulae, and off for stars.
    prototype_zoom[j]   =       true        //special type of zooming that works well when zooming out. May have undesired results, use with caution.
    topfade[j]          =       false       //this makes the alpha fade to zero as the sprite gets closer to the top of the screen, cool for very specific non-topdown effects (fire!).
    bottomfade[j]       =       false       //this makes the alpha fade to zero as the sprite gets closer to the bottom of the screen.
    leftfade[j]         =       false       //this makes the alpha fade to zero as the sprite gets closer to the left of the screen.
    rightfade[j]        =       false       //this makes the alpha fade to zero as the sprite gets closer to the right of the screen.
    fadestrength[j]     =       20          //to what power the fader's strength should be, higher values increase the contrast between faded/non-faded
    fadexoffset[j]      =       0           //adds a certain offset to the x position of the fade on the screen, can be negative
    fadeyoffset[j]      =       0           //adds a certain offset to the y position of the fade on the screen, can be negative
    fadeboxoffset[j]    =       0           //This is best used with all four fade modes or two opposing sides on, making it larger will expand the fading area outwards (so you will start to see sprites in the center, fading out outwards), making it smaller will shrink it.
    
        //SYSTEM (I.E. DON'T TOUCH)
    //show_message(i)
    }
    
//---LAYER 1---\\
if (j==(1))
    {
        //MAIN
    startypes[j]        =       coolstar2      
    pf[j]               =       0.7
    pf_offset[i]        =       random_range(-0,0)     
    
        //SPRITE PROPERTIES
    s_scale[i]          =       1       
    s_angle[i]          =       0       
    s_alpha[i]          =       1       
    s_color[i]          =       c_white 
    s_index[i]          =       0       
    
        //LAYER PROPERTIES
    lin_int[j]          =       true      
    animates[j]         =       true       
    random_ii_start[j]  =       false       
    a_jitter[j]         =       false       
    a_j_intensity[j]    =       5
    a_j_frequency[j]    =       5 
    adv_blend_mode[j]   =       false       
    scale_to_zoom[j]    =       false
    prototype_zoom[j]   =       true
    topfade[j]          =       false
    bottomfade[j]       =       false
    leftfade[j]         =       false
    rightfade[j]        =       false 
    fadestrength[j]     =       20 
    fadexoffset[j]      =       0           
    fadeyoffset[j]      =       0
    fadeboxoffset[j]    =       0           
    
        //SYSTEM (I.E. DON'T TOUCH)
    }

//---LAYER 2---\\
if (j==(2))
    {
        //MAIN
    startypes[j]        =       coolstar2       
    pf[j]               =       0.7
    pf_offset[i]        =       random_range(-0,0)     
    
        //SPRITE PROPERTIES
    s_scale[i]          =       1       
    s_angle[i]          =       0       
    s_alpha[i]          =       1       
    s_color[i]          =       c_white 
    s_index[i]          =       0       
    
        //LAYER PROPERTIES
    lin_int[j]          =       true       
    animates[j]         =       true       
    random_ii_start[j]  =       false       
    a_jitter[j]         =       false       
    a_j_intensity[j]    =       5
    a_j_frequency[j]    =       5 
    adv_blend_mode[j]   =       true
    scale_to_zoom[j]    =       false 
    prototype_zoom[j]   =       true
    topfade[j]          =       false
    bottomfade[j]       =       false
    leftfade[j]         =       false
    rightfade[j]        =       false
    fadestrength[j]     =       20
    fadexoffset[j]      =       0           
    fadeyoffset[j]      =       0
    fadeboxoffset[j]    =       0  
    
        //SYSTEM (I.E. DON'T TOUCH)
    }
    
//---LAYER 3---\\
if (j==(3))
    {
    startypes[j]        =       neb   
    pf[j]               =       0.1
    pf_offset[i]        =       random_range(-0.05,0.05)     
    
        //SPRITE PROPERTIES
    s_scale[i]          =       5     
    s_angle[i]          =       irandom(360)      
    s_alpha[i]          =       1       
    s_color[i]          =       c_white 
    s_index[i]          =       0       
    
        //LAYER PROPERTIES
    lin_int[j]          =       true      
    random_ii_start[j]  =       true       
    a_jitter[j]         =       true       
    a_j_intensity[j]    =       5       
    a_j_frequency[j]    =       40     
    adv_blend_mode[j]   =       false  
    scale_to_zoom[j]    =       false
    prototype_zoom[j]   =       false
    topfade[j]          =       false 
    bottomfade[j]       =       false
    leftfade[j]         =       false
    rightfade[j]        =       false
    fadestrength[j]     =       20
    fadexoffset[j]      =       500           
    fadeyoffset[j]      =       0
    fadeboxoffset[j]    =       1280  

       //SYSTEM (I.E. DON'T TOUCH)    
    }
    
//---LAYER 4---\\
if (j==(4))
    {
        //MAIN
    startypes[j]        =       star3       
    pf[j]               =       0.1
    pf_offset[i]        =       random_range(-0,0)     
    
        //SPRITE PROPERTIES
    s_scale[i]          =       1       
    s_angle[i]          =       0       
    s_alpha[i]          =       1       
    s_color[i]          =       c_white 
    s_index[i]          =       0        
    
        //LAYER PROPERTIES
    lin_int[j]          =       true       
    animates[j]         =       true       
    random_ii_start[j]  =       false       
    a_jitter[j]         =       false       
    a_j_intensity[j]    =       5
    a_j_frequency[j]    =       5 
    adv_blend_mode[j]   =       true  
    scale_to_zoom[j]    =       true  
    prototype_zoom[j]   =       true
    topfade[j]          =       false  
    bottomfade[j]       =       false
    leftfade[j]         =       false
    rightfade[j]        =       false
    fadestrength[j]     =       20
    fadexoffset[j]      =       0           
    fadeyoffset[j]      =       0 
    fadeboxoffset[j]    =       0   

        //SYSTEM (I.E. DON'T TOUCH)
    }
    
//---LAYER 5---\\
if (j==(5))
    {
        //MAIN
    startypes[j]        =       star2       
    pf[j]               =       0.1
    pf_offset[i]        =       random_range(-0,0)     
    
        //SPRITE PROPERTIES
    s_scale[i]          =       1       
    s_angle[i]          =       0       
    s_alpha[i]          =       1       
    s_color[i]          =       c_white 
    s_index[i]          =       0       
    
        //LAYER PROPERTIES
    lin_int[j]          =       true       
    animates[j]         =       true       
    random_ii_start[j]  =       false       
    a_jitter[j]         =       false       
    a_j_intensity[j]    =       5
    a_j_frequency[j]    =       5 
    adv_blend_mode[j]   =       true
    scale_to_zoom[j]    =       false 
    prototype_zoom[j]   =       true
    topfade[j]          =       false
    bottomfade[j]       =       false
    leftfade[j]         =       false
    rightfade[j]        =       false
    fadestrength[j]     =       20
    fadexoffset[j]      =       0           
    fadeyoffset[j]      =       0
    fadeboxoffset[j]    =       0        

        //SYSTEM (I.E. DON'T TOUCH)
    }
    
//---LAYER 6---\\
if (j==(6))
    {
        //MAIN
    startypes[j]        =       star1       
    pf[j]               =       0.1
    pf_offset[i]        =       random_range(-0,0)     
    
        //SPRITE PROPERTIES
    s_scale[i]          =       1       
    s_angle[i]          =       0       
    s_alpha[i]          =       1       
    s_color[i]          =       c_white 
    s_index[i]          =       0       
    
        //LAYER PROPERTIES
    lin_int[j]          =       true       
    animates[j]         =       true       
    random_ii_start[j]  =       false       
    a_jitter[j]         =       false       
    a_j_intensity[j]    =       5
    a_j_frequency[j]    =       5 
    adv_blend_mode[j]   =       true  
    scale_to_zoom[j]    =       false 
    prototype_zoom[j]   =       true
    topfade[j]          =       false    
    bottomfade[j]       =       false
    leftfade[j]         =       false
    rightfade[j]        =       false
    fadestrength[j]     =       20
    fadexoffset[j]      =       0           
    fadeyoffset[j]      =       0
    fadeboxoffset[j]    =       0    

        //SYSTEM (I.E. DON'T TOUCH)
    }
    
//---LAYER 7---\\
if (j==(7))
    {
        //MAIN
    startypes[j]        =       cloudpuff       
    pf[j]               =       0.3
    pf_offset[i]        =       random_range(-0,0)     
    
        //SPRITE PROPERTIES
    s_scale[i]          =       10+irandom(30)       
    s_angle[i]          =       irandom(360)       
    s_alpha[i]          =       0.2+random(0.4)       
    s_color[i]          =       make_color_rgb(30+irandom(60),30,30+irandom(150)) 
    s_index[i]          =       0       
    
        //LAYER PROPERTIES
    lin_int[j]          =       true       
    animates[j]         =       true       
    random_ii_start[j]  =       false       
    a_jitter[j]         =       false       
    a_j_intensity[j]    =       5
    a_j_frequency[j]    =       5 
    adv_blend_mode[j]   =       true  
    scale_to_zoom[j]    =       false 
    prototype_zoom[j]   =       false
    topfade[j]          =       false 
    bottomfade[j]       =       false
    leftfade[j]         =       false
    rightfade[j]        =       false    
    fadestrength[j]     =       20
    fadexoffset[j]      =       0           
    fadeyoffset[j]      =       0
    fadeboxoffset[j]    =       0   

        //SYSTEM (I.E. DON'T TOUCH)
    }
    
//***copy an entire layer from above and paste it here***\\    
    
//ETC... COPY PASTE THE "IF" CODEBLOCK (SO BASICALLY THE WHOLE LAYER) BETWEEN THIS LINE AND THE LAST LAYER TO ADD MORE, DON'T FORGET TO CHANGE THE INDEX IN "if (j==(INDEX))", AND ESPECIALLY DON'T FORGET TO ADD A WEIGHT FOR THE LAYER AT THE TOP



//Some additional preparations, don't touch!
    h[j] = sprite_get_height(startypes[j])
    w[j] = sprite_get_width(startypes[j])
    hborder[i]=h[j]*s_scale[i]*sqrt(2)
    wborder[i]=w[j]*s_scale[i]*sqrt(2)
    wborder_o[i]=wborder[i]
    hborder_o[i]=hborder[i]
    if (random_ii_start[j]==1) {ii_start_val[i]=random(sprite_get_number(startypes[j]));}
    else {ii_start_val[j]=0}

//Final touches, no need to change anything here below so... DON'T TOUCH
    prevxview[i]=0
    prevyview[i]=0
    xview_b[i]=0
    yview_b[i]=0
    wview_b[i]=0
    hview_b[i]=0
    starx[i]=0
    stary[i]=0
    debug[j]=i
    a_j_time[j]=0
    randomjitter[j]=a_j_intensity[j]

//end of star loop
}
//end of layer loop
}
//end of advanced mode
}





//More indepth explanations/randomization examples below

///////////\\\\\\\\\\\
//---SPRITE SCALE---\\
///////////\\\\\\\\\\\

// Some examples of what you could do with scale \\

//    ls[0]=1                             //normal sprite size
//    ls[1]=2                             //twice the normal size in both directions (both width and height)
//    ls[2]=0.5                           //half the normal size
//    ls[3]=random(1)                     //random scale between 0 and 1, a scale of 0 is not recommended because it will still draw something but it will barely be visible, taking up valuable resources for nothing.
//    ls[4]=0.25 + random(2.00 - 0.25)    //random scale with lower bound at 0.25 and upper bound at 2.00
//    ls[5]=choose(1,2,3)                 //simply choose either 1, 2, or 3 as  scale
//    ls[6]=irandom(10)                   //random full integer between 0 and 10


///////////\\\\\\\\\\\
//---SPRITE ANGLE---\\
///////////\\\\\\\\\\\

// Some examples for sprite angles below \\

//    sa[0]=0                             //normal sprite angle
//    sa[1]=180                           //180 degrees flipped
//    sa[2]=irandom(360)                  //completely random angle
//    sa[3]=90 + irandom(180-90)          //random angle between 90 and 180
//    sa[4]=choose(0,90,180,270)          //choose angle in increments of 90 degrees








    ////////////////////////////////////
    // TROUBLE SHOOTING AND FAQ STUFF //
    ////////////////////////////////////

    ////////////////////////////////////
    
    
//FAQ will expand once people start using this resource more often, then when people run into trouble I can find out the issues and post them here.

//----FAQ----//

// [Q:] The stars twitch oddly and an ugly horizontal line appears in the view that moves around
// [A:] You need to turn v-sync on if you see this (Global game settings -> windows), it usually happens with views that have a smaller resolution than your monitor.

// [Q:] Things are slowing down....
// [A:] It's very simple: lower starcount == more performance, no other factors play much of a role (aside from sprite resolution). Reduce starcount if things are slow!

// [Q:] I have interpolation off in the global game settings but it still appears to be on in the game while using this (i.e. I want pixelated graphics but it all looks smooth and smudgy), what gives?
// [A:] At the very top of this script there's a toggle that must be set according to what you have in the global settings, I can't really change the way this works, as I cannot access any of the values for the global game settings in scripts.

// [Q:] I have trouble implementing this correctly into my game.
// [A:] Please PM me with all details and problems and I will work it out (and include the problem/answer in the FAQ).

// [Q:] Zoom does not work too well..
// [A:] Zoom is still WIP, it requires a lot of work to adapt zooming to my approach, but you can use a WIP version already by accessing the variable "zoomfactor" in this object.

// [Q:] What kind of support can we expect in the future?
// [A:] Support for sprites with offset origin, more speed options for the layers, many more layer properties including animations, many more presets, more general background generation that accepts non-view values as input (for games that have no view movement, sidescrollers etc), some special surface implementation to improve performance, probably some other things from suggestions and brain farts.

//-END OF FAQ-//



//Special trouble-shooting vars - IF EVERYTHING WORKS, PLEASE DO NOT TOUCH!

    timer=2                 //increase this if the first stars do not get drawn, decrease if you start seeing gaps, generally 2 is the best option though.
    bgdebug=0               //debug module, feel free to turn on/off, variables to watch can be added in the draw event at the bottom, but there are some convenient ones there already.
    show_debug_overlay(0)   //inbuilt fps monitoring and such. This is actually coupled to the variable above (toggle with f12), only override when necessary.



/* */
}
/*  */
