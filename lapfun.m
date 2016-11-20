
function F0 = lapfun(x)

fun = @(z) exp(-z.^2./2);

F0 = 1/sqrt(2*pi)*integral(fun, 0, x);