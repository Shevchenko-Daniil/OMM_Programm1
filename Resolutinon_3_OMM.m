% задаем двумерную сетку
N_t = 2000;                     % количество точек по времени
N_x = 2000;                     % количество точек по x
epsilon = 0.001;                % точность для метода Ньютона
h = 1/(N_x - 1);                % шаг по x
tau = 5/(N_t - 1);             % шаг по времени
x=(-1:h:0);                     % сетка по x
t = 0:tau:5;                   % сетка по времени
ksi = (0:h:1);

% задаем массив для неизвестной функции
u = zeros(N_x, N_t);
u(1, :) = 1 + 0.5*atan(t);    % граничное условие
u(:, 1) = cos(0.5*pi*ksi);        % начальное условие


for i = 2:N_x
   for j = 2:N_t
   u(i, j) = newton(u(i, j-1), u(i-1, j), epsilon, tau, h);
   end
end


figure(30)
    surf(-ksi, t, u, EdgeColor='none');
    xlabel('x', 'FontSize',16)
    ylabel('t', 'FontSize',16)
    zlabel('u', 'FontSize',16)
    colorbar;
    grid on
    
%2D графики
figure(31)
    plot(-ksi, u(:, 1000), 'LineWidth', 2)
    xlim([-1 0])
    grid on
    xlabel('x', 'FontSize',16)
    ylabel('t', 'FontSize',16)
    set(findall(figure(31),'type','axes'),'fontsize',15)
    
    
    

function U = U_func(x)
% Функция, стоящая под знаком частной производной по x
    U = atan(2*x + 1 + sin(x));
end

function DU = DU_func(x)
% производная функции U
    DU = (2 + cos(x))/(1 + (2*x + 1 + sin(x))^2);
end

function f = f_func(x, a, b, tau, h)
    f = (x - a)/tau + (U_func(x) - U_func(b))/h;
end

function Df = Df_func(x, tau, h)
    Df = 1/(tau) + DU_func(x)/(h);
end

function n = newton(a, b, epsilon, tau, h)
    n = b;
    du = epsilon + 1;
    while du > epsilon
        u = n;
        n = u - f_func(u, a, b, tau, h)/Df_func(u, tau, h);
        du = abs(u - n);
    end
end
