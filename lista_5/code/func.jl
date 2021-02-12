# Szymon Skoczylas

function rel_er_calc(x, n)
    max = 0
    for i in 1::Int64   
        if abs(1-x[i]) > max
            max = abs(1-x[i])
        end
    end
    return Float64(max*100)
end

function load_matrix_from_file(path)
    open(path) do x
        line = split(readline(x))
        n = parse(Int64, line[1])
        l = parse(Int64, line[2])
        size = n*l + n*2 - 2*l
        c = Array{Int64}(undef, size)
        r = Array{Int64}(undef, size)
        v = Array{Float64}(undef, size)
        idx = 0
        while !(eof(x))
            idx += 1
            line = split(readline(x))
            r[idx] = parse(Int64, line[1])
            c[idx] = parse(Int64, line[2])
            v[idx] = parse(Float64, line[3])
        end
        m = sparse(r, c, v)
        return (m, n, l)
    end
end

function read_vector_from_file(path::String)
    open(path) do x
        n = parse(Int64, readline(x))
        v = Array{Float64}(undef, n)
        idx = 0
        while !(eof(x))
            idx += 1
            v[idx] = parse(Float64, readline(x))
        end
        return v
    end
end

function save_vector_to_file(path, x, n, err= false, error = 0.0)
    open(path, "w") do f
        if err
            write(f, string(error))
            write(f, '\n')
        end
        for i in 1:n
            write(f, string(x[i]))
            write(f, '\n')
        end
    end
end
