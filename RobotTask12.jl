height = 11
width = 12

xcor = 1
ycor = 1


function move_with_cords!(r, side)
    global xcor, ycor
    if side==Nord
        ycor+=1
    elseif side==Sud
        ycor-=1
    elseif side==Ost
        xcor+=1
    else
        xcor-=1
    end


    move!(r, side)
end



function move_up!(r, n)
    for i=1:n
        if ycor < height
            move_with_cords!(r, Nord)
        else
            break
        end
    end
end


function move_next_line!(r, n)
    for i=1:n
        if (xcor < width)
            move_with_cords!(r, Ost)
        else
            break
        end
    end
    for i=1:height-1
        move_with_cords!(r, Sud)
    end
end




function make_sheet(r, n)
    for i=1:n
        putmarker!(r)
        for j=1:n-1
            if (xcor < width && i % 2 == 1) || (xcor <= width && i % 2 == 0)
                move_with_cords!(r, HorizonSide(2 - ((- 1)^(i%2))))
                putmarker!(r)
            else
                break
            end
        end
        if ycor < height
            move_with_cords!(r, Nord)
        else
            break
        end
    end
    if xcor % n == 0
        for i=1:n-1
            move_with_cords!(r, West)
        end
    end

end

function make_field(r, n)
    tr = 0
    while true
        #if (xcor + 1 == width) && (ycor + 1 == height)
        #    break
        #end

        if tr % 2 == 0
            while ycor != height
                make_sheet(r, n)
                move_up!(r, n)
            end
        else
            while ycor != height
                move_up!(r, n)
                make_sheet(r, n)
            end
        end

        #if (xcor + 1 == width) && (ycor + 1 == height)
        #    break
        #end

        move_next_line!(r, n)
        print(xcor, ycor)
        if (xcor == width) && (ycor == 1)
            break
        end

        tr += 1
    end
    
end