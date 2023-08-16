%% t0 = 0
x0 = -1:0.1:0;
N = 100;
x = linspace(-1, 0, N);

t = zeros(N, max(size(x0)));
for k=1:max(size(x0))
    u0(k) = cos(pi*x0(k)/2);
    t(:, k) = -( 1 + (2*u0(k) + 1 + sin(u0(k)))^2 )*(x - x0(k))./(2 + cos(u0(k)));
end

figure(1)
    plot(x, t(:, 1), x, t(:, 2), x, t(:, 3), x, t(:, 4), x, t(:, 5), x, t(:, 6), x, t(:, 7), x, t(:, 8), x, t(:, 9), x, t(:, 10), x, t(:, 11), 'LineWidth',2)
    legend('x_{0} = -1', 'x_{0} = -0.9', 'x_{0} = -0.8', 'x_{0} = -0.7', 'x_{0} = -0.6', 'x_{0} = -0.5', 'x_{0} = -0.4', 'x_{0} = -0.3', 'x_{0} = -0.2', 'x_{0} = -0.1', 'x_{0} = 0', 'FontSize', 16)
    ylim([0 7])
    %title('Проекции характеристик при t_{0} = 0', 'FontSize',16)
    ylabel('t', 'FontSize',16)
    xlabel('x', 'FontSize',16)
    set(findall(figure(1),'type','axes'),'fontsize',15)
    
%% x0 = 0
t0 = 0:0.5:5;
N = 100;
t = linspace(0, 5, N);

x = zeros(N, max(size(t0)));
for k=1:max(size(t0))
    u0(k) = 1 + 0.5*atan(t0(k));
    x(:, k) = -(2 + cos(u0(k)))*(t - t0(k))./( 1 + (2*u0(k) + 1 + sin(u0(k)))^2 );
end

figure(2)
    plot(x(:, 1), t, x(:, 2), t, x(:, 3), t, x(:, 4), t, x(:, 5), t, x(:, 6), t, x(:, 7), t, x(:, 8), t, x(:, 9), t, x(:, 10), t, x(:, 11), t, 'LineWidth',2)
    legend('t_{0} = 0', 't_{0} = 0.5', 't_{0} = 1', 't_{0} = 1.5', 't_{0} = 2', 't_{0} = 2.5', 't_{0} = 3', 't_{0} = 3.5', 't_{0} = 4', 't_{0} = 4.5', 't_{0} = 5', 'Location','northwest', 'FontSize', 16)
    ylim([0 5])
    xlim([-0.35 0])
    %title('Проекции характеристик при x_{0} = 0', 'FontSize',16)
    ylabel('t', 'FontSize',16)
    xlabel('x', 'FontSize',16)
    set(findall(figure(2),'type','axes'),'fontsize',15)



