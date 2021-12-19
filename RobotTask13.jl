function move_by_cortage!(r, cort)
    for i=1:2
        move!(r, cort[i])
    end
end

function put_markers_to_wall(r, side)
    alternativeSides = [(Nord, Ost), (Ost, Sud), (Sud, West), (West, Nord)]

    while (!isborder(r, alternativeSides[side][1]) && !isborder(r, alternativeSides[side][2]))
        move_by_cortage!(r, alternativeSides[side])
        putmarker!(r)
    end
end

function back_by_markers(r, side)
    alternativeSides = [(West, Sud), (Nord, West), (Ost, Nord), (Sud, Ost)]
    while ismarker(r)
        move_by_cortage!(r, alternativeSides[side])
    end    
end

function make_cross(r)
    for i=1:4
        put_markers_to_wall(r, i)
        back_by_markers(r, i)
    end 

    putmarker!(r)
end