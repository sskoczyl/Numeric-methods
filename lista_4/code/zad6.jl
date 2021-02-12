# Szymon Skoczylas, 250072

include("zad4.jl")


function f(x)
    return abs(x)
end

function g(x)
    return 1.0 / (1.0 + x^2)
end


rysujNnfx(f, Float64(-1.0), Float64(1.0), 5)
rysujNnfx(f, Float64(-1.0), Float64(1.0), 10)
rysujNnfx(f, Float64(-1.0), Float64(1.0), 15)

rysujNnfx(g, Float64(-5.0), Float64(5.0), 5)
rysujNnfx(g, Float64(-5.0), Float64(5.0), 10)
rysujNnfx(g, Float64(-5.0), Float64(5.0), 15)
