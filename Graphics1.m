clear;
x = [-10:0.5:10];
y1 = abs(x);
figure
h1 = plot(x,y1,'r')    
grid on     
axis([-10 10 -8 12])      
hold on
y2 = tan(x);
h2 = plot(x,y2,'k') 

y3 = nthroot(x, 5)
h3 = plot(x, y3, 'b')
legend('$\mid x \mid$', '$tan(x)$','$\sqrt[5]{x}$','Interpreter','latex'); %writing a legend
title '|x|,  tan(x),  and x^{0.2} functions'
xlabel 'x' % axes
ylabel 'y'

saveas(gcf,'myplot.fig') % saving graph to existing folder

%%
clear;
theta = linspace(0, 2*pi, 360);
r = 4;
polarplot(theta, r+zeros(size(theta)), 'r--')
%%
t = [1:1:100];
xt = @(t) t;
zt = @(t) sin(t);
yt = @(t) cos(t);
fplot3(xt,yt,zt, [1, 100])
%%

x = [0:0.01:8];
y1 = x.^2;
y2 = x.^3;
figure
h1 = plot(x,y1, 'b',x, y2, 'r', 'linewidth', 2.5)    
grid on     
axis([0 8 -0.1 50])

legend('$x^2 $', '$x^3$', 'Interpreter','latex'); %writing a legend
title 'x^2 and  x^3 functions'
xlabel 'x' % axes
ylabel 'y'

x1 = 5;
xline(x1,'--m','x = 5', 'DisplayName','$x^3 - x^2 > 100$', 'linewidth', 1.5);
saveas(gcf,'firstplot.png')
saveas(gcf,'firstplot.pdf')

x = [0:0.01:x1];
y1 = x.^2;
y2 = x.^3;
figure
h1 = plot(x,y1, 'b',x, y2, 'r', 'linewidth', 2.5) 

grid on     
axis([0 x1 -0.1 50])
xline(x1,'--m','x = 5','linewidth', 1.5);
legend('$x^2 $', '$x^3$', 'Interpreter','latex'); %writing a legend
title 'x^2 and  x^3 functions'

xlabel 'x' % axes
ylabel 'y'

saveas(gcf,'secondplot.png')
saveas(gcf,'secondplot.pdf')

x = [x1:0.01:8];
y1 = x.^2;
y2 = x.^3;
figure
h1 = plot(x,y1, 'b',x, y2, 'r', 'linewidth', 2.5) 
xline(x1,'--m','x = 5', 'linewidth', 1.5);
grid on     
axis([x1 10 -0.1 50])

legend('$x^2 $', '$x^3$', 'Interpreter','latex'); %writing a legend
title 'x^2 and  x^3 functions'
xlabel 'x' % axes
ylabel 'y'

saveas(gcf,'thirdplot.png')
saveas(gcf,'thirdplot.pdf')


