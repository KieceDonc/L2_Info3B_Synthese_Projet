#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"
#include "woods.inc"
#include "glass.inc"
#include "metals.inc"
#include "functions.inc" 
#include "stones1.inc"
#include "skies.inc"
#include "echiquier.pov"
#include "pawn.pov"
#include "king.pov"
#include "queen.pov"
#include "bishop.pov"
#include "knight.pov"
#include "tower.pov"

#declare Pi = 3.1415926535897932384626;

#declare axe=1;
#declare sca=10;
camera {
location <1.2*sca,1*sca,sca/2>
look_at <4,4,0>
sky   <0,0,1>
right <-image_width/image_height,0,0>
}

// http://users.skynet.be/bs936509/povfr1/anim/povfr-anim-01.htm
// povray main.pov +KI100 +KF200 +KFI0 +KFF10
// convert -delay 10 -loop 0 *.png animation.gif
#declare light_color = color rgb<0.5,0.5,0.5>;
light_source { <4 , 4 , 10 > light_color}
light_source { <4 , -1 , 10 > light_color}
light_source { <-1 , 4 , 10 > light_color}
light_source { <4 , 8 , 10 > light_color}
light_source { <8 , 4 , 10 > light_color}
light_source { <4 , 4 , 4 > light_color}
light_source { <2 , 2 , 0 > light_color}

#declare use_phot=0;
#declare use_area=0;

background {White} // fond blanc

global_settings{
  max_trace_level 60//32*3
  ambient_light 1.00
  assumed_gamma 2.0
  #if (use_phot)
  photons{
   spacing .025
   autostop 0
  }
  #end
}

#declare ciel=1;
#if (ciel)
  sky_sphere {S_Cloud5 rotate <90,0.051, 1>}
#end

#declare piece_transparance = 0.4;
#declare echiquier_height = 0.125;
#declare white_color = color rgb<1,1,1>;
#declare black_color = color rgb<0.2,0.2,0.2>;

// on dessine l'échiquier
echiquier_draw(<0,0,0>,1,echiquier_height)

// on dessine les points noirs et blancs
#for (_t, 0, 7, 1)
    #if(_t=3)
      pawn_draw(<_t+0.5,1.5,echiquier_height>,1,color rgbt<1,1,1,0.9>)
    #else 
      pawn_draw(<_t+0.5,1.5,echiquier_height>,1,white_color)
    #end   
    pawn_draw(<_t+0.5,6.5,echiquier_height>,1,black_color)
#end

// on dessine les rois 
king_draw(<4.5,0.5,echiquier_height>,1,white_color)
king_draw(<4.5,7.5,echiquier_height>,1,black_color)

// on dessine les reines
queen_draw(<3.5,0.5,echiquier_height>,1,white_color)
queen_draw(<3.5,7.5,echiquier_height>,1,black_color)

// on dessine les fous
bishop_drawn(<2.5,0.5,echiquier_height>,1,white_color)
bishop_drawn(<5.5,0.5,echiquier_height>,1,white_color)
bishop_drawn(<2.5,7.5,echiquier_height>,1,black_color)
bishop_drawn(<5.5,7.5,echiquier_height>,1,black_color)

// on dessine les fous
bishop_drawn(<2.5,0.5,echiquier_height>,1,white_color)
bishop_drawn(<5.5,0.5,echiquier_height>,1,white_color)
bishop_drawn(<2.5,7.5,echiquier_height>,1,black_color)
bishop_drawn(<5.5,7.5,echiquier_height>,1,black_color)

// on dessine les cavaliers
knight_draw(<1.5,0.5,echiquier_height>,1,<0,0,-90>,white_color)
knight_draw(<6.5,0.5,echiquier_height>,1,<0,0,-90>,white_color)
knight_draw(<1.5,7.5,echiquier_height>,1,<0,0,90>,black_color)
knight_draw(<6.5,7.5,echiquier_height>,1,<0,0,90>,black_color)

// on dessine les tours
tower_draw(<0.5,0.5,echiquier_height>,1,white_color)
tower_draw(<7.5,0.5,echiquier_height>,1,white_color)
tower_draw(<0.5,7.5,echiquier_height>,1,black_color)
tower_draw(<7.5,7.5,echiquier_height>,1,black_color)

#declare cylinder_r = 0.2;
cylinder{
  <3.5,1.5,echiquier_height+cylinder_r+1>,<3.5,3.5,echiquier_height+cylinder_r+1>,
  cylinder_r
  pigment{
    color rgb<0,0,1>
  }
}

cylinder{
  <3.5,1.5,echiquier_height+cylinder_r>,<3.5,1.5,echiquier_height+cylinder_r+1>,
  cylinder_r
  pigment{
    color rgb<0,0,1>
  }
}

cylinder{
  <3.5,3.5,echiquier_height+cylinder_r>,<3.5,3.5,echiquier_height+cylinder_r+1>,
  cylinder_r
  pigment{
    color rgb<0,0,1>
  }
}