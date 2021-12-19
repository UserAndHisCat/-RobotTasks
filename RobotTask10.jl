include("biblioteka.jl")

function mid_temperature(r)
    side = 3
    temp = []
    while !isborder(r, Nord)
        if isborder(r, Ost)
            side = 1
            if ismarker(r)
                push!(temp, temperature(r))
            end
            move!(r, Nord)
        end
        if isborder(r, West) && side != 3
            side = 3
            if ismarker(r)
                push!(temp, temperature(r))
            end
            move!(r, Nord)
        end
        if ismarker(r)
            push!(temp, temperature(r))
        end
        move!(r, HorizonSide(side))
    end


    while !isborder(r, Ost)
        if ismarker(r)
            push!(tepm, temperature(r))
        end
        move!(r, Ost)
    end

    t = 0

    for i=1:length(temp)
        t += temp[i]
    end

    println(t / length(temp))
end