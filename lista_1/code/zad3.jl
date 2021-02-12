# Szymon Skoczylas, 250072

function check_density(start, delta)
    for i in 1:8
        println(bitstring(start+i*delta))
    end
end

println("[1,2]")
check_density(1, 2.0^(-52))

println("[0.5, 1]")
check_density(2, 2.0^(-51))

println("[2,4]")
check_density(0.5, 2.0^(-53))
