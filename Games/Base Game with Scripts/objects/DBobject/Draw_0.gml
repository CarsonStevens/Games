/// @description Drawing the backgrounds - DO NOT TOUCH

//////////////////////////////////////////////////////////////////////
//WARNING, only modify things in here if you know what you are doing//
//////////////////////////////////////////////////////////////////////

//This is where the party starts, two nested for loops to deal with the layers (j) and the stars (i) which have been nicely distributed over the layers
//It will nicely distribute the amount of stars over the layers here, with variable weights if advanced mode was used.
    for(j=0;j<layers;j++)
    {
        //Setting the blendmodes and interpolation here so it doesn't become a fat resource hog
        if (use_advanced_mode=1)
            {
            if adv_blend_mode[j]=1 {draw_set_blend_mode(bm_add);}
            else {draw_set_blend_mode(bm_normal);}
            texture_set_interpolation(lin_int[j])
            }
            for(i=(startval_a[j]);i<(startval_a[j+1]);i++) 
                {
                    if !(startypes[j]==-1)
                    {
                        //This is a new part, the general panning variable, to allow manual control when necessary.
                        if (manual_control==0){manual_x=0;manual_y=0;}
                        else {xpan=__view_get( e__VW.XView, 0 );ypan=__view_get( e__VW.YView, 0 );}
                        starx[i]=starx[i]+manual_x-manual_x*(pf[j]+pf_offset[i])
                        stary[i]=stary[i]+manual_y-manual_y*(pf[j]+pf_offset[i])
                        
                        //So this is where it makes the new "view" variables that take in account the size of the sprites, very important or else you will see clipping.
                        wview_b[i]=(__view_get( e__VW.WView, 0 )+2*wborder[i]+2*wborder[i]*(pf[j]+pf_offset[i]))
                        hview_b[i]=(__view_get( e__VW.HView, 0 )+2*hborder[i]+2*hborder[i]*(pf[j]+pf_offset[i]))
                        xview_b[i]=(__view_get( e__VW.XView, 0 )-wborder[i]-wborder[i]*(pf[j]+pf_offset[i]))
                        yview_b[i]=(__view_get( e__VW.YView, 0 )-hborder[i]-hborder[i]*(pf[j]+pf_offset[i]))
                        
        
                        
                        //The wrapping mechanism, it detects whether a change in coordinate is large enough and then adds the room width/height to the opposite direction
                        if (xview_b[i]-prevxview[i]) < (-0.5*room_width) {starx[i]=starx[i]-wwrap+wwrap*(pf[j]+pf_offset[i]);}
                        if (xview_b[i]-prevxview[i]) > (0.5*room_width) {starx[i]=starx[i]+wwrap-wwrap*(pf[j]+pf_offset[i]);}
                        if (yview_b[i]-prevyview[i]) < (-0.5*room_height) {stary[i]=stary[i]-hwrap+hwrap*(pf[j]+pf_offset[i]);}
                        if (yview_b[i]-prevyview[i]) > (0.5*room_height) {stary[i]=stary[i]+hwrap-hwrap*(pf[j]+pf_offset[i]);}
                        
                        //The most essential part of the code below. Very basically put: it will first look at which direction the view is moving, then it will check the positions of
                        //all the stars and determine whether they will be visible or not according to values calculated earlier. This is done PER star, because it would fail otherwise.
                        //It also evaluates whether the view just has wrapped, it won't perform this code then or it would cause stars suddenly appearing out of nowhere while wrapping.
                        //The code will only run when the first stars are generated and when the view has moved for the first time, to prevent issues.
                        if (firstrun==0)
                        {
                            if xview_b[i]>prevxview[i] //right
                                {
                                if ((starx[i])<(-xview_b[i]*(pf[j]+pf_offset[i])+xview_b[i])) && !(abs(xview_b[0]-prevxview[0])>0.5*room_width) {starx[i]=(-xview_b[i]*(pf[j]+pf_offset[i])+wview_b[i]+xview_b[i]+random(xchange));stary[i]=-yview_b[i]*(pf[j]+pf_offset[i])+yview_b[i]+random(hview_b[i])};
                                }
                                
                            if xview_b[i]<prevxview[i] //left
                                {
                                if ((starx[i])>(-xview_b[i]*(pf[j]+pf_offset[i])+xview_b[i]+wview_b[i])) && !(abs(xview_b[0]-prevxview[0])>0.5*room_width) {starx[i]=(-xview_b[i]*(pf[j]+pf_offset[i])+xview_b[i]-random(xchange));stary[i]=-yview_b[i]*(pf[j]+pf_offset[i])+yview_b[i]+random(hview_b[i])};
                                }
                                
                            if yview_b[i]>prevyview[i] //down
                                {
                                if (stary[i]<(-yview_b[i]*(pf[j]+pf_offset[i])+yview_b[i])) && !(abs(yview_b[0]-prevyview[0])>0.5*room_height) {stary[i]=(-yview_b[i]*(pf[j]+pf_offset[i])+hview_b[i]+yview_b[i]+random(ychange));starx[i]=-xview_b[i]*(pf[j]+pf_offset[i])+xview_b[i]+random(wview_b[i])};
                                }
                                
                            if yview_b[i]<prevyview[i] //up
                                {
                                if (stary[i]>(-yview_b[i]*(pf[j]+pf_offset[i])+yview_b[i]+hview_b[i])) && !(abs(yview_b[0]-prevyview[0])>0.5*room_height) {stary[i]=(-yview_b[i]*(pf[j]+pf_offset[i])+yview_b[i]-random(ychange));starx[i]=-xview_b[i]*(pf[j]+pf_offset[i])+xview_b[i]+random(wview_b[i])};
                                }
                        }
                        
                        if (use_advanced_mode=0) {draw_sprite_ext(startypes[j],iistart[i]+image_index,xview_b[i]*(pf[j]+pf_offset[i])+starx[i],yview_b[i]*(pf[j]+pf_offset[i])+stary[i],randscale[i],randscale[i],rot[i],randcolor[i],randalpha[i]);}
                        else if (use_advanced_mode=1) 
                            {
                            //alpha fader setup
                            if (topfade[j]==1){topfader=power((fadeboxoffset[j]-fadeyoffset[j]+__view_get( e__VW.YView, 0 )*(pf[j]+pf_offset[i])-__view_get( e__VW.YView, 0 )+stary[i])/(__view_get( e__VW.HView, 0 )),fadestrength[j]);}else{topfader=1;}
                            if (bottomfade[j]==1){bottomfader=power((fadeboxoffset[j]+fadeyoffset[j]+__view_get( e__VW.HView, 0 )-(__view_get( e__VW.YView, 0 )*(pf[j]+pf_offset[i])-__view_get( e__VW.YView, 0 )+stary[i]))/(__view_get( e__VW.HView, 0 )),fadestrength[j]);}else{bottomfader=1;}
                            if (leftfade[j]==1){leftfader=power((fadeboxoffset[j]-fadexoffset[j]+__view_get( e__VW.XView, 0 )*(pf[j]+pf_offset[i])-__view_get( e__VW.XView, 0 )+starx[i])/(__view_get( e__VW.WView, 0 )),fadestrength[j]);}else{leftfader=1;}
                            if (rightfade[j]==1){rightfader=power((fadeboxoffset[j]+fadexoffset[j]+__view_get( e__VW.WView, 0 )-(__view_get( e__VW.XView, 0 )*(pf[j]+pf_offset[i])-__view_get( e__VW.XView, 0 )+starx[i]))/(__view_get( e__VW.WView, 0 )),fadestrength[j]);}else{rightfader=1;}
                            a_j_time[j]=a_j_time[j]-(1/stars);
                            if (a_j_time[j] < 0) {a_j_time[j] = (room_speed/a_j_frequency[j]);randomjitter[j]=irandom(a_j_intensity[j]);}
                                if !((s_alpha[i]*topfader*bottomfader)<alpha_clamping)
                                {
                                    draw_sprite_ext
                                    (
                                        startypes[j],
                                        s_index[i]+a_jitter[j]*randomjitter[j]+ii_start_val[i]+animates[j]*image_index,
                                        xview_b[i]*(pf[j]+pf_offset[i])+zoomfactor*starx[i]-(zoomfactor-1)*xview_b[i]*(1-(pf[j]+pf_offset[i]))-(zoomfactor-1)*0.5*wview_b[i],
                                        yview_b[i]*(pf[j]+pf_offset[i])+zoomfactor*stary[i]-(zoomfactor-1)*yview_b[i]*(1-(pf[j]+pf_offset[i]))-(zoomfactor-1)*0.5*hview_b[i],
                                        s_scale[i]+(zoomfactor-1)*s_scale[i]*scale_to_zoom[j],
                                        s_scale[i]+(zoomfactor-1)*s_scale[i]*scale_to_zoom[j],
                                        s_angle[i],
                                        s_color[i],
                                        s_alpha[i]*topfader*bottomfader*leftfader*rightfader
                                    );
                                }
                            }
                    
                
                    }
                //Due to the parallax effect and the addition of a sprite border that varies per sprite, the previous x and y we check against has to be per star as well.
                    prevxview[i]=xview_b[i]+manual_x
                    prevyview[i]=yview_b[i]+manual_y
            //star loop ends after this
                }
        //We want these functions to only be called when necessary, because they are quite intensive
            if (use_advanced_mode=1)
                {
                if !(lin_int[j]==interpolation) texture_set_interpolation(interpolation)
                if (adv_blend_mode[j]=1) {draw_set_blend_mode(bm_normal);}
                }
//layer loop ends after this
    }



    
//debug module, set 'bgdebug' at the trouble shooting section to 0 to hide
if (blendmode=1) {draw_set_blend_mode(bm_normal);}
if bgdebug=1
{
draw_set_color(c_yellow)
draw_set_font(DBfont)
draw_text(__view_get( e__VW.XView, 0 )+100,__view_get( e__VW.YView, 0 )+120,string_hash_to_newline("X and Y position of view: "+string(__view_get( e__VW.XView, 0 ))+" | "+string(__view_get( e__VW.YView, 0 ))))
draw_text(__view_get( e__VW.XView, 0 )+100,__view_get( e__VW.YView, 0 )+150,string_hash_to_newline("Sprites per layer (with weights): "+string(startval_a)))
draw_text(__view_get( e__VW.XView, 0 )+100,__view_get( e__VW.YView, 0 )+180,string_hash_to_newline("Timers for jitter frequency: "+string(a_j_time)))
draw_text(__view_get( e__VW.XView, 0 )+100,__view_get( e__VW.YView, 0 )+210,string_hash_to_newline("FPS: "+string(fps)+" | FPS_REAL: "+string(fps_real)))
}

