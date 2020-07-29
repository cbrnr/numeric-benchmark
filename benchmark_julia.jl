using Random
using LinearAlgebra
using BenchmarkTools


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
println("julia,builtin_sum,$(minimum(t.times) * 1e-9)")

# custom sum of 10**7 numbers
t = @benchmark _sum($a)
println("julia,custom_sum,$(minimum(t.times) * 1e-9)")

# matrix multiplication
a = rand(Float64, (10000, 2000))
b = copy(a)'
t = @benchmark $a * $b
println("julia,matrix_multiplication,$(minimum(t.times) * 1e-9)")

# Cholesky decomposition
a = rand(Float64, (3000, 3000))
b = copy(a)'
c = a * b
t = @benchmark cholesky($c)
println("julia,cholesky,$(minimum(t.times) * 1e-9)")
