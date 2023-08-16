N = 1000;
du = 1/(N-1);
u_1 = 0:du:1;
u_2 = 1:du:2;
x = linspace(-1, 0, N);
u = cos(pi*x./2);

%% когда t!=0
t = 1;
x_1 = -t.*((2+cos(u_1))./(1+(2*u_1 + 1 + sin(u_1)).^2)) - 2.*acos(u_1)./pi; % здесь минус перед acos потому что мы учитываем знак x, а косинус четная функция
%x_test = -t.*((2+cos(u_1))/(1+(2*u_1 + 1 + sin(u_1)).^2)) + 2*acos(u_1)/pi;
figure(1)
    plot(x_1, u_1)
    %xlim([-1 0])
    
x_2 = ((2+cos(u_2)).*(tan(2.*u_2 - 2) - t))./(1+(2.*u_2 + 1 + sin(u_2)).^2);

x_1_2 = zeros(1 ,2*N-1);
x_1_2(1:N-1) = x_1(1:N-1);
x_1_2(N:end) = x_2;
u_1_2 = zeros(1, 2*N-1);
u_1_2(1:N-1) = u_1(1:N-1);
u_1_2(N:end) = u_2;

figure(2)
    plot(x_2, u_2)
    xlim([-1 0])
    
figure(3)
    plot(x_1, u_1, x_2, u_2)
    xlim([-1 0])
    ylim([0 1.6])
    
figure(4)
    plot(x_1_2, u_1_2, 'LineWidth',2)
    xlim([-1 0])
    ylim([0 1.6])
    grid on
    xlabel('x', 'FontSize',16)
    ylabel('u', 'FontSize',16)
    set(findall(figure(4),'type','axes'),'fontsize',15)



 %% когда t = 0

 x_3 = -2*acos(u_1)./pi;
 x_4 = ((2 + cos(u_2)).*tan(2.*u_2 - 2))./(1 + (2.*u_2 + 1 + sin(u_2)).^2);
 
 figure(5)
    plot(x_3, u_1, x_4, u_2, 'LineWidth',2)
    xlabel('x', 'FontSize',16)
    ylabel('u', 'FontSize',16)
    grid on
    xlim([-1 0])
    ylim([0 1.6])
    set(findall(figure(5),'type','axes'),'fontsize',15)

    
 