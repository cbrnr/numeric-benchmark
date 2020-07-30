using Random
using LinearAlgebra
using BenchmarkTools


if occursin("openblas", string(LinearAlgebra.BLAS.vendor()))
    BLAS = "openblas"
elseif occursin("mkl", string(LinearAlgebra.BLAS.vendor()))
    BLAS = "mkl"
else
    BLAS = "unknown"
end


function _sum(numbers)
    s = 0.0
    for n in numbers
        s += n
    end
    s
end


# builtin sum of 10**7 numbers
Random.seed!(1)
a = rand(10^7)
t = @benchmark sum($a)
println("julia,$BLAS,builtin_sum,$(minimum(t.times) * 1e-9)")

# custom sum of 10**7 numbers
t = @benchmark _sum($a)
println("julia,$BLAS,custom_sum,$(minimum(t.times) * 1e-9)")

# matrix multiplication
a = rand(Float64, (10000, 2000))
b = copy(a)'
t = @benchmark $a * $b
println("julia,$BLAS,matrix_multiplication,$(minimum(t.times) * 1e-9)")

# Cholesky decomposition
a = rand(Float64, (3000, 3000))
b = copy(a)'
c = a * b
t = @benchmark cholesky($c)
println("julia,$BLAS,cholesky,$(minimum(t.times) * 1e-9)")

# SVD
a = rand(Float64, (5000, 2000))
t = @benchmark svd($a)
println("julia,$BLAS,svd,$(minimum(t.times) * 1e-9)")

# determinant
a = rand(Float64, (500, 500))
t = @benchmark det($a)
println("julia,$BLAS,det,$(minimum(t.times) * 1e-9)")

# solve a linear equation system
a = rand(Float64, (2000, 2000))
b = 1:2000
t = @benchmark $a \ $b
println("julia,$BLAS,solve,$(minimum(t.times) * 1e-9)")

# least squares solution
a = rand(Float64, (2000, 1500))
b = 1:2000
t = @benchmark $a \ $b
println("julia,$BLAS,lstsqr,$(minimum(t.times) * 1e-9)")
