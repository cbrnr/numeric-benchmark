function t = mytimeit(f, n=100)
    t = zeros(1, n);
    for i = 1:n
        tic;
        f();
        t(n) = toc;
    end
    t = mean(t);
end
