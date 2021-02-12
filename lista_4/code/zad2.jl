# Szymon Skoczylas, 250072

function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
    nt = fx[length(x)]

    for i = length(x) - 1:-1:1
        nt = fx[i] + (t-x[i]) * nt
    end

    return nt
end


# Tests:

function test_warNewton()
    println("Outcome: ",warNewton([3.0, 1.0, 5.0, 6.0], [1.0, -3.0, 2.0, 4.0], 2.0), " Should be: 14.0")
    println("Outcome: ",warNewton([-4.0, 10.0, 25.0, -6.0], [-1.0, 5.0, 2.0, 4.0], 25.0), " Should be: 1014.0")
    
end

#test_warNewton()