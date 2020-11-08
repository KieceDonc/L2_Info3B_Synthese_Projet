// https://fr.wikipedia.org/wiki/G%C3%A9om%C3%A9trie_de_construction_de_solides
// http://www.f-lohmueller.de/pov_tut/csg/povcsg2f.htm
// http://docs.mcneel.com/rhino/5/help/fr-fr/popup_moreinformation/continuity_descriptions.htm
/*#macro king_draw(start_coord,scale_factor,wanted_color)
  #declare scale_factor=scale_factor*0.5; // le roi fait de base 2 de largeur, 5 de hateur et 2 de profondeur. 
  #declare body_start_z = (1-0.45/2)*scale_factor;
  #declare body_rayon = 0.45*scale_factor;
  #declare head_start_z = body_start_z+3*scale_factor;
  #declare head_first_circle_rayon=sqrt(pow(0.8*scale_factor,2)+pow(body_rayon,2)); // pythagore

  union{ 

    sphere{ // head hat
      <start_coord.x,start_coord.y,head_start_z-0.8*scale_factor+head_first_circle_rayon+0.15*scale_factor+start_coord.z>, 0.25*scale_factor
    }


    difference{ // head  
      sphere{
        <start_coord.x,start_coord.y,head_start_z-0.8*scale_factor+start_coord.z>, head_first_circle_rayon
      }
      box{
          <-2*scale_factor+start_coord.x,-2*scale_factor+start_coord.y,0+start_coord.z>, <2*scale_factor+start_coord.x,2*scale_factor+start_coord.y,head_start_z+start_coord.z>
      } 
    }


    torus { // anneau troisième du bas
      0.15*scale_factor,0.2*scale_factor       
      rotate x*90
      translate<start_coord.x,start_coord.y,start_coord.z+body_start_z+2.25*scale_factor>
    }
    torus { // anneau deuxième du bas
      0.25*scale_factor,0.2*scale_factor       
      rotate x*90
      translate<start_coord.x,start_coord.y,start_coord.z+body_start_z+2*scale_factor>
    }
    torus { // anneau premier du bas
      0.35*scale_factor,0.2*scale_factor       
      rotate x*90
      translate<start_coord.x,start_coord.y,start_coord.z+body_start_z+1.85*scale_factor>
    } 

    difference{ // base
      difference { 
        sphere{
          <start_coord.x,start_coord.y,start_coord.z>, 1*scale_factor 
        }

        box{
            <-1*scale_factor+start_coord.x,-1*scale_factor+start_coord.y,start_coord.z>, <1*scale_factor+start_coord.x,1*scale_factor+start_coord.y,-1*scale_factor+start_coord.z>
        } 
      }
      torus {
        1*scale_factor, 0.45*scale_factor          
        rotate x*90
        translate<start_coord.x,start_coord.y,body_start_z+start_coord.z>
      }
    }


    difference{ // body 
      cylinder{ 
        <start_coord.x,start_coord.y,body_start_z+start_coord.z>, <start_coord.x,start_coord.y,3*scale_factor+body_start_z+start_coord.z>, body_rayon
      }
      torus {
        4.825*scale_factor,4.625*scale_factor        
        rotate x*90
        translate<start_coord.x,start_coord.y,1.5*scale_factor+body_start_z+start_coord.z>
      }
    }


    pigment{
      wanted_color
    }
  }

#end*/  

#declare base_torus_minor = 0.45;
#declare body_start_z = 1-base_torus_minor/2;
#declare body_rayon = 0.45;
#declare head_start_z = body_start_z+3;
#declare head_first_circle_rayon=sqrt(pow(0.8,2)+pow(body_rayon,2)); // pythagore
#macro king_draw(start_coord,scale_factor,wanted_color)

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
      color rgb<1,1,1>
    }
    // le roi fait de base 2 de largeur, 5 de hateur et 2 de profondeur.
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

