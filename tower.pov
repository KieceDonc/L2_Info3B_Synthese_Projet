#include "socle.pov"

#macro tower_draw(start_coord,scale_factor,wanted_color)

  #local scale_factor = scale_factor*(1/6.6)*1.15; // (1/6.6) ramène la hauteur de la en h = 1, * 1.15 permet de faire la tour plus grande que les points

  #local A1 = <0, 0, 0.8> ;
  #local A2 = <0, 0, 4> ;
  #local radCylA = 1.2;

  #local B1 = <0, 0, 4.6> ;
  #local radMajTorB = 0.6 ;
  #local radMinTorB = 0.85 ;

  #local C1 = <0, 0, 5> ;
  #local radMajTorC = 1.45 ;
  #local radMinTorC = 0.4 ;

  #local D1 = C1 ;
  #local D2 = <0, 0,6.6> ;
  #local radCylD = 1.85 ;

  #local E1 = <0, 0, 5.6> ;
  #local E2 = <0,0,7> ;
  #local radCylE = 1.35 ;

  #local F1 = <0, 0, 4> ;
  #local radMajTorF = 22 ;
  #local radMinTorF = 21.04 ;                         
                          
  #local rota = <90,0,0> ;
  union{

      // Différence entre un Cylindre et un Tore pour que la base de la Tour soit légèrement incurvée
      difference{
          cylinder {
              A1, A2, radCylA    
          }
          torus {
              radMajTorF, radMinTorF 
              rotate<90,0,0>
              translate F1
          }
      }

      torus {
          radMajTorB, radMinTorB
          rotate<90,0,0>
          translate B1 
      }
      torus {
          radMajTorC, radMinTorC
          rotate<90,0,0>
          translate C1 
      }
      difference{
          cylinder {
              D1, D2, radCylD
          }

          // Différence entre un Cylindre et un Cylindre et 3 Parallépipèdes rectancles (d'angles 0, pi/3 et 2pi/3) pour former le haut de la tour. 
          cylinder {
              E1, E2, radCylE
          }
          #local b = box {
              <-2.5, -0.4, 5.6>, <2.5, 0.4, 7> 
          }
          object{b}
          object{b rotate<0,0,60>}
          object{b rotate<0,0,120>}
      }
      translate<start_coord.x*(1/scale_factor),start_coord.y*(1/scale_factor),start_coord.z*(1/scale_factor)>
      scale scale_factor
      pigment{
        wanted_color
      }
  }
  socle_draw(start_coord,scale_factor*1.15,wanted_color)
#end

