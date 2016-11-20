% Task №2

clc; clear all; close all;

%m = input('Enter mathematic expaction: ');
m = [-2 -1 1];
sigm = 1;


% Distribution function for input signal
%xRandom = [-0.4210 -1.0230 -0.4290 -1.5930 -1.0640 -0.0310 -1.8570 1.9110 -1.8480 1.3410 -0.0190 -0.1970 -1.1130 -0.2100 -1.4540 0.8530 -0.3890 0.0070 -0.9540 0.7560 0.3940 1.2750 -1.0790 -1.1460 0.2730 0.3670 -0.8260 0.4790 0.6870 0.0640];
xRandom = -4:0.005:4;
xInput1 = xRandom * sigm + m(1);
xInput2 = xRandom * sigm + m(2);
xInput3 = xRandom * sigm + m(3);
xInput = [xInput1; xInput2; xInput3];

F1y = [];
for i = 1:length(m);
	f1y = [];
	for j = 1:length(xInput(i,:));
		xin = xInput(i,j);
		mathExpac = m(i);
		inputLapFun = ((xin-mathExpac)/sigm);
		f=0.5+lapfun(inputLapFun);
		f1y = [f1y f];
	end
	F1y = [F1y; f1y];
end

figure
plot(xInput1, F1y(1,:), '-', 'LineWidth', 2);
hold on;
plot(xInput2, F1y(2,:), '--', 'LineWidth', 2);
plot(xInput3, F1y(3,:), '-.', 'LineWidth', 2);
grid on;
axis([m(1) - 3 , m(3) + 3, 0, 1.1]);
xlabel('y');
ylabel('F2(y)');
legend('m = -2', 'm = -1', 'm = 1');




% Distribution function for output signal
yOutput = [];
for i = 1: length(m)
	yOut = [];
	for j = 1:length(xInput)
    	x = xInput(i,j);
    	if x <= -2
    		y = -(x + 2);
    	elseif x > -2 && x< 0;
			y = 0 .* x;
		else
			y = -x;
    	end
    	yOut = [yOut y];
	end
	yOutput = [yOutput; yOut];
end


% Reverse matrix yOutput
Y1 = fliplr(yOutput(1,:));
Y2 = fliplr(yOutput(2,:));
Y3 = fliplr(yOutput(3,:));
Y = [Y1; Y2; Y3];
yOutput = Y;


F2toZero1 = [];
F2toZero2 = [];
F2toZero3 = [];
F2afterZero1 = [];
F2afterZero2 = [];
F2afterZero3 = [];
for i = 1:length(m)
	toZero = [];
	afterZero = [];
	for j = 1:length(yOutput)
		y = yOutput(i,j);
		if y <= 0
    		out = 1 - 0.5 - lapfun((-y-m(i))/sigm);
    		toZero = [toZero out];
    	else
    		out = 1 - 0.5 - lapfun((-y-2-m(i))/sigm);
    		afterZero = [afterZero out];
    	end
	end

	switch m(i)
    	case m(1)
    		F2toZero1 = [F2toZero1 toZero];
    		F2afterZero1 = [F2afterZero1 afterZero];
    	case m(2)
    		F2toZero2 = [F2toZero2 toZero];
    		F2afterZero2 = [F2afterZero2 afterZero];
    	case m(3)
    		F2toZero3 = [F2toZero3 toZero];
    		F2afterZero3 = [F2afterZero3 afterZero];
    end
end


figure
hold on;
grid on;
yToZero1 = yOutput(1,1:length(F2toZero1));
yAfterZero1 = yOutput(1,length(F2toZero1)+1:length(yOutput(1,:)));
plot(yToZero1, F2toZero1, 'LineWidth', 2);
plot(yAfterZero1, F2afterZero1, 'LineWidth', 2);
plot([0 0], [F2toZero1(1,end) F2afterZero1(1,1)], '--');
xlabel('y');
ylabel('F2(y)');
legend('m = -2')

figure
hold on;
grid on;
yToZero2 = yOutput(2,1:length(F2toZero2));
yAfterZero2 = yOutput(2,length(F2toZero2)+1:length(yOutput(2,:)));
plot(yToZero2, F2toZero2, 'LineWidth', 2);
plot(yAfterZero2, F2afterZero2, 'LineWidth', 2);
plot([0 0], [F2toZero2(1,end) F2afterZero2(1,1)], '--');
xlabel('y');
ylabel('F2(y)');
legend('m = -1')

figure
hold on;
grid on;
yToZero3 = yOutput(3,1:length(F2toZero3));
yAfterZero3 = yOutput(3,length(F2toZero3)+1:length(yOutput(3,:)));
plot(yToZero3, F2toZero3, 'LineWidth', 2);
plot(yAfterZero3, F2afterZero3, 'LineWidth', 2);
plot([0 0], [F2toZero3(1,end) F2afterZero3(1,1)], '--');
xlabel('y');
ylabel('F2(y)');
legend('m = 1')



axis([m(1) - 3 , m(3) + 3, 0, 1.1]);

