#include "socleRB.pov"

#macro KnightExemple()
    Socle(Magenta)
    
    #local A = <0,0,0.8>;
    #local B = <0,-0.5,5>;
    
    intersection{
           sphere {
            <0,0,0>, 1.2 // <x, y, z>, radius
            scale<1,1,3.8>
            rotate<-10,0,0>
            translate A
            pigment{color Red}
            }
            plane{-z 0.0}
    }
 
    sphere {
    <0,0,0>, 0.8 // <x, y, z>, radius
    scale<1,2,1>
    rotate<20,0,0>
    translate B
    pigment{color Cyan}
    }

    cone {
        <0.3,0,5.6>, 0.2 ,<0.6,-0.2,6.2>,0.0
        pigment{color Yellow}
    }
    
    cone {
        <-0.3,0,5.6>, 0.2 ,<-0.6,-0.2,6.2>,0.0
        pigment{color Yellow}
    }
#end

#macro Knight(col)
    union{
        Socle(col)
        #local A = <0,0,0.8>;
        #local B = <0,-0.5,5>;
        
        intersection{
            sphere {
                <0,0,0>, 1.2 // <x, y, z>, radius
                scale<1,1,3.8>
                rotate<-10,0,0>
                translate A
                pigment{color col}
                }
                plane{-z 0.0}
        }
    
        sphere {
        <0,0,0>, 0.8 // <x, y, z>, radius
        scale<1,2,1>
        rotate<20,0,0>
        translate B
        pigment{color col}
        }

        cone {
            <0.3,0,5.6>, 0.2 ,<0.6,-0.2,6.2>,0.0
            pigment{color col}
        }
        
        cone {
            <-0.3,0,5.6>, 0.2 ,<-0.6,-0.2,6.2>,0.0
            pigment{color col}
        }
        getFinish()
    }
#end

