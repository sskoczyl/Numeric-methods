# Szymon Skoczylas, 250072

include("hilb.jl")
include("matcond.jl")


println("================Hilbert================")

n=20
x, A = ones(Float64, n), hilb(n)

b = A*x
gauss_elimination, marix_inversion = A\b, inv(A)*b
elimination_err, inversion_err = norm(gauss_elimination - x) / norm(x), norm(marix_inversion - x) / norm(x)
println("Size: ", n)
println("Rank: ", rank(A))
println("Cond: ", cond(A))
println("Elimination err: ", elimination_err)
println("Inversion err: ", inversion_err)
println("-------------------------------")


println("================Random================")
for n in [5, 10, 20], c in [Float64(10^3)]
    x, A = ones(Float64, n), matcond(n,c)

    b = A*x
    gauss_elimination, marix_inversion = A\b, inv(A)*b
    elimination_err, inversion_err = norm(gauss_elimination - x) / norm(x), norm(marix_inversion - x) / norm(x)

    println("Size: ", n)
    println("Rank: ", rank(A))
    println("Cond: ", cond(A))
    println("Elimination err: ", elimination_err)
    println("Inversion error: ", inversion_err)
    println("-------------------------------")
    
end
