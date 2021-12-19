#include("roblib.jl")

function move_to_wall!(r, s)
    steps = 0
    while !isborder(r, s)
        move!(r, s)
        steps += 1
    end
    return steps
end

function make_chess(r)
    putmarker!(r)
    steps_to_West = move_to_wall!(r, West)
    steps_to_Sud = move_to_wall!(r, Sud)
    
    sheet_num = 1
    side = 3
    while !isborder(r, Nord)
        if isborder(r, Ost)
            side = 1
            if sheet_num % 2 == 1
                putmarker!(r)
            end
            move!(r, Nord)
            sheet_num += 1
        end
        if isborder(r, West) && side != 3
            side = 3
            if sheet_num % 2 == 1
                putmarker!(r)
            end
            move!(r, Nord)
            sheet_num += 1
        end
        if sheet_num % 2 == 1
            putmarker!(r)
        end
        move!(r, HorizonSide(side))
        sheet_num += 1
    end


    while !isborder(r, Ost)
        if sheet_num % 2 == 1
            putmarker!(r)
        end
        move!(r, Ost)
        sheet_num += 1
    end

    for i = 1:11-steps_to_West
        move!(r, West)
    end

    for i = 1:10-steps_to_Sud
        move!(r, Sud)
    end
end