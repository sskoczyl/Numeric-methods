#Szymon Skoczylas

include("./blocksys.jl")
include("./matrixgen.jl")

blockmat(16, 4, 10.0, "A16.txt")
blockmat(10000, 4, 10.0, "A10k.txt")
blockmat(50000, 4, 10.0, "A50k.txt")

@time calculate_gauss("A16.txt", true, "", false, false, "")
@time calculate_gauss("A10k.txt", true, "", false, false, "")
@time calculate_gauss("A50k.txt", true, "", false, false, "")

@time calculate_gauss("A16.txt", true, "", true, false, "")
@time calculate_gauss("A10k.txt", true, "", true, false, "")
@time calculate_gauss("A50k.txt", true, "", true, false, "")

@time calculate_lu("A16.txt", true, "", false, false, "")
@time calculate_lu("A10k.txt", true, "", false, false, "")
@time calculate_lu("A50k.txt", true, "", false, false, "")

@time calculate_lu("A16.txt", true, "", true, false, "")
@time calculate_lu("A10k.txt", true, "", true, false, "")
@time calculate_lu("A50k.txt", true, "", true, false, "")

