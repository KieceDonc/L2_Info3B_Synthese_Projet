#declare pawn_color = color rgb<1,1,1>;

#macro pawn_draw()
    pawn_draw_head()
    pawn_draw_base()
    pawn_draw_body()
#end

#macro pawn_draw_head()
  sphere{
      <0,6,0>, 1
      pigment{
        pawn_color
      }
      rotate x*90
  }
  cylinder{
    <0,5,0>, <0,5.2,>, 1
    pigment{
        pawn_color
    }
    rotate x*90
  }
#end

#macro pawn_draw_body()
  #declare scale_factor = 0.25;
  #declare P0=<0,0>;
  #declare P1=<0.8,0.1>;
  #declare P2=<2,0>;
  #declare P3=<1,2.3>;
  #declare M0=P3;
  #declare M1=<0.8,2.8>;
  #declare M2=<0.5,3.5>;
  #declare M3=<0.3,5>;
  create_bezier(P0,P1,P2,P3)
  object{
    lathe{  
      // nombre de points dans 
      bezier_spline
      4,
      P0
      P1
      P2
      P3
      pigment{
          pawn_color
      }
      rotate x*90
      translate <0,0,0> // <x, y, z>
    }
  }
  lathe{
  // nombre de points dans
      bezier_spline 
      4,
      M3
      M2
      M1
      M0
      pigment{
          pawn_color
      }
      rotate x*90
  }
#end

/**
 */
#macro pawn_draw_base()
    cylinder
    {
        <0,0,0>, <0,0,0.5>, 2
        pigment{
            pawn_color
        }
    }
#end

#macro create_bezier(_P0,_P1,_P2,_P3)
  
  #declare cylinder_radius = 0.1;
  #macro create_cylinder(_P0,_P1,_color)

      cylinder{
          _P0,
          _P1,
          cylinder_radius
          open
          pigment{ _color }
      }

  #end
  
  #declare precision_n=20;
  #for (_t, 0, 1,1/precision_n)
      #declare _x0 = pow((1-_t),3)*_P0.x + 3*_t*pow((1-_t),2)*_P1.x+3*pow(_t,2)*(1-_t)*_P2.x+pow(_t,3)*_P3.x;
      #declare _y0 = pow((1-_t),3)*_P0.y + 3*_t*pow((1-_t),2)*_P1.y+3*pow(_t,2)*(1-_t)*_P2.y+pow(_t,3)*_P3.y;
      //#declare _x1 = pow((1-_t+1/precision_n),3)*_P0.x + 3*_t*pow((1-_t+1/precision_n),2)*_P1.x+3*pow(_t+1/precision_n,2)*(1-_t)*_P2.x+pow(_t+1/precision_n,3)*_P3.x;
      //#declare _y1 = pow((1-_t+1/precision_n),3)*_P0.y + 3*_t*pow((1-_t+1/precision_n),2)*_P1.y+3*pow(_t+1/precision_n,2)*(1-_t)*_P2.y+pow(_t+1/precision_n,3)*_P3.y;
      #declare temp_t = _t+1/precision_n;
      #declare _x1 = pow((1-temp_t),3)*_P0.x + 3*temp_t*pow((1-temp_t),2)*_P1.x+3*pow(temp_t,2)*(1-temp_t)*_P2.x+pow(temp_t,3)*_P3.x;
      #declare _y1 = pow((1-temp_t),3)*_P0.y + 3*temp_t*pow((1-temp_t),2)*_P1.y+3*pow(temp_t,2)*(1-temp_t)*_P2.y+pow(temp_t,3)*_P3.y;
      create_cylinder(<_x0,_y0,0>,<_x1,_y1,0>,color rgb<0,0,1>)
  #end
#end