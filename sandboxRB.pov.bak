#include "inc/sky.inc"
#include "inc/triedreXYZ.inc"
#include "pawnRB.pov" 
#include "towerRB.pov"


camera 
{
    location <10,10,5>
    look_at<0,0,3>
    sky   <0,0,1>
    right <-image_width/image_height,0,0>
}           

light_source 
{
    <-3, 3, 3.5> // <x, y, z>
    color <1.0, 1.0,  1.0> // <red, green, blue>
}
light_source 
{
    <10, -10, 2> // <x, y, z>
    color <1.0, 1.0,  1.0> // <red, green, blue>
}        
light_source 
{
    <0, 0, 10> // <x, y, z>
    color <1.0, 1.0,  1.0> // <red, green, blue>
} 
 

#declare ecart = 1.5;
object{Tower(rgb<1,1,240/255>) translate <-ecart, ecart, 0>}
object{Pawn(rgb<0,0,0>) translate <ecart, -ecart,0>}


