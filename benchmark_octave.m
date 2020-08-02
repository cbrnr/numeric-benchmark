f = fopen('octave.csv', 'w');
fprintf(f, 'language,blas,benchmark,time\n');

% builtin sum of 10**7 numbers
a = rand(1, 1e7);
fprintf(f, 'octave,openblas,builtin_sum,%.10f\n', mytimeit(@() sum(a)));

% custom sum of 10**7 numbers
fprintf(f, 'octave,openblas,custom_sum,%.10f\n', mytimeit(@() mysum(a), n=2));

% matrix multiplication
a = rand(10000, 2000);
b = a';
fprintf(f, 'octave,openblas,mat_mult,%.10f\n', mytimeit(@() a * b, n=10));

% Cholesky decomposition
a = rand(3000, 3000);
b = a';
c = a * b;
fprintf(f, 'octave,openblas,cholesky,%.10f\n', mytimeit(@() chol(c), n=30));

% SVD
a = rand(5000, 2000);
fprintf(f, 'octave,openblas,svd,%.10f\n', mytimeit(@() svd(a), n=10));

% determinant
a = rand(500, 500);
fprintf(f, 'octave,openblas,det,%.10f\n', mytimeit(@() det(a), n=1000));

% solve a linear equation system
a = rand(2000, 2000);
b = (1:2000)';
fprintf(f, 'octave,openblas,solve,%.10f\n', mytimeit(@() a \ b));

% least squares solution
a = rand(2000, 1500);
b = (1:2000)';
fprintf(f, 'octave,openblas,lstsqr,%.10f\n', mytimeit(@() a \ b));

fclose(f);
