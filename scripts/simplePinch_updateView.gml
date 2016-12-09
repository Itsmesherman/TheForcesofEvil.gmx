view_xview[0] = x - (display_get_width()*zoomOut)/2;
view_yview[0] = y - (display_get_height()*zoomOut)/2;
view_wview[0] = display_get_width() * zoomOut;
view_hview[0] = display_get_height() * zoomOut;

surface_resize(application_surface, view_wview[0], view_hview[0]);

if (movingCamera)
{
    if (device_mouse_check_button(0, mb_left))
    {
        // If there's two clicks on the screen, it's a pinch
        if (device_mouse_check_button(1, mb_left))
        {
            pinching = true;
            crtDist = (point_distance(  device_mouse_raw_x(0), device_mouse_raw_y(0),
                                        device_mouse_raw_x(1), device_mouse_raw_y(1)));
            
            if (abs(crtDist - prvDist) > 3) // If there has been non-negligibe movement...
            {
                if (crtDist > prvDist) zoomOut -= zoomOutSpeed/((1000*1000)/delta_time);
                if (crtDist < prvDist) zoomOut += zoomOutSpeed/((1000*1000)/delta_time);
            }
            
            if (zoomOut < minZoomOut) zoomOut = minZoomOut;
            if (zoomOut > maxZoomOut) zoomOut = maxZoomOut;
        }
        // If there's just one click and it didn't pinch before, it's dragging
        else if (!pinching)
        {
            if (!clickPrev) 
            {
                clickPrev = true;
                pMouse0x = device_mouse_raw_x(0);
                pMouse0y = device_mouse_raw_y(0);
                if (!followingObject)
                {
                    prevControllerX = x;
                    prevControllerY = y;
                }
                else
                {
                    prevControllerX = objectOffsetX;
                    prevControllerY = objectOffsetY;                
                }      
            }
            else 
            {
                if (!followingObject)
                {
                    x = prevControllerX - device_mouse_raw_x(0) + pMouse0x;
                    y = prevControllerY - device_mouse_raw_y(0) + pMouse0y;
                }
                else if (followingObject)
                {
                    objectOffsetX = prevControllerX - device_mouse_raw_x(0) + pMouse0x;
                    objectOffsetY = prevControllerY - device_mouse_raw_y(0) + pMouse0y;
                }
            }
        }
    
    }
    else 
    {
        clickPrev = false;
        pinching = false;
    }
}

if (followingObject) { x = followingObject.x + objectOffsetX; y = followingObject.y + objectOffsetY; }

// Limit the camera so it doesn't go off-screen
if (x < (display_get_width()*zoomOut)/2) then x = (display_get_width()*zoomOut)/2;
if (y < (display_get_height()*zoomOut)/2) then y = (display_get_height()*zoomOut)/2;
if (x > room_width - (display_get_width()*zoomOut)/2) then x = room_width - (display_get_width()*zoomOut)/2;
if (y > room_height - (display_get_height()*zoomOut)/2) then y = room_height - (display_get_height()*zoomOut)/2;





prvDist = crtDist;
