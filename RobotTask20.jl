function number_of_partition(r)
    t = 0
    b = false
    i = 0
    while !isborder(r, Nord)
        while !isborder(r, HorizonSide((2+(-1)^i)))
            move!(r, HorizonSide(2+(-1)^i))

            while isborder(r, Nord)
                move!(r, HorizonSide(2+(-1)^i))
                b = true
            end

            if b
                t += 1
                b = false
            end
        end
        move!(r, Nord)
        i += 1
    end
    print(t)
end