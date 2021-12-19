function move_to_wall!(r, s)
    steps = 0
    while !isborder(r, s)
        move!(r, s)
        steps += 1
    end
    return steps
end

function put_markers_by_steps(r, s, steps)
    putmarker!(r)
    for i=1:steps
        move!(r, s)
        putmarker!(r)
    end
end

function make_mat(r)
    steps_to_West = move_to_wall!(r, West)
    steps_to_Sud = move_to_wall!(r, Sud)
    put_markers_by_steps(r, Ost, 11)
    for i =1:10
        move!(r, Nord)
        move_to_wall!(r, West)
        put_markers_by_steps(r, Ost, 11- i) 
    end 

    move_to_wall!(r, Sud)
    move_to_wall!(r, West)

    for i = 1:steps_to_West
        move!(r, Ost)
    end

    for i = 1:steps_to_Sud
        move!(r, Nord)
    end
end