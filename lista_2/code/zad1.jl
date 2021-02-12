# Szymon Skoczylas, 250072

x = [2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
y = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]


function alg_a(Type)
    sum = 0

    for i in 1:length(x)
        sum += Type(x[i]) * Type(y[i])
    end

    return sum
end

function alg_b(Type)
    sum = 0

    for i in length(x):-1:1
        sum += Type(x[i]) * Type(y[i])
    end

    return sum
end

function alg_c(Type)
  greater_than_0 = Type[]
  less_eq_0 = Type[]

  for i in 1:length(x)
    product = Type(x[i]) * Type(y[i])

    if product > 0
      append!(greater_than_0, product)

    else
      append!(less_eq_0, product)

    end

  end

  sort(less_eq_0)
  sort(greater_than_0, rev=true)

  return sum(greater_than_0) + sum(less_eq_0)
end

function alg_d(Type)
  greater_than_0 = Type[]
  less_eg_0 = Type[]

  for i in 1:length(x)
    product = Type(x[i]) * Type(y[i])
    
    if product > 0
        append!(greater_than_0, product)

    else

        append!(less_eg_0, product)
    end
  end

  sort(less_eg_0, rev=true)
  sort(greater_than_0)

  return sum(less_eg_0) + sum(greater_than_0)
end

println("Float64:")
println(alg_a(Float64))
println(alg_b(Float64))
println(alg_c(Float64))
println(alg_d(Float64))

println("\nFloat32")
println(alg_a(Float32))
println(alg_b(Float32))
println(alg_c(Float32))
println(alg_d(Float32))
