ydev = 0


function back_by_coord(r)
    global ydev
    s = 2
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
                ydev -= 1
                if ydev == 0
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
            ydev -= 1

            if ydev == 0
                break
            end

            while isborder(r, HorizonSide((s+3)%4)) && ydev !=0
                move!(r, HorizonSide(s))
                ydev -= 1

                if ydev == 0
                    break
                end
            end

            if ydev == 0
                break
            end
        end
    end
end


function make_perimetr(r)
    for i=1:5
        while !isborder(r, HorizonSide(i%4)) && !ismarker(r)
            putmarker!(r)
            move!(r, HorizonSide(i%4))
        end
    end
    back_by_coord(r)
end


function move_to_wall!(r)
    global ydev
    s = 0
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
                ydev += 1
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
            ydev += 1

            while isborder(r, HorizonSide((s+3)%4))
                move!(r, HorizonSide(s))
                ydev += 1
            end
        end
    end
    make_perimetr(r)
end


