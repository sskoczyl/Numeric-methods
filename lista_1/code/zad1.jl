# Szymon Skoczylas, 250072

function find_macheps(Type)
    value = Type(1.0)

    while Type(1.0) + value / Type(2.0) > Type(1.0)
        value = value / Type(2.0)

    end

    return value
end


calculated_eps = find_macheps(Float64)
println("Calculated macheps for Float64 is:", calculated_eps)
default_eps = eps(Float64)
println("eps() value for Float64 is:", default_eps, "\n")

calculated_eps = find_macheps(Float32)
println("Calculated macheps for Float32 is:", calculated_eps)
default_eps = eps(Float32)
println("eps() value for Float32 is:", default_eps, "\n")

calculated_eps = find_macheps(Float16)
println("Calculated macheps for Float16 is:", calculated_eps)
default_eps = eps(Float16)
println("eps() value for Float16 is:", default_eps, "\n")


function find_eta(Type)
    value = Type(1.0)

    while value / Type(2.0) != Type(0.0)
        value = value / Type(2.0)
        
    end

    return value
end


calculated_eta = find_eta(Float64)
println("Calculated eta for Float64 is:", calculated_eta)
default_eta = nextfloat(Float64(0.0))
println("nextfloat() value for Float64 is:", default_eta, "\n")

calculated_eta = find_eta(Float32)
println("Calculated eta for Float32 is:", calculated_eta)
default_eta = nextfloat(Float32(0.0))
println("nextfloat() value for Float32 is:", default_eta, "\n")

calculated_eta = find_eta(Float16)
println("Calculated eta for Float16 is:", calculated_eta)
default_eta = nextfloat(Float16(0.0))
println("nextfloat() value for Float16 is:", default_eta, "\n")


function find_max(Type) 
    max = prevfloat(Type(1.0))

    while !isinf(max*Type(2.0))
        max = max * Type(2.0)

    end

    return max
end


calculated_max = find_max(Float64)
println("Calculated max for Float64 is:", calculated_max)
default_max = floatmax(Float64(0.0))
println("floatmax() value for Float64 is:", default_max, "\n")

calculated_max = find_max(Float32)
println("Calculated max for Float32 is:", calculated_max)
default_max = floatmax(Float32(0.0))
println("floatmax() value for Float32 is:", default_max, "\n")

calculated_max = find_max(Float16)
println("Calculated max for Float16 is:", calculated_max)
default_max = floatmax(Float16(0.0))
println("floatmax() value for Float16 is:", default_max, "\n")