# Szymon Skoczylas, 250072

using Plots
using SymPy

@vars point real = true
print("Lim= " ,limit(exp.(point) * log.(1.0 + exp.(-point)), point,oo), "\n")

pyplot()
plot(exp.(point) * log.(1.0 + exp.(-point)), 30, 40,)
savefig("plots/zad2_fig1.png")
