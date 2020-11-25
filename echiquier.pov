#declare square_length_echiquier = 8;
#declare points_echiquier = array[square_length_echiquier+1][square_length_echiquier+1];

/**
 * Fonction principale qui reçoit les paramètres et coordonne les différentes sous étapes
 * @param {Coordonnées} origin_coord point précisant l'origine de notre échiquier. Il s'agit du point le plus en bas à droite par rapport à l'échiquier
 * @param {Nombre} scale_factor facteur qui permet d'agrandir "scale_factor" fois notre l'échiquier 
 * @param {Nombre} hauteur de l'échiquier
 */
#macro echiquier_draw(origin_coord,scale_factor,heigh)

  create_points_echiquier(origin_coord,scale_factor)
  draw_echiquier_squares(origin_coord,scale_factor,heigh)

#end

/**
 * En fonction des points stockés dessine les cases l'échiquier on calcul l'origine + le point le plus éloigné de l'origine tel que :
 *        e-------f
 *       /|      /|
 *      / |     / |
 *     a--|----b  |
 *     |  g----|--h
 *     | /     | /
 *     c-------d
 *
 *  c étant l'origine
 *  f étant le point le plus éloigné ( point suivant dans notre tableau + il faut considéré la hauteur de la dimension z soit la hauteur )
 *
 * @param {Coordonnées} origin_coord point précisant l'origine de notre échiquier. Il s'agit du point le plus en bas à gauche par rapport à l'échiquier
 * @param {Nombre} scale_factor facteur qui permet d'agrandir "scale_factor" fois notre l'échiquier  
 * @param {Nombre} hauteur de l'échiquier
 */
#macro draw_echiquier_squares(origin_coord,scale_factor,heigh)

  #declare color_white = color rgb<1,1,1>; // couleur pour les cases blanches
  #declare color_dark = color rgb<0,0,0>; // couleur pour les cases noires
  #for (_x, 0, square_length_echiquier-1, 1) 

      #for (_y, 0, square_length_echiquier-1, 1) 

        #declare start_coord = points_echiquier[_x][_y];
        #declare origin_z = origin_coord.z;
        #declare end_coord = points_echiquier[_x+1][_y+1];
        #declare end_coord = <end_coord.x,end_coord.y,heigh+origin_z>; // on donne de la hauteur à notre échiquier
        #declare is_current_square_white = false;
        is_square_white(_x,_y,is_current_square_white) // on récupère le booléen pour savoir si notre case est blanche ou noir

        #declare square_color = color_dark;
        #if(is_current_square_white)
          #declare square_color = color_white;
        #end

        box{
          start_coord, end_coord
          pigment{
            square_color
          }
        }
          
      #end

  #end

#end

/**
 * Calcul l'origine de chaque carré ( on ne considère pas la hauteur dans la dimension z dans cette fonction )
 * l'origine est le point le plus en bas à gauche
 *
 *     a-------b  
 *     |       |
 *     |       | 
 *     c-------d
 *        
 *   c étant l'origine
 *      
 * @param {Coordonnées} origin_coord point précisant l'origine de notre échiquier. Il s'agit du point le plus en bas à gauche par rapport à l'échiquier
 * @param {Nombre} scale_factor facteur qui permet d'agrandir "scale_factor" fois notre l'échiquier  
 */
#macro create_points_echiquier(origin_coord,scale_factor) // enregistre dans 'points_echiquier' l'origine de chaque cube 

  #declare origin_x = origin_coord.x;
  #declare origin_y = origin_coord.y;
  #declare origin_z = origin_coord.z;


  #for (_x, 0, square_length_echiquier, 1) 

      #for (_y, 0, square_length_echiquier, 1) 

        #declare points_echiquier[_x][_y]=<_x*scale_factor+origin_x,_y*scale_factor+origin_y,origin_z>;
          
      #end

  #end

#end

/*
 * En fonction des coordoonées de la case déduit si elle doit être blanche ( retourne vrai ) ou noir ( retourne faux )
 * @param {int} _x On récupère la coordonnées x comme s'il s'aggissait d'un échiquier de taille de case 1x1
 * @param {int} _y On récupère la coordonnées y comme s'il s'aggissait d'un échiquier de taille de case 1x1
 * @param {Booléen} bool booléen dans lequel on 'renvoit' si la case est blanche ou noire
 */
#macro is_square_white(_x,_y,bool) 

  #declare x_mod_2 = mod(_x,2); // on récupère le reste de la division de _x par 2 
  #declare y_mod_2 = mod(_y,2); // on récupère le reste de la division de _y par 2

  #if(x_mod_2=0)

    #if(y_mod_2=0) // x && y pair, la case doit être noire
        #declare bool=false;
    #else // x pair && y impair, la case doit être blanche
        #declare bool=true; 
    #end

  #else
    
    #if(y_mod_2=0) // x impair && y pair, la case doit être blanche
      #declare bool=true;

    #else // x && y impair, la case doit être noire
      #declare bool=false;
    #end

  #end
#end