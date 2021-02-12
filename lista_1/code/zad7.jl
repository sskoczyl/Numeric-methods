# Szymon Skoczylas, 250072

function derivative_at_point(func, point, h)
    return (func(point + h) - func(point)) / h
end

function real_derivative(x)
    return cos(x) - 3*sin(3*x)
end


for i in 1:54
    h = 2.0^(-i)
    f(x) = sin(x) + cos(3*x)

    deriv = derivative_at_point(f, one(Float64), h)
    error = abs(real_derivative(1.0) - deriv)

    println("2^-",i,": ", Float64(1.0) + h," error: ", error)
end

