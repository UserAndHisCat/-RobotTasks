function move_by_side(r, s, last_step)
    step = 0
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
                step += 1

                if step == last_step || ismarker(r)
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
            
            if isborder(r, HorizonSide(s)) && isborder(r, HorizonSide((s+1)%4))
                for i=1:devetation
                    move!(r, HorizonSide((s+3)%4))
                    devetation -= 1
                end
                break
            end
            
            move!(r, HorizonSide(s))
            step += 1
            
            if step == last_step || ismarker(r)
                break
            end

            while isborder(r, HorizonSide((s+3)%4))
                move!(r, HorizonSide(s))
                step += 1
                if step == last_step || ismarker(r)
                    break
                end
            end

            if step == last_step || ismarker(r)
                break
            end

        end
    end
end


function circl_move(r)
    side = 0
    steps = 1
    tic = 0


    move_by_side(r, 3, steps)

    while !ismarker(r)
        move_by_side(r, side, steps)
        side = (side + 1)%4
        if tic%2==1
            steps += 1
        end
        tic += 1
    end

end