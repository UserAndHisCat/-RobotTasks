function put_markers_to_wall!(r, s)
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

            if devetation == 0
                putmarker!(r)
            end
            
            move!(r, HorizonSide(s))

            while isborder(r, HorizonSide((s+3)%4))
                move!(r, HorizonSide(s))
            end
        end
        if devetation == 0
            putmarker!(r)
        end
    end
    back_by_markers!(r, (s+2)%4)
end

function back_by_markers!(r, s)
    devetation = 0
    while true
        if !isborder(r, HorizonSide(s))
            if devetation != 0 && !isborder(r, HorizonSide((s+3)%4))
                for i=1:devetation
                    move!(r, HorizonSide((s+3)%4))
                    devetation -= 1
                end
            else
                move!(r, HorizonSide(s))
            end
        else
            move!(r, HorizonSide((s+1)%4))
            devetation += 1
            if !isborder(r, HorizonSide(s))
                move!(r, HorizonSide(s))
            end
            while isborder(r, HorizonSide((s+3)%4))
                move!(r, HorizonSide(s))
            end
        end

        if !ismarker(r) && devetation == 0
            for i=1:devetation
                move!(r, HorizonSide((s+3)%4))
                devetation -= 1
            end
            break
        end
    end
end

function make_kross!(r)
    for i = 0:3
        put_markers_to_wall!(r, i)
    end
end