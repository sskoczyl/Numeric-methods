# Szymon Skoczylas, 250072

function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    r, v = Float64(0.0), Float64(0.0)
    it, err = 0, 0
    f_x0, f_x1 = f(x0), f(x1)

    for it in 1:maxit
        if abs(f_x0) > abs(f_x1)
            x0, x1 = x1, x0
            f_x0, f_x1 = f_x1, f_x0
        end

        s = (x1 - x0) / (f_x1 - f_x0)
        f_x1= f_x0
        x1 =x0
        x0 -= f_x0 * s 
        f_x0 = f(x0)

        if abs(x1 - x0) < delta || abs(f_x0) < epsilon
            r = x0
            v = f_x0
            return(r, v, it, err)
        end
    end

    v = f_x0
    r = x0
    return(r, v, it, 1)
end


function tests()
    f(x) = x ^ 2 - 1
    println("x^2: ",msiecznych(f, -4.0, 0.0, 10^-5, 10^-5, 30))
    f(x) = sin(x)
    println("sinx: ",msiecznych(f, -1.0, 1.0, 10^-5, 10^-5, 30))
    f(x) = cos(x)
    println("cosx: ",msiecznych(f, 0.0, 3.0, 10^-5, 10^-5, 30))
    f(x) = exp(x) - 1
    println("e^x: ",msiecznych(f, -1.0, 1.0, 10^-5, 10^-5, 30))
end

# tests()
