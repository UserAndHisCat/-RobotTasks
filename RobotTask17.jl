xdev = 0
ydev = 0


function back_by_devetation(r)
    global xdev
    global ydev
    s = 3
    devetation = 0

    for i=1:ydev
        move!(r, HorizonSide(0))
    end

    while true
        if xdev != 0
            if !isborder(r, HorizonSide(s))
                if devetation > 0
                    for i=1:devetation
                        move!(r, HorizonSide((s+3)%4))
                        devetation -= 1
                    end
                elseif devetation < 0
                    for i=1:(-1) * devetation
                        move!(r, HorizonSide((s+1)%4))
                        devetation += 1
                    end
                else
                    move!(r, HorizonSide(s))
                    xdev -= 1
                    if xdev == 0
                        break
                    end
                end
            else
                if devetation <= 0
                    while isborder(r, HorizonSide(s))
                        if isborder(r, HorizonSide((s+1)%4))
                            break
                        end
                        move!(r, HorizonSide((s+1)%4))
                        devetation += 1
                    end
                else
                    for i=1:devetation
                        move!(r, HorizonSide((s+3)%4))
                        devetation -= 1
                    end
                end

                move!(r, HorizonSide(s))
                xdev -= 1

                if xdev == 0
                    break
                end

                while isborder(r, HorizonSide((s+3)%4)) && xdev !=0
                    move!(r, HorizonSide(s))
                    xdev -= 1

                    if xdev == 0
                        break
                    end
                end

                if xdev == 0
                    break
                end
            end
        else
            break
        end
    end
end


function move_to_angle!(r)
    global xdev
    global ydev
    s = 1
    devetation = 0

    while true
        if !isborder(r, HorizonSide(s))
            if devetation > 0
                for i=1:devetation
                    move!(r, HorizonSide((s+3)%4))
                    devetation -= 1
                end
            elseif devetation < 0
                for i=1:(-1) * devetation
                    move!(r, HorizonSide((s+1)%4))
                    devetation += 1
                end
            else
                move!(r, HorizonSide(s))
                xdev += 1
            end
        else
            if devetation <= 0
                while isborder(r, HorizonSide(s))
                    if isborder(r, HorizonSide((s+1)%4))
                        break
                    end
                    move!(r, HorizonSide((s+1)%4))
                    devetation += 1
                end
            else
                for i=1:devetation
                    move!(r, HorizonSide((s+3)%4))
                    devetation -= 1
                end
            end
            
            if isborder(r, HorizonSide(s)) && isborder(r, HorizonSide((s+1)%4))
                for i=1:devetation
                    move!(r, HorizonSide((s+3)%4))
                    devetation -= 1
                end
                break
            end

            move!(r, HorizonSide(s))
            xdev += 1

            while isborder(r, HorizonSide((s+3)%4))
                move!(r, HorizonSide(s))
                xdev += 1
            end
        end
    end
    while !isborder(r, HorizonSide(2))
        move!(r, HorizonSide(2))
        ydev += 1
    end
end


function put_markers_to_wall!(r, s, last_step)
    devetation = 0
    step = 1
    putmarker!(r)
    while true
        if !isborder(r, HorizonSide(s))
            if devetation > 0
                for i=1:devetation
                    move!(r, HorizonSide((s+3)%4))
                    devetation -= 1
                end
            elseif devetation < 0
                for i=1:(-1) * devetation
                    move!(r, HorizonSide((s+1)%4))
                    devetation += 1
                end
            else
                move!(r, HorizonSide(s))
                step += 1
            end
        else
            if devetation <= 0
                while isborder(r, HorizonSide(s))
                    if isborder(r, HorizonSide((s+1)%4))
                        break
                    end
                    move!(r, HorizonSide((s+1)%4))
                    devetation += 1
                end
            else
                for i=1:devetation
                    move!(r, HorizonSide((s+3)%4))
                    devetation -= 1
                end
            end
        
            if isborder(r, HorizonSide(s)) && isborder(r, HorizonSide((s+1)%4))
                for i=1:devetation
                    move!(r, HorizonSide((s+3)%4))
                    devetation -= 1
                end
                break
            end
            
            move!(r, HorizonSide(s))
            step += 1

            while isborder(r, HorizonSide((s+3)%4))
                move!(r, HorizonSide(s))
                step += 1
            end
        end
        if devetation == 0 && step <= last_step
            putmarker!(r)
        end
    end
end


function move_to_wall!(r)
    s = 1
    devetation = 0
    while true
        if !isborder(r, HorizonSide(s))
            if devetation > 0
                for i=1:devetation
                    move!(r, HorizonSide((s+3)%4))
                    devetation -= 1
                end
            elseif devetation < 0
                for i=1:(-1) * devetation
                    move!(r, HorizonSide((s+1)%4))
                    devetation += 1
                end
            else
                move!(r, HorizonSide(s))
            end
        else
            if devetation <= 0
                while isborder(r, HorizonSide(s))
                    if isborder(r, HorizonSide((s+1)%4))
                        break
                    end
                    move!(r, HorizonSide((s+1)%4))
                    devetation += 1
                end
            else
                for i=1:devetation
                    move!(r, HorizonSide((s+3)%4))
                    devetation -= 1
                end
            end
            
            if isborder(r, HorizonSide(s)) && isborder(r, HorizonSide((s+1)%4))
                for i=1:devetation
                    move!(r, HorizonSide((s+3)%4))
                    devetation -= 1
                end
                break
            end

            move!(r, HorizonSide(s))

            while isborder(r, HorizonSide((s+3)%4))
                move!(r, HorizonSide(s))
            end
        end
    end
end


function pool_stairs(r)
    global ydev
    move_to_angle!(r)
    t = 0
    steps = 12
    put_markers_to_wall!(r, 3, steps)
    steps -= 1
    while !isborder(r, HorizonSide(0))
        move!(r, Nord)

        move_to_wall!(r)

        put_markers_to_wall!(r, 3, steps)

        t += 1
        steps -= 1
    end

    while !isborder(r, West)
        move!(r, West)
    end

    while !isborder(r, Sud)
        move!(r, Sud)
    end
    back_by_devetation(r)
    
end