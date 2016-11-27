
clc; clear all; close all;


m = [-2 -1 1];
sigm = 1;

M2 = [];
for i = 1:length(m)
	mathExpac = m(i);
	I1 = sigm * fiFunction((-2-mathExpac)/sigm);
	I2 = (mathExpac+2) * lapfun((-2-mathExpac)/sigm) + 0.5;
	I3 = sigm * fiFunction(-mathExpac/sigm);
	I4 = mathExpac * (0.5 - lapfun(-mathExpac/sigm));
	m2 = I1 + I2 + I3 + I4;
	
	fprintf('m2(m1=%d)\t%4.4f\n', mathExpac, m2)
	M2 = [M2 m2];
end


