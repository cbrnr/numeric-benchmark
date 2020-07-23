from timeit import timeit
import random
import numpy as np


def test_builtin_sum():
    """Builtin sum of 10**7 numbers."""
    random.seed(1)
    x = [random.uniform(0, 1) for _ in range(10**7)]
    n = 100
    r = timeit(lambda: sum(x), number=n) / n
    return f"python,builtin,sum,{r}"


# custom sum
def sum1(x):
    """Compute sum of elements in x."""
    s = 0
    for e in x:
        s += e
    return s


def test_custom_sum():
    """Custom sum of 10**7 numbers."""
    random.seed(1)
    x = [random.uniform(0, 1) for _ in range(10**7)]
    n = 10
    r = timeit(lambda: sum1(x), number=n) / n
    return f"python,custom,sum,{r}"


def test_numpy_sum():
    """NumPy sum."""
    rng = np.random.default_rng(1)
    x = rng.uniform(size=(10**7))
    n = 100
    r = timeit(lambda: np.sum(x), number=n) / n
    return f"python,numpy,sum,{r}"


# matrix multiplication
rng = np.random.default_rng(1)
x = rng.uniform(size=(10000, 2000))
y = x.T
n = 5
r = timeit(lambda: x @ y, number=n) / n
print(f"python,numpy,matrix_multiplication,{r}")

# Cholesky decomposition
rng = np.random.default_rng(1)
x = rng.uniform(size=(3000, 3000))
y = x.T
z = x @ y
n = 10
r = timeit(lambda: np.linalg.cholesky(z), number=n) / n
print(f"python,numpy,cholesky,{r}")

# SVD
rng = np.random.default_rng(1)
x = rng.uniform(size=(5000, 2000))
n = 5
r = timeit(lambda: np.linalg.svd(x), number=n) / n
print(f"python,numpy,svd,{r}")

# determinant
rng = np.random.default_rng(1)
x = rng.uniform(size=(3000, 3000))
n = 10
r = timeit(lambda: np.linalg.det(x), number=n) / n
print(f"python,numpy,det,{r}")

# linear equation system
rng = np.random.default_rng(1)
x = rng.uniform(size=(2000, 2000))
y = np.arange(2000)
n = 100
r = timeit(lambda: np.linalg.solve(x, y), number=n) / n
print(f"python,numpy,solve,{r}")

# least squares
rng = np.random.default_rng(1)
x = rng.uniform(size=(2000, 1500))
y = np.arange(2000)
n = 10
r = timeit(lambda: np.linalg.lstsq(x, y, rcond=None), number=n) / n
print(f"python,numpy,lstsq,{r}")
