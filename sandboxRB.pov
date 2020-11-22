#include "inc/sky.inc"
#include "inc/triedreXYZ.inc"
#include "pawnRB.pov" 
#include "towerRB.pov"  
#include "knight.pov"


camera 
{
    location <7,10,5>
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
 
  


