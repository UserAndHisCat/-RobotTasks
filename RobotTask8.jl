function find_passage(r)
    t = 1
    while true
        if t % 2 == 0
            side = West
        else
            side = Ost
        end

        for i = 1:t
            if !isborder(r, Nord)
                break
            end
            move!(r, side)
        end

        if !isborder(r, Nord)
            break
        end

        t += 1
    end
    
end