#include "colors.inc"


  #local base_torus_minor = 0.45;
  #local body_start_z = 1-base_torus_minor/2;
  #local body_rayon = 0.45;
  #local head_start_z = body_start_z+3;
  #local head_first_circle_rayon=sqrt(pow(0.8,2)+pow(body_rayon,2)); // pythagore
#declare axe=1;
#declare sca=6;
camera {
location <1.2*sca,1*sca,sca>
look_at <0,0,0>
sky   <0,0,1>
translate<0,0,0>
right <-image_width/image_height,0,0>
}


#declare light_color = color rgb<0.5,0.5,0.5>;
light_source { <4 , 4 , 10 > light_color}
light_source { <4 , -1 , 10 > light_color}
light_source { <-1 , 4 , 10 > light_color}
light_source { <4 , 8 , 10 > light_color}
light_source { <8 , 4 , 10 > light_color}
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



    sphere{ // head hat
      <0,0,head_start_z-0.8+head_first_circle_rayon+0.15>, 0.25
      pigment{
        color rgb<0.7,0.2,0.4>
      }
    }
    difference{ // head  
      sphere{
        <0,0,head_start_z-0.8>, head_first_circle_rayon
        pigment{
          color rgb<0.5,0.5,0.5>
        }
      }
      box{
          <-2,-2,0>, <2,2,head_start_z>
          pigment{
            color rgb<1,1,0.5>
          }
      } 
    }
    torus { // anneau troisième du bas
      0.15,0.2       
      rotate x*90
      translate<0,0,+body_start_z+2.25>
      pigment{
            color rgb<1,0,0.5>
      }
    }
    torus { // anneau deuxième du bas
      0.25,0.2       
      rotate x*90
      translate<0,0,+body_start_z+2>
      pigment{
            color rgb<0,1,0.5>
      }
    }
    torus { // anneau premier du bas
      0.35,0.2       
      rotate x*90
      translate<0,0,+body_start_z+1.85>
      pigment{
            color rgb<0.5,1,0>
      }
    }


    difference{ // base
      difference { 
        sphere{
          <0,0,0>, 1 
          pigment{
            color rgb<0,1,0>
          }
        }

        box{
            <-1,-1,0>, <1,1,-1>
          pigment{
            color rgb<0,1,1>
          }
        } 
      }
      torus {
        1, 0.45          
        rotate x*90
        translate<0,0,body_start_z>
        pigment{
            color rgb<0,0,1>
        }
      }
    }

    difference{ // body 
      cylinder{ // color rgb<1,0,0>
        <0,0,body_start_z>, <0,0,3+body_start_z>, body_rayon
        pigment{
          color rgb<1,0,0>
        }
      }
      torus {
        4.825,4.625        
        rotate x*90
        translate<0,0,1.5+body_start_z>
        pigment{
          color rgb<1,1,0>
        }
      }
    }
    



/*




          box{
          <-2,-2,0>, <2,2,head_start_z>
          pigment{
            color rgbt<1,1,0.5,0.9>
          }
      } 



        box{
            <-1,-1,0>, <1,1,-1>
          pigment{
            color rgbt<0,1,1,0.9>
          }
        } 
      
      torus {
        1, 0.45          
        rotate x*90
        translate<0,0,body_start_z>
        pigment{
            color rgbt<0,0,1,0.9>
        }
      }

    torus {
        4.825,4.625        
        rotate x*90
        translate<0,0,1.5+body_start_z>
        pigment{
          color rgbt<1,1,0,0.5,0.9>
        }
      }*/