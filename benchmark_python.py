from timeit import repeat
import random
import numpy as np


def _sum(numbers):
    """Compute sum of elements in x."""
    s = 0
    for n in numbers:
        s += n
    return s


# builtin sum of 10**7 numbers
random.seed(1)
a = [random.uniform(0, 1) for _ in range(10**7)]
r = min(repeat(lambda: sum(a), number=50)) / 50
print(f"python,builtin,sum,{r}")

# custom sum of 10**7 numbers
r = min(repeat(lambda: _sum(a), number=10)) / 10
print(f"python,custom,sum,{r}")


# NumPy sum of 10**7 numbers
a = np.random.default_rng(1).uniform(size=(10**7))
r = min(repeat(lambda: np.sum(a), number=100)) / 100
print(f"python,numpy,sum,{r}")


# matrix multiplication
a = np.random.default_rng(1).uniform(size=(10000, 2000))
b = a.T
r = min(repeat(lambda: a @ b, repeat=3, number=3)) / 3
print(f"python,numpy,matrix_multiplication,{r}")


# Cholesky decomposition
a = np.random.default_rng(1).uniform(size=(3000, 3000))
b = a.T
c = a @ b
r = min(repeat(lambda: np.linalg.cholesky(c), repeat=3, number=10)) / 10
print(f"python,numpy,cholesky,{r}")


# SVD
a = np.random.default_rng(1).uniform(size=(5000, 2000))
r = min(repeat(lambda: np.linalg.svd(a), repeat=3, number=3)) / 3
print(f"python,numpy,svd,{r}")


# determinant
a = np.random.default_rng(1).uniform(size=(500, 500))
r = min(repeat(lambda: np.linalg.det(a), number=1000)) / 1000
print(f"python,numpy,det,{r}")


# solve a linear equation system
a = np.random.default_rng(1).uniform(size=(2000, 2000))
b = np.arange(2000)
r = min(repeat(lambda: np.linalg.solve(a, b), number=50)) / 50
print(f"python,numpy,solve,{r}")


# least squares solution
a = np.random.default_rng(1).uniform(size=(2000, 1500))
b = np.arange(2000)
r = min(repeat(lambda: np.linalg.lstsq(a, b, rcond=None), number=5)) / 5
print(f"python,numpy,lstsq,{r}")
