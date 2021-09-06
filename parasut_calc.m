clear;
close all;
clc;

dx = 1/100;

b = 34.8;
a = 43.5;

x = 0:dx:a;

y = [];
y_t = [];
area = 0;
l = 0;
l_uzun = [];
%grafik
for t = 1 : length(x)
    calc = sqrt(b^2 - ((x(t)^2 * b^2) / a^2));
    y = [y calc];
    area = area + calc/dx;
end

for t = 1 : length(x) - 1
   out = (y(t + 1) - y(t)) / dx;
   y_t = [y_t out];
end

for t = 1 : length(y_t)
   l = l + sqrt(1 + y_t(t)^2);
   l_uzun = [l_uzun l/(1/dx)];
end

l_uzun = l_uzun(end) - l_uzun;
l_uzun = [l/(1/dx) l_uzun];
uzunluk = l/ (1/dx);

parca_list = (2*pi*x)/16;

output_matrix = [parca_list;l_uzun;zeros(1,length(x))]'.*10;
%csvwrite('parasut.csv', output_matrix);
figure;
plot(parca_list, l_uzun);
xlim([0 l_uzun(1)]);
ylim([0 l_uzun(1)]);
title('Parasut dilim kesit');

figure;
plot(x, y);
title('Parasut ceyrek');