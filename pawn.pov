#include "socle.pov"

#macro pawn_draw(start_coord,scale_factor,wanted_color)

    #declare scale_factor = scale_factor*(1/4.73);
    #local A1 = <0, 4.73> ;
    #local A2 = <0.67, 4.73> ;
    #local A3 = <1.05, 3.94> ;
    #local A4 = <0.6, 3.42> ;

    #local B2 = <0.48, 3.28> ;
    #local B3 = <0.59, 3.35> ;
    #local B4 = <0.69, 3.28> ;

    #local C2 = <0.79, 3.22> ;
    #local C3 = <0.79, 3.08> ;
    #local C4 = <0.69, 3.02> ;

    #local D2 = <0.59, 2.95> ;
    #local D3 = <0.45, 3.03> ;
    #local D4 = <0.45, 2.9> ;

    #local E2 = <0.45, 2.6> ;
    #local E3 = <0.6, 1.9> ;
    #local E4 = <0.8, 1.6> ;

    #local F2 = <1.15, 1.5> ;
    #local F3 = <1.2, 1> ;
    #local F4 = <1.2, 0.8> ;                           
                            
    #local rota = <90,0,0> ;

    union{
      lathe{
          bezier_spline
          4
          A1,A2,A3,A4
          rotate rota
      }
      lathe{
          bezier_spline
          4
          A4,B2,B3,B4
          rotate rota
      }
      lathe{
          bezier_spline
          4
          B4,C2,C3,C4
          rotate rota
      }
      lathe{
          bezier_spline
          4
          C4,D2,D3,D4
          rotate rota
      }
      lathe{
          bezier_spline
          4
          D4,E2,E3,E4
          rotate rota
      }
      lathe{
          bezier_spline
          4
          E4,F2,F3,F4
          rotate rota
      }
      // scale modifie les valeurs du repère pour cette objet pour x,y,z = 1 pour 1u.a ( unité arbitraire )
      // par exemple si x,y,z = 1 pour 1cm si je vais un scale de 2 alors x,y,z = 2 pour 1 cm
      // pour retrouver le bon translate par rapport au reste on calcul le translate nécessaire dans ce référenciel modifier par scale
      // 1/scale*(coordonnées voulu) fonctionne
      translate<start_coord.x*(1/scale_factor),start_coord.y*(1/scale_factor),start_coord.z*(1/scale_factor)>
      scale scale_factor
      pigment{
        color wanted_color
      }
    }
    socle_draw(start_coord,scale_factor,wanted_color)
#end