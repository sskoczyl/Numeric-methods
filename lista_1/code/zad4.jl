# Szymon Skoczylas, 250072

let num = Float64(1.0)

    while nextfloat(num) * (Float64(1.0) / nextfloat(num)) == Float64(1.0)
        num = nextfloat(num)
    end

    println(nextfloat(num))

    num = Float64(0.0)

    while nextfloat(num) * (Float64(1.0) / nextfloat(num)) == Float64(1.0)
        num = nextfloat(num)
    end

    println(nextfloat(num))

end
