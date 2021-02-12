# Szymon Skoczylas, 250072

include("zad1.jl")
include("zad2.jl")
include("zad3.jl")

function func(x)
    return sin(x) - (x/2)^2
end

function func_derivative(x)
    return cos(x) - (x/2)    
end


println("Metoda bisekcji: ",mbisekcji(func, 1.5, 2.0, 10^(-5) / 2, 10^(-5) / 2))
println("Metoda siecznych: ",msiecznych(func, 1.0, 2.0, 10^(-5) / 2, 10^(-5) / 2, 20))
println("Metoda stycznych: ",mstycznych(func, func_derivative, 1.5, 10^(-5) / 2, 10^(-5) / 2, 20))
