#include "socle.pov"

#macro knight_draw(start_coord,scale_factor,wanted_rotation,wanted_color)

  #local scale_factor = scale_factor*(1/5.1)*1.15; // (1/5.1) ramène la hauteur de la en h = 1, * 1.15 permet de faire le cavalier plus grande que les points
  union{
    #local A = <0,0,0.8>;
    #local B = <0,-0.5,5>;
    
    intersection{
      sphere {
        <0,0,0>, 1.2 // <x, y, z>, radius
        scale<1,1,3.8>
        rotate<-10,0,0>
        translate A
      }
      plane{
        -z 0.0
        }
    }

    sphere {
      <0,0,0>, 0.8 // <x, y, z>, radius
      scale<1,2,1>
      rotate<20,0,0>
      translate B
    }

    cone {
      <0.3,0,5.6>, 0.2 ,<0.6,-0.2,6.2>,0.0
    }
    
    cone {
      <-0.3,0,5.6>, 0.2 ,<-0.6,-0.2,6.2>,0.0
    }

    rotate wanted_rotation
    translate<start_coord.x*(1/scale_factor),start_coord.y*(1/scale_factor),start_coord.z*(1/scale_factor)>
    scale scale_factor
    pigment{
      wanted_color
    }
  }

  socle_draw(start_coord,scale_factor,wanted_color)
#end