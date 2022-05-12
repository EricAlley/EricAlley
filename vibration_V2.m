clc;
clear all;
E = input('Enter the amount numbers of w1 & w2: ');
e = E/2;
W = zeros(2,e);
A = zeros(1,e);
clock = input('Enter the time period of the vibration (s):');
T = clock*100;
Xmatrix = zeros(3,T+1);
%input w1, w2, amplitude for each case
for i = 1:e
     W(1,i) = input('Enter the w1: ');
     W(2,i) = input('Enter the w2: ');
     A(1,i) = input('Enter the amplitude corresponds to w1, w2: ');
    if W(2,i)>W(1,i)
        blank = W(1,i);
        W(1,i) = W(2,i);
        W(2,i) = blank;
    end
end
%parameter determining for each case
for i = 1:e
    a = A(1,i);
    w1 = W(1,i);
    w2 = W(2,i);
    %calculate displacement respects to time
    for j = 0:T
        alpha = 0.01*j;
        y1 = a*cos(((w1 - w2)/2)*alpha)*cos(((w1 + w2)/2)*alpha);
        y2 = a*sin(((w1 - w2)/2)*alpha)*sin(((w1 + w2)/2)*alpha);
        Xmatrix(1,j+1) = alpha;
        Xmatrix(2,j+1) = y1;
        Xmatrix(3,j+1) = y2;
    end
    %Plotting
    X = Xmatrix(1,:);
    Y1 = Xmatrix(2,:);
    Y2 = Xmatrix(3,:);
    figure
    plot(X,Y1,X,Y2)
    set(gca,'fontname','Times new roman');
    title(sprintf('Time-Displacement Diagram (%dcm)',a*100));
    ylabel('Displacement (m)');
    xlabel('Time (s)');
    legend('Left Slider','Right Slider','fontname','Times new roman')
    hold on
end
