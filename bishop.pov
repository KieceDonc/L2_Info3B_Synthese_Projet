#macro bishop_drawn(start_coord,scale_factor,wanted_color)

  #local base_torus_minor = 0.45;
  #local base_start_z = 1-base_torus_minor/2;
  #local body_start_z = 0.4;
  
  #local body = 4; 
  #local first_ring = body-0.8;
  #local second_ring = body-0.5;
  #local head_hat_r = 0.08;
  #local head_hat = body+0.6-head_hat_r/2;
  difference{
    union{
      blob{
        threshold 0.1
        sphere { // body
          #declare local_scale_z = 2;
          <0,0,0>
          1
          2
          scale <0.85,0.85,local_scale_z>
          translate <0,0,local_scale_z> 
        }
        sphere{ // first ring
          #declare local_scale_z =0.25;  
          <0,0,0>
          1.2
          1
          translate<0,0,first_ring/local_scale_z>  
          // scale modifie les valeurs du repère pour cette objet pour x,y,z = 1 pour 1u.a ( unité arbitraire )
          // par exemple si x,y,z = 1 pour 1cm si je vais un scale de 2 alors x,y,z = 2 pour 1 cm
          // pour retrouver le bon translate par rapport au reste on calcul le translate nécessaire dans ce référenciel modifier par scale
          // 1/scale*(coordonnées voulu) fonctionne
          scale <0.75,0.75,local_scale_z>
        }
        sphere{ // second_ring
          #declare local_scale_xy = 0.75*0.75;
          #declare local_scale_z = 0.25;
          <0,0,0>
          1.2
          2
          translate<0,0,second_ring/local_scale_z>
          scale <local_scale_xy,local_scale_xy,local_scale_z>
        }
        sphere{ // head
          #local local_scale_z = 0.6;
          <0,0,0>
          1
          2
          translate<0,0,body/local_scale_z>
          scale <0.6,0.6,local_scale_z>
        }
        sphere{
          #declare local_scale_z = 1.5;
          <0,0,0>
          head_hat_r
          2
          translate<0,0,head_hat/local_scale_z>
          scale<3,3,local_scale_z>
        }
        translate<0,0,body_start_z>
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
          translate<0,0,base_start_z>
        }
      }
    }
    box{ // permet de faire la fente
      <0,0,0>,<1,0.2,1>
      rotate <-45, 0, 0> // <x°, y°, z°>
      translate <-0.5,0.2,head_hat-0.3+body_start_z>
    }
    // on multiplie le donc par 0.3 pour faire le fou plus petit que le roi/reine
    #declare scale_factor = scale_factor*0.3; 
    // scale modifie les valeurs du repère pour cette objet pour x,y,z = 1 pour 1u.a ( unité arbitraire )
    // par exemple si x,y,z = 1 pour 1cm si je vais un scale de 2 alors x,y,z = 2 pour 1 cm
    // pour retrouver le bon translate par rapport au reste on calcul le translate nécessaire dans ce référenciel modifier par scale
    // 1/scale*(coordonnées voulu) fonctionne
    translate<start_coord.x*(1/scale_factor),start_coord.y*(1/scale_factor),start_coord.z*(1/scale_factor)>
    scale <scale_factor,scale_factor,scale_factor>
    pigment{
      wanted_color
    }
  }
#end