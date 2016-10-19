clear all; clc; close all;

m = input('Enter mathematic expaction: ');
omega = input('Enter omaga: ');

T = [0:1:30];
Xmin = m - 3*omega;
Xmax = m + 3*omega;

delta = 0.1;
xA1 = -3:delta:-2; 
xA2 = -2:delta:0; 
xA3 = 0:delta:1; 
XA = [xA1, xA2, xA3]; 

yA1 = -(xA1 + 2); 
yA2 = 0 .* xA2; 
yA3 = -xA3; 
YA = [yA1, yA2, yA3]; 

xRandom = rand(31,1).*4 - 2;
xInput = xRandom * omega + m;

yOutput = [];
for i = 1:31
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


% Graphics building
maxXaxis = m + 3;
minXaxis = m - 3;

subplot(2,2,1);
plot(XA, YA, 'g', 'LineWidth', 2);
axis([Xmin - 0.5 , Xmax + 0.5, -1, 1]);
xlabel('x');
ylabel('y = G(x)');
grid on;
hold on;
plot([Xmax,Xmax,Xmax,Xmax,Xmax], -1:0.5:1, 'r');
plot([Xmin,Xmin,Xmin,Xmin,Xmin], -1:0.5:1, 'r');

subplot(2,2,3);
plot(xInput, T, '-o');
axis([minXaxis, maxXaxis, 0, 30]);
xlabel('Xk(t)');
ylabel('t');
grid on;
hold on;
plot([Xmax,Xmax,Xmax,Xmax,Xmax], -1:0.5:1, 'r');
plot([Xmin,Xmin,Xmin,Xmin,Xmin], -1:0.5:1, 'r');

subplot(2,2,2);
plot(T, yOutput, '-o');
axis([0, 30, -3, 3]);
xlabel('Yk(t)');
ylabel('t');
grid on;