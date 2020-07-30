#!/usr/bin/env bash

FILE=results.csv
if [[ -f "$FILE" ]]; then
    echo "$FILE exists (make sure $FILE does not exist to run the benchmarks)."
    exit -1
fi

PYTHON_OPENBLAS=/usr/local/bin/python3
PYTHON_MKL=~/anaconda/bin/python

echo "language,blas,benchmark,time" > $FILE
echo "Benchmarking Python OpenBLAS..."
$PYTHON_OPENBLAS benchmark_python.py >> results.csv

echo "Benchmarking Python MKL..."
$PYTHON_MKL benchmark_python.py >> results.csv

echo "Benchmarking Julia OpenBLAS..."
julia benchmark_julia.jl >> results.csv
