function move_to_angle!(r)
    moves = []
    while !(isborder(r, West) & isborder(r, Sud))
        if !isborder(r, West)
            move!(r, West)
            push!(moves, 1)
        end
        if !isborder(r, Sud)
            move!(r, Sud)
            push!(moves, 2)
        end
    end
    return moves
end

function put_dots(r)
    moves = move_to_angle!(r)

    putmarker!(r)
    move_to_wall!(r, Nord)
    putmarker!(r)
    move_to_wall!(r, Ost)
    putmarker!(r)
    move_to_wall!(r, Sud)
    putmarker!(r)
    move_to_wall!(r, West)

    while length(moves) > 0
        side = pop!(moves)
        move!(r, HorizonSide((side + 2) % 4))
        
    end
end