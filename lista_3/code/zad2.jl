# Szymon Skoczylas, 250072

function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    it, err = 0, 0
    r = x0
    v = f(r)

    if abs(pf(r)) < epsilon
        return (r, v, it, 2)
    end

    for i in 1:maxit
        x1 = r - v / pf(r)
        v = f(x1)
        if abs(v) < epsilon || abs(x1 - r) < delta 
            r = x1
            return (r, v, i, err)
        end
        r = x1
    end

    return (r, v, it, 1)
end

function test()
    f(x) = x ^ 2 - 1
    fp(x) = 2x
    println("x^2: ",mstycznych(f, fp, -4.0, 10^-5, 10^-5, 30))
    f(x) = sin(x)
    fp(x) = -cos(x)
    println("sinx: ",mstycznych(f, fp, 0.0, 10^-5, 10^-5, 30))
    f(x) = cos(x)
    fp(x) = -sin(x)
    println("cosx: ",mstycznych(f, fp, -1.0, 10^-5, 10^-5, 30))
    f(x) = exp(x) - 1
    fp(x) = exp(x)
    println("e^x: ",mstycznych(f, fp, -1.0, 10^-5, 10^-5, 30))
end

# tests()
