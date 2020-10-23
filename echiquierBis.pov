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
  -- c * 1 = longueur des cotes | h * 1 = hauteur | dx dy et dz = deplacement par rapport a l'origine (coordonnee du sommet bas gauche)
  commentaire ajouté*/
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