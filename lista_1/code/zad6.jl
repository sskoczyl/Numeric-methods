# Szymon Skoczylas, 250072

function f(x)
    sqrt(x ^ 2 + 1) - 1 
end

function g(x)
    x ^ 2 / (sqrt(x ^ 2 + 1) + 1)
end


for i in 1:100
    x = Float64(8.0) ^ (-i) 

    if g(x) != f(x)
        println(i,": f(x)=", f(x), " g(x)=",g(x))
    end
end