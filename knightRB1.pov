#include "socleRB.pov"

#macro Knight2Exemple()
    Socle(Black)
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

    // Face +Y
    polygon {
        nb, // Number of points
        #for (i,0,nb-1)
            polyedre[i] // point1, point2, point3, point4
        #end
        pigment{color Blue}
        
    }

    // Face -Y
    polygon {
        nb, // Number of points
        #for (i,0,nb-1)
            polyedre[i]-<0,2*gapY,0> // point1, point2, point3, point4
        #end
        pigment{color Magenta}
        
    }

    #for(i,0,nb)
        polygon{
            4,
            polyedre[mod(i,nb)],
            polyedre[mod(i,nb)]-<0,2*gapY,0>,
            polyedre[mod(i+1,nb)]-<0,2*gapY,0>,
            polyedre[mod(i+1,nb)]
            pigment{color Pink}
        }
    #end    


    #declare O1 = <-4.56,gapY,4.16>  ;
    #declare O2 = <-0.22,gapY/2,3.36>  ;


    intersection{
        cylinder{ O2 O2-<0,2*gapY/2,0> 2.13 pigment{color White}}
        plane{<-1.9,0,-0.9>,0 pigment{rgbt<1,0,1,0.5>} translate<3.42,0,0>}
    } 
#end

