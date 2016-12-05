

clc; clear all; close all;

m = [-2 -1 1];
sigm = 1;

syms tay

R1 = sigm^2*exp(-abs(tay))*cos(tay);
figure
graph = ezplot(R1);
set(graph,'LineWidth', 2);
grid on;
xlabel('tay');
ylabel('R1(tay)')


R = [];
for i = 1:length(m)
	mathE = m(i);
	C1 = sigm*(lapfun((-2-mathE)/sigm) + 1 -lapfun(-mathE/sigm));
	C2 = fiFunction((-2-mathE)/sigm) * ((-2-mathE)/sigm * (3+mathE) + 3*sigm) + 3*sigm*fiFunction(-mathE/sigm);
	C3 = fiFunction((-2-mathE)/sigm) * ((-mathE-2) * (-2-mathE)^2/sigm^2 - (-2-mathE)^2/sigm - 1) - mathE * fiFunction(-mathE/sigm);
	r = C1^2/6 * (exp(-abs(tay))*cos(tay))^3;
	R = [R r];
	fprintf('%4.4f,		%4.4f,		%4.4f\n', C1, C2, C3);
	
end

figure
graph1 = ezplot(R(1));
set(graph1,'LineWidth',2);
grid on;
xlabel('tay');
ylabel('R2(tay)')

figure
graph2 = ezplot(R(2));
set(graph2,'LineWidth',2);
grid on;
xlabel('tay');
ylabel('R2(tay)')

figure
graph3 = ezplot(R(3));
set(graph3,'LineWidth',2);
grid on;
xlabel('tay');
ylabel('R2(tay)')