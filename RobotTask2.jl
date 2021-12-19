
function move_to_wall!(r, s)
    steps = 0
    while !isborder(r, s)
        move!(r, s)
        steps += 1
    end
    return steps
end

function put_markers_to_wall!(r, s)
    while !isborder(r, s)
        move!(r, s)
        putmarker!(r)
    end
end

function make_perimetr(r)
    steps_to_Sud = move_to_wall!(r, Sud)
    steps_to_Ost = move_to_wall!(r, Ost)

    for i = 0:3
        put_markers_to_wall!(r, HorizonSide(i))
    end

    for i = 1:steps_to_Ost
        move!(r, West)
    end

    for i = 1:steps_to_Sud
        move!(r, Nord)
    end

end
