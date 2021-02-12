#Szymon Skoczylas

include("./func.jl")

    using SparseArrays

    function gauss(A, b, n, l)
        vect = Array{Float64}(undef, n)
        for k in 1 : Int64(n/l)
            row_begin = ((k - 1)*l + 1)
            row_fin, row_a_fin, col_fin = min(row_begin + 2*l - 1, n) , (row_begin + l - 1), min(k*l + l, n)
            for i in row_begin : row_a_fin
                for j in i + 1 : row_fin
                    sub_coff = A[j, i] / A[i, i]
                    A[j, i] = 0
                    for m in i + 1 : col_fin
                        A[j, m] = A[j, m] - sub_coff * A[i, m]
                    end
                    b[j] = b[j] - sub_coff * b[i]
                end
            end
        end
        for k in Int64(n/l):-1:1
            col_fin, row_begin = min(k*l + l, n), ((k - 1)*l + 1)
            row_a_fin = (row_begin + l - 1)
            for i in row_a_fin :-1: row_begin
                sum = 0
                for j in i+1 : col_fin
                    sum += A[i, j] * vect[j]
                end
                vect[i] = (b[i] - sum) / A[i, i]
            end
        end
        return vect
    end

    function pivoted_gauss(A, b, n, l)
        p = collect(1:n)
        vect = Array{Float64}(undef, n)
        for k in 1 : Int64(n/l)
            row_begin = ((k - 1)*l + 1)
            row_fin, row_a_fin, col_fin = min(row_begin + 2*l - 1, n), (row_begin + l - 1), min(k*l + l, n)
            for i in row_begin : row_a_fin
                for j in i + 1 : row_fin
                    max_r, max = i, abs(A[p[i], i])
                    for x in i : row_fin
                        if (abs(A[p[x], i]) > max)
                            max_r, max = x, abs(A[p[x], i])
                        end
                    end
                    p[i], p[max_r] = p[max_r], p[i]
                    sub_cof = A[p[j], i] / A[p[i], i]
                    A[p[j], i] = 0
                    for m in i + 1 : col_fin
                        A[p[j], m] = A[p[j], m] - sub_cof * A[p[i], m]
                    end
                    b[p[j]] = b[p[j]] - sub_cof * b[p[i]]
                end
            end
        end
        for k in Int64(n/l):-1:1
            row_begin = ((k - 1)*l + 1)
            col_fin, row_a_fin = min(k*l + l, n), (row_begin + l - 1)
            for i in row_a_fin :-1: row_begin
                sum = 0
                for j in i+1 : col_fin
                    sum += A[p[i], j] * vect[j]
                end
                vect[i] = (b[p[i]] - sum) / A[p[i], i]
            end
        end
        return vect
    end

    function marix_lu(A, n, l)
        for k in 1 : Int64(n/l)
            row_start = (k - 1)*l + 1
            row_fin = min(row_start + 2*l - 1, n)
            row_a_fin = row_start + l - 1
            col_fin = min(k*l + l, n)
            for i in row_start : row_a_fin
                for j in i + 1 : row_fin
                    sub_cof = A[j, i] / A[i, i]
                    A[j, i] = sub_cof
                    for m in i + 1 : col_fin
                        A[j, m] = A[j, m] - sub_cof * A[i, m]
                    end
                end
            end
        end
    end

    function pivotet_matrix_lu(A, n, l)
        perm = collect(1:n)
        for k in 1 : Int64(n/l)
            row_begin = (k - 1)*l + 1
            row_fin, row_a_end, col_end = min(row_begin + 2*l - 1, n), (row_begin + l - 1), min(k*l + l, n)
            for i in row_begin : row_a_end
                for j in i + 1 : row_fin
                    max_r, max = i, abs(A[perm[i], i])
                    for x in i : row_fin
                        if (abs(A[perm[x], i]) > max)
                            max_r, max = x, abs(A[perm[x], i])
                        end
                    end
                    perm[i], perm[max_r] = perm[max_r], perm[i]
                    sub_cof = A[perm[j], i] / A[perm[i], i]
                    A[perm[j], i] = A[perm[j], i] / A[perm[i], i]
                    for m in i + 1 : col_end
                        A[perm[j], m] = A[perm[j], m] - sub_cof * A[perm[i], m]
                    end
                end
            end
        end
        return perm
    end

    function lu_(A, b, n, l)
        x = Array{Float64}(undef, n)
        for k in 1 : Int64(n/l)
            row_begin = (k - 1)*l + 1
            row_fin, row_a_fin = min(row_begin + 2*l - 1, n), (row_begin + l - 1)
            for i in row_begin : row_a_fin
                for j in i + 1 : row_fin
                    b[j] = b[j] - A[j,i]*b[i]
                end
            end
        end
        for k in Int64(n/l):-1:1
            row_begin = (k - 1)*l + 1
            row_fin, col_fin = (row_begin + l - 1), min(k*l + l, n)
            for i in row_fin :-1: row_begin
                sum = 0
                for j in i+1 : col_fin
                    sum += A[i, j] * x[j]
                end
                x[i] = (b[i] - sum) / A[i, i]
            end
        end
        return x
    end

    function lu_pivoted(A, b, n, l, p)
        x = Array{Float64}(undef, n)
        for k in 1 : Int64(n/l)
            row_begin = (k - 1)*l + 1
            row_fin, row_a_fin = min(row_begin + 2*l - 1, n), (row_begin + l - 1)
            for i in row_begin : row_a_fin
                for j in i + 1 : row_fin
                    b[p[j]] = b[p[j]] - A[p[j], i] * b[p[i]]
                end
            end
        end
        for k in Int64(n/l):-1:1
             row_begin = (k - 1)*l + 1
            row_fin, col_fin = (row_begin + l - 1), min(k*l + l, n)
            for i in row_fin :-1: row_begin
                sum = 0
                for j in i+1 : col_fin
                    sum += A[p[i], j] * x[j]
                end
                x[i] = (b[p[i]] - sum) / A[p[i], i]
            end
        end
        return x
    end

    function calculate_gauss(m_file, gen_v, v_file, choose, to_file, out_patch)
        M = load_matrix_from_file(m_file)
        (A, n, l)  = M[1], M[2], M[3]
        (b, x) = Array{Float64}(undef, n), Array{Float64}(undef, n)
        if !gen_v
        b = read_vector_from_file(v_file)
        else
        b = create_vector(A, n)
        end
        if choose
        x = pivoted_gauss(A, b, n, l)
        else
        x = gauss(A, b, n, l)
        end
        if to_file
        if gen_v
        save_vector_to_file(out_patch, x, n, true, rel_er_calc(x, n))
        else
        save_vector_to_file(out_patch, x, n)
        end
        end
    end

    function calculate_lu(m_file, gen_v, v_file, choose, to_file, out_patch)
        M = load_matrix_from_file(m_file)
        (A, n, l)  = M[1], M[2], M[3]
        (b, x) = Array{Float64}(undef, n), Array{Float64}(undef, n)
        if !gen_v
        b = read_vector_from_file(v_file)
        else
        b = create_vector(A, n)
        end
        if choose
        p = pivotet_matrix_lu(A, n, l)
        x = lu_pivoted(A, b, n, l, p)
        else
        marix_lu(A, n, l)
        x = lu_(A, b, n, l)
        end
        if to_file
        if gen_v
        save_vector_to_file(out_patch, x, n, true, rel_er_calc(x, n))
        else
        save_vector_to_file(out_patch, x, n)
        end
        end
    end

    function create_vector(Matrix, n)
        b = Array{Float64}(undef, n)
        (v, r) = nonzeros(Matrix), rowvals(Matrix) 
        for i in 1:n
            for j in nzrange(Matrix, i)
                b[r[j]] += v[j]
            end
        end
        return b
    end