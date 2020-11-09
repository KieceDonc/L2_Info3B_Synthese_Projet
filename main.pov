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

#declare Pi = 3.1415926535897932384626;

#declare axe=1;
#declare sca=8;
camera {
location <1.2*sca,1*sca,sca>
look_at <0,0,0>
sky   <0,0,1>
translate<0.5,0.5,0>
right <-image_width/image_height,0,0>
}


#declare light_color = color rgb<0.5,0.5,0.5>;
light_source { <4 , 4 , 10 > light_color}
light_source { <4 , -1 , 10 > light_color}
light_source { <-1 , 4 , 10 > light_color}
light_source { <4 , 8 , 10 > light_color}
light_source { <8 , 4 , 10 > light_color}

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

#macro flecheDiffuseNom(G,H,Coul,alph,rCyl,rCon,diffu,text1,sca,rot,trans)
#local H1 = G + alph* (H-G);
union{
    union{
      cylinder{
	  G, H1, rCyl
      }
      cone{
	  H1, rCon
	  H , 0
      }
    }
    text {
                ttf "timrom.ttf"  text1
	        0.1, 0  
                scale sca 
                rotate rot
                translate trans 
    } 
    pigment {color Coul} finish {diffuse diffu}
}// fin union
#end // fin macro fleche

// axes
#declare O3=<0,0,0>;
#declare I=<1,0,0>;
#declare J=<0,1,0>;
#declare K=<0,0,1>;
#declare rCyl=0.025;
#declare rCone=0.075;
#if (axe)
  flecheDiffuseNom(O3,I,Red,0.75,rCyl,rCone,1,"X",0.35,<90,0,0>,<0.5,0,0.125>)
  flecheDiffuseNom(O3,J,Green,0.75,rCyl,rCone,1,"Y",0.35,<90,0,-45>,<0.0,0.75,0.1250>)
  flecheDiffuseNom(O3,K,Blue,0.75,rCyl,rCone,1,"Z",0.35,<90,0,180>,<-0.20,0.0,0.750>)
#end

plane{
-z 150
  material {
      texture{pigment
	  { brick rgbt<1.0,1.,1.0,0.250>, rgbt<0.750,.5,0.0,0.850>  
	      mortar 5 brick_size 125   
	  }	
	  finish{phong 0.8	 
	      ambient 0.85
	      diffuse 0.2
	      reflection 0.2    
	  }
      }
      interior { ior 1.3333  fade_distance 1 fade_power 1
		  fade_color <0,0.0,0>  caustics 2.5
      }
  }
rotate <0,0,45>
}


#declare echiquier_height = 0.125;
echiquier_draw(<0,0,0>,1,echiquier_height)
#for (_t, 0, 7, 1)
  pawn_draw(<_t+0.5,1.5,echiquier_height>,1,color rgb<1,1,1>)
#end
king_draw(<4.5,0.5,echiquier_height>,1,color rgb<1,1,1>)
queen_draw(<3.5,0.5,echiquier_height>,1,color rgb<1,1,1>)