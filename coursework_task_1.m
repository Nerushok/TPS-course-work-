%x =[-0.4210 -1.0230 -0.4290 -1.5930 -1.0640 -0.0310 -1.8570 1.9110 -1.8480 1.3410 -0.0190 -0.1970 -1.1130 -0.2100 -1.4540 0.8530 -0.3890 0.0070 -0.9540 0.7560 0.3940 1.2750 -1.0790 -1.1460 0.2730 0.3670 -0.8260 0.4790 0.6870 0.0640];

% Task №1

clc; clear all; close all;

m = input('Enter mathematic expaction: ');
sigm = 1;
T = [1:30];

Xmin = m - 3*sigm;
Xmax = m + 3*sigm;

xA1 = [-3 -2]; 
xA2 = [-2 0]; 
xA3 = [0 1]; 
XA = [xA1, xA2, xA3]; 

yA1 = -(xA1 + 2); 
yA2 = 0 .* xA2; 
yA3 = -xA3; 
YA = [yA1, yA2, yA3]; 


xRandom =[-0.4210 -1.0230 -0.4290 -1.5930 -1.0640 -0.0310 -1.8570 1.9110 -1.8480 1.3410 -0.0190 -0.1970 -1.1130 -0.2100 -1.4540 0.8530 -0.3890 0.0070 -0.9540 0.7560 0.3940 1.2750 -1.0790 -1.1460 0.2730 0.3670 -0.8260 0.4790 0.6870 0.0640];
xInput = xRandom * sigm + m;

yOutput = [];
for i = 1:length(xInput)
    x = xInput(i);
    if x < -2
    	y = -(x + 2);
    elseif x >= -2 && x<= 0;
		y = 0 .* x;
	else
		y = -x;
    end
    yOutput = [yOutput y];
end



maxXaxis = m + 3;
minXaxis = m - 3;

subplot(2,2,1);
plot(XA, YA, 'g', 'LineWidth', 2);
axis([Xmin - 0.5 , Xmax + 0.5, -1, 1]);
xlabel('x');
ylabel('y = G(x)');
grid on;
hold on;
plot([Xmax Xmax], [-1 1], 'r');
plot([Xmin Xmin], [-1 1], 'r');

subplot(2,2,3);
plot(xInput, T, '-o');
axis([minXaxis - 0.5, maxXaxis + 0.5, 0, 30]);
xlabel('Xk(t)');
ylabel('t');
grid on;
hold on;
plot([Xmax Xmax], [0 30], 'r');
plot([Xmin Xmin], [0 30], 'r');

subplot(2,2,2);
plot(T, yOutput, '-o');
axis([0, 30, -3, 3]);
xlabel('Yk(t)');
ylabel('t');
grid on;

