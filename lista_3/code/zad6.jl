# Szymon Skoczylas, 250072

include("zad1.jl")
include("zad2.jl")
include("zad3.jl")

function func_1(x)
    return exp(1 - x) - 1
end

function func_2(x)
    return x * exp(-x) 
end

function func_1_derviative(x)
    return -exp(1 - x)
end

function func_2_derviative(x)
    return -exp(-x) * (x - 1)
end


println("--------------------METODA BISEKCJI--------------------")
println("f1:")
println("[0, 2] ", mbisekcji(func_1, 0.0, 2.0, 10^(-5), 10^(-5)))
println("[0.5, 1.5] ", mbisekcji(func_1, 0.5, 1.5, 10^(-5), 10^(-5)))
println("[-2, 2] ", mbisekcji(func_1, -2.0, 2.0, 10^(-5), 10^(-5)))
println("[-200, 200] ", mbisekcji(func_1, -200.0, 200.0, 10^(-5), 10^(-5)))
println("[0.4, 1.5] ", mbisekcji(func_1, -0.4, 1.5, 10^(-5), 10^(-5)))
println("f2:")
println("[0, 2] ", mbisekcji(func_2, 0.0, 2.0, 10^(-5), 10^(-5)))
println("[0.5, 1.5] ", mbisekcji(func_2, 0.5, 1.5, 10^(-5), 10^(-5)))
println("[-2, 2] ", mbisekcji(func_2, -2.0, 2.0, 10^(-5), 10^(-5)))
println("[-200, 200] ", mbisekcji(func_2, -200.0, 200.0, 10^(-5), 10^(-5)))
println("[0.4, 1.5] ", mbisekcji(func_2, -0.4, 1.5, 10^(-5), 10^(-5)))


println("--------------------METODA STYCZNYCH--------------------")
println("f1:")
println("x0=0 ", mstycznych(func_1, func_1_derviative, 0.0, 10^(-5), 10^(-5), 64))
println("x0=-1 ", mstycznych(func_1, func_1_derviative, -1.0, 10^(-5), 10^(-5), 64))
println("x0=0.5 ", mstycznych(func_1, func_1_derviative, 0.5, 10^(-5), 10^(-5), 64))
println("x0=1 ", mstycznych(func_1, func_1_derviative, 1.0, 10^(-5), 10^(-5), 64))
println("x0=3 ", mstycznych(func_1, func_1_derviative, 3.0, 10^(-5), 10^(-5), 64))
println("x0=4 ", mstycznych(func_1, func_1_derviative, 4.0, 10^(-5), 10^(-5), 64))
println("x0=6 ", mstycznych(func_1, func_1_derviative, 6.0, 10^(-5), 10^(-5), 64))
println("x0=8 ", mstycznych(func_1, func_1_derviative, 8.0, 10^(-5), 10^(-5), 64))
println("x0=15 ", mstycznych(func_1, func_1_derviative, 15.0, 10^(-5), 10^(-5), 64))
println("f2:")
println("x0=0 ", mstycznych(func_2, func_2_derviative, 0.0, 10^(-5), 10^(-5), 64))
println("x0=-1 ", mstycznych(func_2, func_2_derviative, -1.0, 10^(-5), 10^(-5), 64))
println("x0=0.5 ", mstycznych(func_2, func_2_derviative, 0.5, 10^(-5), 10^(-5), 64))
println("x0=1 ", mstycznych(func_2, func_2_derviative, 1.0, 10^(-5), 10^(-5), 64))
println("x0=3 ", mstycznych(func_2, func_2_derviative, 3.0, 10^(-5), 10^(-5), 64))
println("x0=4 ", mstycznych(func_2, func_2_derviative, 4.0, 10^(-5), 10^(-5), 64))
println("x0=6 ", mstycznych(func_2, func_2_derviative, 6.0, 10^(-5), 10^(-5), 64))
println("x0=8 ", mstycznych(func_2, func_2_derviative, 8.0, 10^(-5), 10^(-5), 64))
println("x0=15 ", mstycznych(func_2, func_2_derviative, 15.0, 10^(-5), 10^(-5), 64))


println("--------------------METODA SIECZNYCH--------------------")
println("f1:")
println("x0=0, x1=2 ", msiecznych(func_1, 0.0, 2.0, 10^(-5), 10^(-5), 64))
println("x0=0.5, x1=1.5 ", msiecznych(func_1, 0.5, 1.5, 10^(-5), 10^(-5), 64))
println("x0=-2, x1=2 ", msiecznych(func_1, -2.0, 2.0, 10^(-5), 10^(-5), 64))
println("x0=-200, x1=200 ", msiecznych(func_1, -200.0, 200.0, 10^(-5), 10^(-5), 64))
println("x0=0.4, x1=1.5 ", msiecznych(func_1, -0.4, 1.5, 10^(-5), 10^(-5), 64))
println("f2:")
println("x0=0, x1=2 ", msiecznych(func_2, 0.0, 2.0, 10^(-5), 10^(-5), 64))
println("x0=0.5, x1=1.5 ", msiecznych(func_2, 0.5, 1.5, 10^(-5), 10^(-5), 64))
println("x0=-2, x1=2 ", msiecznych(func_2, -2.0, 2.0, 10^(-5), 10^(-5), 64))
println("x0=-200, x1=200 ", msiecznych(func_2, -200.0, 200.0, 10^(-5), 10^(-5), 64))
println("x0=0.4, x1=1.5 ", msiecznych(func_2, -0.4, 1.5, 10^(-5), 10^(-5), 64))
