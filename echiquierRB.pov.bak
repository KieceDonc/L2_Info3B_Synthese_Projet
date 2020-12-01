//Construction d'une case de l'echiquier. A et B coordonnees des deux sommets extremes, col la couleur de la case.
#macro Cube(A,B,col)
    box {
        A,B
        pigment{color col}
    }        
#end

/*Construction de l'echiquier. On indique sa taille, la couleur des cases, comment le redimmensionner (chaque case vaut 1*1*1)
  et comment le déplacer depuis sa création sur l'origine.
  -- n la longueur = largeur | col1 la couleur des cases paires | col2 la couleur des cases impaires.
  -- c * 1 = longueur des cotes | h * 1 = hauteur | dx dy et dz = deplacement par rapport a l'origine (coordonnee du sommet bas gauche)*/
#macro Echiquier(n,col1,col2,c,h,dx,dy,dz)
    union{
        #for(i,0,n)
            #for(j,0,n)
                #local A = <i,j,0>;
                #local B = <i+1,j+1,1>;
                #if(mod(i*7+j,2)=0)
                    #local col = col1;
                #else
                    #local col = col2;
                #end
                Cube(A,B,col)
            #end
        #end
        
        //on redimensionne et deplace
        scale<c,c,h>
        translate<dx,dy,dz>   
    }
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
            texture{c3}
        }
    }
#end