# Szymon Skoczylas, 250072

function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
    fx = Vector{Float64}(undef, Int64(length(f)))

    for i in 1:length(f)
        fx[i] = f[i]
    end

    for i = 2:length(f)
        for j = length(f):-1:i
            fx[j] = (fx[j] - fx[j - 1]) / (x[j] - x[j - i + 1])
        end
    end

    return fx
end


# Tests:

function test_ilorazyRoznicowe()
    println("Outcome: ",ilorazyRoznicowe([3.0, 1.0, 5.0, 6.0], [1.0, -3.0, 2.0, 4.0]), " Should be approx: ", [1.0, 2.0, -3.0/8.0, 7.0/40.0])
    println("Outcome: ",ilorazyRoznicowe([-4.0, 10.0, 25.0, -6.0], [-1.0, 5.0, 2.0, 4.0]), " Should be approx: ", [-1.0, 0.428, -0.0216, -0.006])
    
end

#test_ilorazyRoznicowe()