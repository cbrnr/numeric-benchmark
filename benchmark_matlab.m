f = fopen('matlab.csv', 'w');
fprintf(f, 'language,blas,benchmark,time\n');

% builtin sum of 10**7 numbers
a = rand(1, 1e7);
fprintf(f, 'matlab,mwblas,builtin_sum,%.10f\n', timeit(@() sum(a)));

% custom sum of 10**7 numbers
fprintf(f, 'matlab,mwblas,custom_sum,%.10f\n', timeit(@() mysum(a)));

% matrix multiplication
a = rand(10000, 2000);
b = a';
fprintf(f, 'matlab,mwblas,mat_mult,%.10f\n', timeit(@() a * b));

% Cholesky decomposition
a = rand(3000, 3000);
b = a';
c = a * b;
fprintf(f, 'matlab,mwblas,cholesky,%.10f\n', timeit(@() chol(c)));

% SVD
a = rand(5000, 2000);
fprintf(f, 'matlab,mwblas,svd,%.10f\n', timeit(@() svd(a)));

% determinant
a = rand(500, 500);
fprintf(f, 'matlab,mwblas,det,%.10f\n', timeit(@() det(a)));

% solve a linear equation system
a = rand(2000, 2000);
b = (1:2000)';
fprintf(f, 'matlab,mwblas,solve,%.10f\n', timeit(@() a \ b));

% least squares solution
a = rand(2000, 1500);
b = (1:2000)';
fprintf(f, 'matlab,mwblas,lstsqr,%.10f\n', timeit(@() a \ b));

fclose(f);
