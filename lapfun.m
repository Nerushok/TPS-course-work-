
function F0 = lapfun(x)

fun = @(z) 1/sqrt(2*pi) * exp(-z.^2./2);

F0 = integral(fun, 0, x);
