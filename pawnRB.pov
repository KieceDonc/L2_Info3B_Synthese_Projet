#include "socleRB.pov"


#macro PawnExemple()

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
            pigment {
                color Navy
            }
            rotate rota
        }
        lathe{
            bezier_spline
            4
            A4,B2,B3,B4
            pigment {
                color Cyan
            }
            rotate rota
        }
        lathe{
            bezier_spline
            4
            B4,C2,C3,C4
            pigment {
                color Red
            }
            rotate rota
        }
        lathe{
            bezier_spline
            4
            C4,D2,D3,D4
            pigment {
                color Magenta
            }
            rotate rota
        }
        lathe{
            bezier_spline
            4
            D4,E2,E3,E4
            pigment {
                color Yellow
            }
            rotate rota
        }
        lathe{
            bezier_spline
            4
            pigment {
                color Gray
            }
            E4,F2,F3,F4
            rotate rota
        }
        Socle(Black)
    }

    
#end

#macro Pawn(col)
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
    Socle(Black)
    pigment{color col}
    getFinish()
#end



