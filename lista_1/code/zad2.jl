# Szymon Skoczylas, 250072

type = Float64
println("eps() for Float64: ", eps(type))
println("Kahan eps for Float64: ", type(3) * (type(4)/type(3) - type(1)) - type(1)  , "\n")

type = Float32
println("eps() for Float32: ", eps(type))
println("Kahan eps for Float32: ", type(3) * (type(4)/type(3) - type(1)) - type(1)  , "\n")

type = Float16
println("eps() for Float16: ", eps(type))
println("Kahan eps for Float16: ", type(3) * (type(4)/type(3) - type(1)) - type(1)  , "\n")