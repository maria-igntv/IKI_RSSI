clear
n = input('Enter a positive integer in the range 3 to 6: ');
switch n
    case  {3, 4, 5, 6}
    otherwise
        disp('Number is out of the range.') % but code executes anyway 
end

x = [1:0.001:10];
A = zeros(1, n);
B = zeros(1, n);
C = zeros(1, n);
D = zeros(1, n);

for i = 1:1:n
    a = rand;
    b = rand;
    c = rand;
    d = rand;
    y = a + b*sin(x) + c*(sin(x)).^2 + d*(sin(x)).^3;
    A(1, i) = a;
    B(1, i) = b;
    C(1, i) = c;
    D(1, i)= d;
    hold on
    plot(x, y, 'LineWidth', 1)
    grid on
end  
xlabel ('$x$', 'Interpreter','latex')
ylabel ('$y_{i}$','Interpreter','latex')
legend('$a_{i} + b_{i} \cdot sin(x) + c_{i} \cdot {sin(x)}^2 + d_{i} \cdot {sin(x)}^3$ ','Interpreter','latex');
title (num2str(n), 'functions')

sum = 0;
for m = 1:1:(n-1)
    y1 = A(1, m) + B(1, m)*sin(x) + C(1, m)*(sin(x)).^2 + D(1, m)*(sin(x)).^3 ;
    for i = (m+1):1:n
        y2 = A(1, i) + B(1, i)*sin(x) + C(1, i)*(sin(x)).^2 + D(1, i)*(sin(x)).^3;
        yi = (y1 - y2); 
        %hold on
        %plot(x, yi)
        %grid on
        
        % ИДЕЯ РЕШЕНИЯ ЗАДАЧИ
        % yi - разность 2х функций yk и ym, k <> m (те у1-у2, у1-у3,...у1-yn, y2-y3 и тд)
        % Дабы не связываться с интеравлами, беру и просто смотрю на знак
        % модуля функции yi, если две соседние точки имеют разный знак,
        % тогда точка (по-сути) не важно какая, и есть точка пересечения
        % функций из yi.
        % Так рассматриваю разность y1 со 2, 3 ... n ф-ми, потом разность 2
        % с 3 ... n и т.д. Разность пстроила (см. строчки 41-43) все
        % считалось очень и очень хорошо.
        
        k = 0;
        for j = 2:1:9000
            if ((yi(1, j-1) > 0) & (yi(1, j) < 0)) | ((yi(1, j-1) < 0) & (yi(1, j) > 0))
                k = k+1;
                xcoord = 1+0.01*j;
            end
        end
       % k вывод количества точек пересечения m-й функции с i-й
        sum = sum + k;
    end
end
 X = ['Number of intersections ', num2str(sum)];
 disp(X)
%%
% Hyperboilic Paraboloid
clear
[X,Y] = meshgrid(-2:0.1:2);
p = 1;
q = 1;
Z = X.^2/p^2 - Y.^2/q^2;
subplot(2, 1, 1)
surf(X,Y,Z,'FaceColor',"none")
xlabel('x'); ylabel('y'); zlabel('z')
title('Hyperbolic Paraboloid')

subplot(2, 1, 2)
C = X.*Y;
s = surf(X,Y,Z,'FaceAlpha',1);
s.EdgeColor = 'none';
colorbar
xlabel('x'); ylabel('y'); zlabel('z')
title('Hyperbolic Paraboloid')

% contour(X,Y,Z) задает координаты x и y для z, что-то для 3d сработаться с
% subplot3 (....) не получилось