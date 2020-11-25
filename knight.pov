#include "socle.pov"

#macro knight_draw(start_coord,scale_factor,wanted_rotation,wanted_color)

  #local scale_factor = scale_factor*(1/5.1)*1.15; // (1/5.1) ramène la hauteur de la en h = 1, * 1.15 permet de faire le cavalier plus grande que les points

  #declare gapY = 0.5;
  #declare nb=14;
  #declare polyedre = array[nb];

  #declare polyedre[0] = <-1.2,gapY,0.8>;
  #declare polyedre[1] = <1.2,gapY,0.8>;
  #declare polyedre[2] = <1.9,gapY,3.2>;
  #declare polyedre[3] = <1,gapY,5.1>;
  #declare polyedre[4] = <-0.36,gapY,5.1>;
  #declare polyedre[5] = <-1.95,gapY,3.87>;
  #declare polyedre[6] = <-1.95,gapY,3.57>;
  #declare polyedre[7] = <-1.62,gapY,3.14>;
  #declare polyedre[8] = <-1.22,gapY,3.14>;
  #declare polyedre[9] = <-1,gapY,3.3>;
  #declare polyedre[10] = <-0.6,gapY,3.3>;
  #declare polyedre[11] = <0.04,gapY,3.6>;
  #declare polyedre[12] = <0,gapY,3.2>;
  #declare polyedre[13] = <-0.5,gapY,2.75>;

  #declare O1 = <-4.56,gapY,4.16>  ;
  #declare O2 = <-0.22,gapY/2,3.36>  ;

  union{
    
    // Face +Y
    polygon {
      nb, // Number of points
      #for (i,0,nb-1)
          polyedre[i] // point1, point2, point3, point4
      #end
      pigment{
        wanted_color
      }
    }

    // Face -Y
    polygon {
      nb, // Number of points
      #for (i,0,nb-1)
          polyedre[i]-<0,2*gapY,0> // point1, point2, point3, point4
      #end
      pigment{
        wanted_color
      }
    }

    intersection{
      cylinder{ O2 O2-<0,2*gapY/2,0> 2.13 pigment{color White}}
      plane{<-1.9,0,-0.9>,0 pigment{rgbt<1,0,1,0.5>} translate<3.42,0,0>}
    } 

    #for(i,0,nb)
      polygon{
        4,
        polyedre[mod(i,nb)],
        polyedre[mod(i,nb)]-<0,2*gapY,0>,
        polyedre[mod(i+1,nb)]-<0,2*gapY,0>,
        polyedre[mod(i+1,nb)]
      }
    #end    

    rotate wanted_rotation
    translate<start_coord.x*(1/scale_factor),start_coord.y*(1/scale_factor),start_coord.z*(1/scale_factor)>
    scale scale_factor
    pigment{
      wanted_color
    }
  }
  socle_draw(start_coord,scale_factor,wanted_color)
#end

