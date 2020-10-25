#macro Socle()

#local F4 = <1.2, 0.8> ;
#local G2 = <1.58, 0.8> ;
#local G3 = <1.58, 0.45> ;
#local G4 = <1.3, 0.45> ;
                           
#local H2 = <1.3, 0.38> ;
#local H3 = <1.4, 0.35> ;
#local H4 = <1.5, 0.35> ;                           
                           
#local rota = <90,0,0> ;

lathe{
    bezier_spline
    4
    F4,G2,G3,G4
    pigment {
        color Pink
    }
  
    rotate rota
}
lathe{
    bezier_spline
    4
    G4,H2,H3,H4
    pigment {
        color Green
    }
    rotate rota
}

cylinder{
    <0,0,0> <0,0,0.35> 1.5 pigment{color Violet}
    }
#end






