# Szymon Skoczylas, 250072

function naturalna(x::Vector{Float64}, fx::Vector{Float64})
    a = Vector{Float64}(undef, length(x))
    a[length(x)] = fx[length(x)]

    for i = length(x) - 1:-1:1
        a[i] = fx[i] - a[i + 1] * x[i]

        for j = i + 1:length(x) - 1
            a[j] = a[j] - a[j + 1] * x[i]
        end
    end

    return a
end

#Tests

function test_naturalna()
    println("Outcome: ",naturalna([-1.0, 0.0, 1.0, 2.0, 3.0], [2.0, 1.0, 2.0, -7.0, 10.0]), " Should be: ", [3.0, 30.0, -8.0, -27.0, 10.0])
    println("Outcome: ",naturalna([-4.0, 10.0, 25.0, -6.0], [-1.0, 5.0, 2.0, 4.0]), " Should be: ", [3939.0, 433.0, -122.0, 4.0])
    
end

#test_naturalna()