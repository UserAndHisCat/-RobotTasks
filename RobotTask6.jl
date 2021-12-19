#include("roblib.jl")

function move_to_angle!(r)
    steps_to_sud = 0
    steps_to_West = 0
    while !(isborder(r, West) & isborder(r, Sud))
        if !isborder(r, West)
            move!(r, West)
            steps_to_West += 1
        end
        if !isborder(r, Sud)
            move!(r, Sud)
            steps_to_sud += 1
        end
    end
    return steps_to_sud, steps_to_West
end

function find_internal_border(r)
    side = 3
    while !isborder(r, Nord)
        if isborder(r, Ost)
            side = 1
            move!(r, Nord)
        end
        if isborder(r, West)
            side = 3
            move!(r, Nord)
        end
        move!(r, HorizonSide(side))
    end
end

function put_markers_to_void(r, s)
    while isborder(r, HorizonSide((s+1)%4))
        putmarker!(r)
        move!(r, HorizonSide(s%4))
    end
    putmarker!(r)
    move!(r, HorizonSide((s+1)%4))

    
end

function make_perimetr(r)
    steps_to_sud, steps_to_West = move_to_angle!(r)
    find_internal_border(r)
    for i=3:6
        put_markers_to_void(r, i)
    end
    move_to_wall!(r, Ost)
    move_to_wall!(r, Nord)

    for i = 1:11-steps_to_West
        move!(r, West)
    end

    for i = 1:10-steps_to_sud
        move!(r, Sud)
    end
end