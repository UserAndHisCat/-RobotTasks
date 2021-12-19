function try_move(r, side)
    if isborder(r, side)
        return false
    else
        return true
    end
    
end


function make_scross(r)
    if try_move(r, Nord)
        move!(r, Nord)
        putmarker!(r)
        move!(r, Sud)
    end

    if try_move(r, Sud)
        move!(r, Sud)
        putmarker!(r)
        move!(r, Nord)
    end

    if try_move(r, West)
        move!(r, West)
        putmarker!(r)
        move!(r, Ost)
    end

    if try_move(r, Ost)
        move!(r, Ost)
        putmarker!(r)
        move!(r, West)
    end
end

