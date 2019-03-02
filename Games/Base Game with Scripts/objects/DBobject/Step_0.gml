/// @description Some calculations before drawing  - DO NOT TOUCH!
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Calculations for the draw event, these are not crucial to put in the draw event itself, so this is a good way to save some performance.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////
//WARNING, only modify things in here if you know what you are doing//
//////////////////////////////////////////////////////////////////////

//This is part of a mechanism necessary to create the stars from the start
//because xview and yview may get manipulated, a timer is needed to make sure it doesn't register that as a change
//All this does, is set "firstrun" to 0 when you move.
timer=timer-1;
if (timer<0) {timer=0;}
if timer=0 && (!(pvx==__view_get( e__VW.XView, 0 )) || !(pvy==__view_get( e__VW.YView, 0 ))) {firstrun=0;}
pvx=__view_get( e__VW.XView, 0 );
pvy=__view_get( e__VW.YView, 0 );


//set the background color once..
if (timer==1)&&!(room_bgcolor){__background_set_colour( backg_color );}


//Uncomment this to randomize the seed constantly, not necessary per-se.
//random_set_seed(irandom(1000));


//Setting the blendmode according to config
if blendmode=1 {draw_set_blend_mode(bm_add);}
else {draw_set_blend_mode(bm_normal);}

//starting the main loop for all stars (i) and layers (j)
for(j=0;j<layers;j++)
{
    for(i=(startval_a[j]);i<(startval_a[j+1]);i++) 
    {
        //So when a layer has the value -1, it will not be calculated nor drawn
        if !(startypes[j]==-1)
        {
            //prototype zooming system, does not work as intended yet due to bad formula.
            if (prototype_zoom[j]==1)
            {
            wborder[i]=wborder_o[i]-min(0,(power(zoomfactor*(1-(pf[j]+pf_offset[i])),2)-1)*__view_get( e__VW.WView, 0 )*2)
            hborder[i]=hborder_o[i]-min(0,(power(zoomfactor*(1-(pf[j]+pf_offset[i])),2)-1)*__view_get( e__VW.HView, 0 )*2)
            }
            
            //randomizers to prevent uniform sprite replacement which will kill random generation when moving around
            xchange=random(300+w[j]*2)
            ychange=random(300+h[j]*2)
            
            //This is where it draws the first stars, without this the entire thing would break as it relies on existing positions.
            //The stars get drawn over the entire height/width of the view at that point where it is, with parallax calculation ((pf[j]+pf_offset[i]))
            if (firstgenerated<stars-1 && timer=0)
            {
            starx[i]=-xview_b[i]*(pf[j]+pf_offset[i])+xview_b[i]+random(wview_b[i])
            stary[i]=-yview_b[i]*(pf[j]+pf_offset[i])+yview_b[i]+random(hview_b[i])
            firstgenerated=firstgenerated+1;
        }
        
        
        
        //The drawing bounds below are obsolete, don't use them; they will cause clipping, they should not be necessary anyway and are just an extra (but useless) measure.
        //The stars get drawn while taking in account all the randomizations (size, angle, alpha, etc) and the parallax.
        //I'm just keeping them here for convenience, would they ever become relevant again.
        /*if (starx[i]<(xbound+xview_b[i]*(pf[j]+pf_offset[i]))) && (starx[i]>(xview_b[i]-xview_b[i]*(pf[j]+pf_offset[i]))) && (stary[i]<(ybound+yview_b[i]*(pf[j]+pf_offset[i]))) && (stary[i]>(yview_b[i]-yview_b[i]*(pf[j]+pf_offset[i])))*/ 
        }
    //star loop ends after this
    }
//layer loop ends after this
}

/* */
/*  */
