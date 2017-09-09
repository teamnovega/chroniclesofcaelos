//PixelatedPope's Aspect Ratio Management System
//Coded by VEGACIDE so you don't have to. ;)
//
//Place this script in the Create Event of a blank object (preferably named obj_controller),
//and then place this Object in a new room named "_display_init".
//
//Warning: This room NEEDS to be at the top, above every other room, or else it won't work!
//...Well, it WILL work, but it will not resize the game until you progress to that room.
//Do whatever! If you want to be weird with it, be my guest.
//------


//Display Properties
ideal_width=0;
ideal_height=360;
///-----
////^^ Change the ideal_height to the desired height of your view in GameMaker.
////Not recommended to go over 540!
////Recommended ideal_height: 360 (640x360, which is 2x 1280x720 and 3x 1920x1080)
///-----

// Setting the Aspect Ratio!
aspect_ratio=window_get_width()/window_get_height();

if window_get_fullscreen() {
    aspect_ratio=display_get_width()/display_get_height();
}



///-----
////Aspect Ratio Clamp: This will restrict the aspect ratio to the ones you want your game to be played on.
////Use it if you don't want to have to optimize your game for every resolution out there!
////It is currently set to restrict the aspect ratio to 4:3 or 16:9. vv
///-----
aspect_ratio=clamp(aspect_ratio,4/3,16/9);



//-----
// This is the rest of the code. Don't change it unless you know what you're doing!
//-----
ideal_width=round(ideal_height*aspect_ratio);

// Check for odd numbers
if(ideal_width & 1)
    ideal_width++;

for(var i=1; i<=room_last; i++)
{
    if(room_exists(i))
    {
        room_set_view(i,0,true,0,0,ideal_width,ideal_height,0,0,ideal_width,ideal_height,0,0,0,0,-1)
        room_set_view_enabled(i,true);
    }
}

surface_resize(application_surface,ideal_width,ideal_height);

var w = display_get_width();
var h = display_get_height();

if (w > 1280)
and (h > 720) {
    window_set_size(1280,720);
} else {
    window_set_size(640,360);
}

room_goto(room_next(room))
