# Szymon Skoczylas, 250072

include("zad1.jl")
include("zad2.jl")
include("zad3.jl")

function func(x)
    return (3 * x) - (exp(x))
end


println("----------------------------------------")
println("Przedzial [0.5, 1.0]:")
println(mbisekcji(func, 0.5, 1.0, Float64(1.0 / 10.0^4), Float64(1.0 / 10.0^4)))
println("----------------------------------------")
println("Przedzial [0.0, 1.0]:")
println(mbisekcji(func, 0.0, 1.0, Float64(1.0 / 10.0^4), Float64(1.0 / 10.0^4)))
println("----------------------------------------")
println("Przedzial [1.0, 2.0]:")
println(mbisekcji(func, 1.0, 2.0, Float64(1.0 / 10.0^4), Float64(1.0 / 10.0^4)))
println("----------------------------------------")
println("Przedzial [1.5, 2.0]:")
println(mbisekcji(func, 1.5, 2.0, Float64(1.0 / 10.0^4), Float64(1.0 / 10.0^4)))
println("----------------------------------------")