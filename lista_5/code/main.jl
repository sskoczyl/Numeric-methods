#Szymon Skoczylas

include("blocksys.jl")
include("func.jl")
include("matrixgen.jl")

# Without gnerating b vector
calculate_gauss("data/Dane16/A.txt", false, "data/Dane16/b.txt", false, true, "gauss_out.txt")
calculate_gauss("data/Dane16/A.txt", false, "data/Dane16/b.txt", true, true, "gauss_piv_out.txt") #pivoted
# Generate b vector:
calculate_gauss("data/Dane16/A.txt", true, "", false, true, "gauss_no_b_out.txt")
calculate_gauss("data/Dane16/A.txt", true, "", true, true, "gauss_no_b_piv_out.txt") #pivoted
# Without gnerating b vector
calculate_lu("data/Dane10000/A.txt", false, "data/Dane10000/b.txt", false, true, "lu_out.txt")
calculate_lu("data/Dane10000/A.txt", false, "data/Dane10000/b.txt", true, true, "lu_piv_out.txt") #pivoted
# Generate b vector:
calculate_lu("data/Dane10000/A.txt", true, "", false, true, "lu_no_b_out.txt")
calculate_lu("data/Dane10000/A.txt", true, "", true, true, "lu_no_b_piv_out.txt") #pivoted

