# Szymon Skoczylas, 250072

using Polynomials
using Polynomials.PolyCompat


function find_roots(coff)
    canonical_figure, product_figure = Poly(reverse(coff)), poly(Float64[1.0:20.0;])
    coff_roots = roots(canonical_figure)

    for k in 1:20
        println("k=", k)
        println("zk=", coff_roots[k])
        println("|P(zk)| =", abs(polyval(canonical_figure, coff_roots[k])))
        println("|P(zk)| =", abs(polyval(product_figure, coff_roots[k])))
        println("|zk-k|=", abs(coff_roots[k] - k))
        println("--------------------------------")
    end  
end


base_cofficient=Float64[1, -210.0, 20615.0,-1256850.0, 53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,
        11310276995381.0, -135585182899530.0, 1307535010540395.0, -10142299865511450.0, 63030812099294896.0, -311333643161390640.0,
        1206647803780373360.0, -3599979517947607200.0, 8037811822645051776.0, -12870931245150988800.0,
        13803759753640704000.0, -8752948036761600000.0, 2432902008176640000.0];

modified_cofficient=Float64[1, -210.0 - (2)^(-23), 20615.0,-1256850.0, 53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,
        11310276995381.0, -135585182899530.0, 1307535010540395.0, -10142299865511450.0, 63030812099294896.0, -311333643161390640.0,
        1206647803780373360.0, -3599979517947607200.0, 8037811822645051776.0, -12870931245150988800.0,
        13803759753640704000.0, -8752948036761600000.0, 2432902008176640000.0];

println("==================BASE COFFICIENT==================")
find_roots(base_cofficient)

println("==================MODIFIED COFFICIENT==================")
find_roots(modified_cofficient)