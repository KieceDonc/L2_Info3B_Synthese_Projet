#macro draw_pawn()
    draw_pawn_base()
#end

#macro draw_pawn_head()
#end

#macro draw_pawn_body()
#end

#macro draw_pawn_base()
    cylinder
    {
        <0,0,0>, <0,0,0.25>, 1
        pigment{
            color rgb<1,1,1>
        }
    }
#end