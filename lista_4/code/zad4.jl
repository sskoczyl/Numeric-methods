# Szymon Skoczylas, 250072

using PyPlot
include("zad1.jl")
include("zad2.jl")
include("zad3.jl")


function rysujNnfx(f, a::Float64, b::Float64, n::Int)
    dist_diff, current_dist = ((b - a) / n), Float64(0.0)

    x, y = Vector{Float64}(undef, Int64(n + 1)), Vector{Float64}(undef, n + 1)
    f_x = Vector{Float64}(undef, n + 1)   
    args = Vector{Float64}(undef, 15 * (n + 1))
    f_plot, g_plot = Vector{Float64}(undef, 15 * (n + 1)), Vector{Float64}(undef, 15 * (n + 1))

    for i = 1:(n+1)
        x[i] = a + current_dist
        y[i] = f(x[i])
        current_dist += dist_diff
    end

    f_x = ilorazyRoznicowe(x, y)
    current_dist = Float64(0.0)
    dist_diff = (b - a) / (15 * (n + 1) - 1)

    for i = 1:(15 * (n + 1))
        args[i] = a + current_dist
        g_plot[i], f_plot[i] = warNewton(x, f_x, args[i]), f(args[i]) 
        current_dist += dist_diff
    end

    clf()
    plot(args, f_plot, label="f(x)")
    plot(args, g_plot, label="g(x)")
    savefig("plot_$(f)_$n.png")
end
