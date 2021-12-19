#using HorizonSideRobots
#include("mark_kross.jl")

#r = Robot(animate=true)

function put_markers_to_wall!(rR, s)
    while !isborder(rR, s)
        move!(rR, s)
        putmarker!(rR)
    end
end

function back_by_markers!(rR, s)
    while ismarker(rR)
        move!(rR, s)
    end
end

function make_kross!(r)
    for i = 0:3
        put_markers_to_wall!(r, HorizonSide(i))
        back_by_markers!(r, HorizonSide((i+2)%4))
    end
end