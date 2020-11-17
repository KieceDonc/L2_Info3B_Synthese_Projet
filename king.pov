#include "socle.pov"

#macro king_draw(start_coord,scale_factor,wanted_color)

  #local base_torus_minor = 0.45;
  #local body_start_z = 1-base_torus_minor/2;
  #local body_rayon = 0.45;
  #local head_start_z = body_start_z+3;
  #local head_first_circle_rayon=sqrt(pow(0.8,2)+pow(body_rayon,2)); // pythagore
  union{ 

    sphere{ // head hat
      <0,0,head_start_z-0.8+head_first_circle_rayon+0.15>, 0.25
    }


    difference{ // head  
      sphere{
        <0,0,head_start_z-0.8>, head_first_circle_rayon
      }
      box{
          <-2,-2,0>, <2,2,head_start_z>
      } 
    }


    torus { // anneau troisième du bas
      0.15,0.2       
      rotate x*90
      translate<0,0,+body_start_z+2.25>
    }
    torus { // anneau deuxième du bas
      0.25,0.2       
      rotate x*90
      translate<0,0,+body_start_z+2>
    }
    torus { // anneau premier du bas
      0.35,0.2       
      rotate x*90
      translate<0,0,+body_start_z+1.85>
    } 

    difference{ // base
      difference { 
        sphere{
          <0,0,0>, 1 
        }

        box{
            <-1,-1,0>, <1,1,-1>
        } 
      }
      torus {
        1, 0.45          
        rotate x*90
        translate<0,0,body_start_z>
      }
    }


    difference{ // body 
      cylinder{ 
        <0,0,body_start_z>, <0,0,3+body_start_z>, body_rayon
      }
      torus {
        4.825,4.625        
        rotate x*90
        translate<0,0,1.5+body_start_z>
      }
    }


    pigment{
      wanted_color
    }
    // le roi fait de base 2 de largeur, 3 de hateur et 2 de profondeur.
    // on veut le roi pour 1 de largeur / profondeur 
    // on multiplie le donc par 0.5
    #declare scale_factor = scale_factor*0.5*0.8; 
    // scale modifie les valeurs du repère pour cette objet pour x,y,z = 1 pour 1u.a ( unité arbitraire )
    // par exemple si x,y,z = 1 pour 1cm si je vais un scale de 2 alors x,y,z = 2 pour 1 cm
    // pour retrouver le bon translate par rapport au reste on calcul le translate nécessaire dans ce référenciel modifier par scale
    // 1/scale*(coordonnées voulu) fonctionne
    translate<start_coord.x*(1/scale_factor),start_coord.y*(1/scale_factor),start_coord.z*(1/scale_factor)>
    scale scale_factor
  }
#end

