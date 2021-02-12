# Szymon Skoczylas, 250072

using StatsPlots


let values = [[1,-2], [2, -2], [1.999999999999999, -2], [1, -1], [-1, -1], [0.75, -1], [0.25, -1]], idx = 1
  
  pyplot()
  for pair in values
    x, c = Float64(pair[1]), Float64(pair[exit2]) 
    result = []
    append!(result, x)

    for i in 1:40
      x = x^2 + c
      append!(result, x)
    end
        
    plot(1:41, result)
    savefig("plots/zad6_fig$(idx).png")

    idx = idx + 1
  end
end