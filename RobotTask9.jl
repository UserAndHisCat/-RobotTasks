function find_marker(r)
    t = 0
    steps = 1
    while true
        side = HorizonSide(t%4)
        if t % 2 == 1
            steps += 1
        end

        for i = 1:steps
            if ismarker(r)
                break
            end
            move!(r, side)
        end 

        if ismarker(r)
            break
        end
        
        t += 1
    end
    
end