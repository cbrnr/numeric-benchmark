Benchmark tasks
===============
1. Sum 10 million numbers.
2. Matrix multiplication (A * AT), where A is a (10000, 5000) matrix.
3. Cholesky decomposition.
4. SVD decomposition of a (10000, 2000) matrix.
5. PCA of (10000, 2000) matrix.
6. Determinant of a (2500, 2500) matrix.
7. Inverse of a (1600, 1600) matrix.

Parameters
==========
1. Languages:
    - Python (conda)
        * built-in functions
        * manual loop
        * NumPy
    - Julia (official installer)
        * built-in functions
        * manual loop
    - R (official installer)
        * built-in functions
        * manual loop
    - MATLAB
        * built-in functions
        * manual loop
    - Octave (homebrew)
        * built-in functions
        * manual loop
2. Hardware: Fixed to my MacBook Pro 2014 running the latest macOS
3. Backends: Use the defaults for each language, but vary some parameters if possible (e.g. MKL vs. Apple Accelerate, number of threads)
4. Measuring timing: use built-in functions where available, otherwise use tic/toc variants

MATLAB
======
>> x = rand(1, 1e7);
>> timeit(@() sum(x))

% file sum1.m in the working directory
function s = sum1(x)
    s = 0;
    for e = x
        s = s + e;
    end
end

>> timeit(@() sum1(x))

Python
======
>>> import random
>>> x = [random.uniform(0, 1) for _ in range(10**7)]
>>> %timeit sum(x)

def sum1(x):
    s = 0
    for e in x:
        s += e
    return s

>>> %timeit sum1(x)
>>> import numpy as np
>>> x = np.array(x)
>>> %timeit np.sum(x)

Julia
=====
julia> using BenchmarkTools
julia> x = rand(10^7)
julia> @benchmark sum($x)

function sum1(x)
    s = 0.0
    for e in x
        s += e
    end
    s
end

julia> @benchmark sum1($x)

Octave
======
octave:1> x = rand(1, 1e7);
octave:2> z = [];
octave:3> for i = 1:1000, tic; sum(x); z = [z; toc]; end
octave:4> mean(z)
octave:5> z = []
octave:6> tic; sum1(x); toc;
