# Szymon Skoczylas, 250072


function series_expression(number, r_const, start_val)
    number == 0 && return start_val
    curr_val = series_expression(number-1, r_const, start_val)
    return curr_val + r_const * curr_val * (1 - curr_val)
end
 

println("==================40 iterations==================")
println("-for Float32: ", series_expression(40, Float32(3), Float32(0.01)))
println("-for Float64: ", series_expression(40, Float64(3), Float64(0.01)))


let expression_value = series_expression(10, Float32(3), Float32(0.01))

    println("=============40 iterations cut every 10=============")
    for i in 1:3
        expression_value = series_expression(10, Float32(3), Float32(trunc(expression_value*10^3)/10^3))
    end

    println("-value: ", expression_value)
    
end