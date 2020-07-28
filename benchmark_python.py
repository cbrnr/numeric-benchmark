from timeit import timeit
import random
import numpy as np


functions = []


def register(f):
    functions.append(f)
    return f


@register
def test_builtin_sum():
    """Benchmark builtin sum of 10**7 numbers."""
    random.seed(1)
    a = [random.uniform(0, 1) for _ in range(10**7)]  # generator is faster
    n = 100
    r = timeit(lambda: sum(a), number=n) / n
    return f"python,builtin,sum,{r}"


def _sum(numbers):
    """Compute sum of elements in x."""
    s = 0
    for n in numbers:
        s += n
    return s


@register
def test_custom_sum():
    """Benchmark custom sum of 10**7 numbers."""
    random.seed(1)
    a = [random.uniform(0, 1) for _ in range(10**7)]
    n = 10
    r = timeit(lambda: _sum(a), number=n) / n
    return f"python,custom,sum,{r}"


@register
def test_numpy_sum():
    """Benchmark NumPy sum."""
    a = np.random.default_rng(1).uniform(size=(10**7))
    n = 100
    r = timeit(lambda: np.sum(a), number=n) / n
    return f"python,numpy,sum,{r}"


@register
def test_matrix_multiplication():
    """Benchmark matrix multiplication."""
    a = np.random.default_rng(1).uniform(size=(10000, 2000))
    b = a.T
    n = 5
    r = timeit(lambda: a @ b, number=n) / n
    return f"python,numpy,matrix_multiplication,{r}"


@register
def test_cholesky():
    """Benchmark Cholesky decomposition."""
    a = np.random.default_rng(1).uniform(size=(3000, 3000))
    b = a.T
    c = a @ b
    n = 10
    r = timeit(lambda: np.linalg.cholesky(c), number=n) / n
    return f"python,numpy,cholesky,{r}"


@register
def test_svd():
    """Benchmark SVD."""
    a = np.random.default_rng(1).uniform(size=(5000, 2000))
    n = 3
    r = timeit(lambda: np.linalg.svd(a), number=n) / n
    return f"python,numpy,svd,{r}"


@register
def test_det():
    """Benchmark determinant."""
    a = np.random.default_rng(1).uniform(size=(500, 500))
    n = 100
    r = timeit(lambda: np.linalg.det(a), number=n) / n
    return f"python,numpy,det,{r}"


@register
def test_solve():
    """Benchmark solving a linear equation system."""
    a = np.random.default_rng(1).uniform(size=(2000, 2000))
    b = np.arange(2000)
    n = 50
    r = timeit(lambda: np.linalg.solve(a, b), number=n) / n
    return f"python,numpy,solve,{r}"


@register
def test_lstsq():
    """Benchmark least squares solution."""
    a = np.random.default_rng(1).uniform(size=(2000, 1500))
    b = np.arange(2000)
    n = 5
    r = timeit(lambda: np.linalg.lstsq(a, b, rcond=None), number=n) / n
    return f"python,numpy,lstsq,{r}"


for f in functions:
    print(f())
