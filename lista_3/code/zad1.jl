# Szymon Skoczylas, 250072

function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64) 
    r, v = Float64(0.0), Float64(0.0)    
    it, err = 0, 0
    middle_of_rng = b - a
    f_at_a, f_at_b = f(a), f(b)

    if signbit(f_at_a) == signbit(f_at_b)
        return (r, v, it, 1)
    end

    while middle_of_rng > epsilon
        it += 1

        middle_of_rng /= 2.0
        r = a + middle_of_rng
        v = f(r)

        if abs(middle_of_rng) < delta || abs(v) < epsilon
            return (r, v, it, err)
        end

        if signbit(v) != signbit(f_at_a)
            f_at_b = v
            b = r 
        else
            f_at_a = v
            a = r
        end
    end
end


function tests()
    f(x) = x ^ 2 - 1
    println("x^2: ",mbisekcji(f, -4.0, 0.0, 10^-5, 10^-5))
    f(x) = sin(x)
    println("sinx: ",mbisekcji(f, -1.0, 1.0, 10^-5, 10^-5))
    f(x) = cos(x)
    println("cosx: ",mbisekcji(f, 0.0, 3.0, 10^-5, 10^-5))
    f(x) = exp(x) - 1
    println("e^x: ",mbisekcji(f, -1.0, 1.0, 10^-5, 10^-5))
end

# tests()