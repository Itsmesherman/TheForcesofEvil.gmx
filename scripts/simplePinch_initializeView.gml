

pMouse0x = x;
pMouse0y = y;
clickPrev = false;

pinching = false;

prevControllerX = x;
prevControllerY = y;

crtDist = 0;
prvDist = 0;

if (followingObject)
{
       x = followingObject.x;
       y = followingObject.y;
}

objectOffsetX = 0;
objectOffsetY = 0;


view_enabled = true;
view_visible[0] = true;

view_xview[0] = x - (display_get_width()*zoomOut)/2;
view_yview[0] = y + (display_get_height()*zoomOut)/2;
view_wport[0] = display_get_width();
view_hport[0] = display_get_height();

view_xview[0] = 0;
view_yview[0] = 0;
view_wview[0] = display_get_width() * zoomOut;
view_hview[0] = display_get_height() * zoomOut;

surface_resize(application_surface, view_wview[0], view_hview[0]);
