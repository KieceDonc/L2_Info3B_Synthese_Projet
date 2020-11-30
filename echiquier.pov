/*Construction de l'echiquier. On indique sa taille, la couleur des cases, comment le redimmensionner (chaque case vaut 1*1*1)
  et comment le déplacer depuis sa création sur l'origine.
  -- n la longueur = largeur | col1 la couleur des cases paires | col2 la couleur des cases impaires.
  -- c * 1 = longueur des cotes | h * 1 = hauteur | start_coord = deplacement par rapport a l'origine (coordonnee du sommet bas gauche)*/
#macro echiquier_draw(n,col1,col2,col3,c,h,start_coord)
  union{
    #for(i,0,n-1)
      #for(j,0,n-1)
        #local A = <i,j,0>;
        #local B = <i+1,j+1,1>;
        #if(mod(i*7+j,2)!=0)
          #local col = col1;
        #else
          #local col = col2;
        #end
        box {
          A,B
          pigment{
            color col
          }
        }        
      #end
    #end
    
    //on redimensionne et deplace
    translate start_coord
    scale<c,c,h>
  }
  EchiquierChecker(n,col1,col2,col3)
#end

// n la taille de l'échiquier (nombre de cases), c1 et c2 les deux couleurs utilisées, c3 la texture du bord
#macro EchiquierChecker(n, c1, c2, c3)
  union{
    box{
      <0,0,0>,<n,n,0.5>
      pigment{checker pigment{c1}, pigment{c2}}
      finish {
        phong 0.25
        reflection { 
          0.0 metallic 0.5
        }
      }
    }
    box{
      <-1,-1,0>,<n+1,n+1,0.4999>
      texture{
        c3
      }
    }
  }
#end