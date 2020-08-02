#!/usr/bin/env bash

PYTHON_OPENBLAS=/usr/local/bin/python3
PYTHON_MKL=~/anaconda/bin/python
MATLAB=/Applications/MATLAB_R2019b.app/bin/matlab

echo "Benchmarking Python OpenBLAS..."
$PYTHON_OPENBLAS benchmark_python.py

echo "Benchmarking Python MKL..."
$PYTHON_MKL benchmark_python.py

echo "Benchmarking Julia OpenBLAS..."
julia benchmark_julia.jl

echo "Benchmarking MATLAB..."
$MATLAB -nojvm -r "run('benchmark_matlab.m'); exit;"
