#macro socle_draw(start_coord,scale_factor,wanted_color)
  #local F4 = <1.2, 0.8> ;
  #local G2 = <1.58, 0.8> ;
  #local G3 = <1.58, 0.45> ;
  #local G4 = <1.3, 0.45> ;
                          
  #local H2 = <1.3, 0.38> ;
  #local H3 = <1.4, 0.35> ;
  #local H4 = <1.5, 0.35> ;                           
                          
  #local rota = <90,0,0> ;

  union{
    lathe{
      bezier_spline
      4
      F4,G2,G3,G4
      rotate rota
    }
    lathe{
      bezier_spline
      4
      G4,H2,H3,H4
      rotate rota
    }

    cylinder{
      <0,0,0> <0,0,0.35> 1.5
    }
    pigment{
      color wanted_color
    }
    translate<start_coord.x*(1/scale_factor),start_coord.y*(1/scale_factor),start_coord.z*(1/scale_factor)>
    scale scale_factor
  }
#end

#macro getSocleHeight(var)
  #declare var = 2;
#end