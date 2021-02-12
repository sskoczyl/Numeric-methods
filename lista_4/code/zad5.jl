# Szymon Skoczylas, 250072

include("zad4.jl")


function f(x)
    return exp.(x)
end

function g(x)
    return (x^2) * sin.(x)    
end


rysujNnfx(f, Float64(0.0), Float64(1.0), 5)
rysujNnfx(f, Float64(0.0), Float64(1.0), 10)
rysujNnfx(f, Float64(0.0), Float64(1.0), 15)

rysujNnfx(g, Float64(-1.0), Float64(1.0), 5)
rysujNnfx(g, Float64(-1.0), Float64(1.0), 10)
rysujNnfx(g, Float64(-1.0), Float64(1.0), 15)
