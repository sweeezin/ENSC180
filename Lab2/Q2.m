% ENSC180 Lab 2-Q2:
% Using vector operations to speed up the code.
% Fiona Jin, 301612323, fja20@sfu.ca 1/23/25


X = 1:10;

Y = randn(1, 10);

for i = 2:5
    Y(i, :) = Y(i-1, :) + 1;  % Add 1 to the previous row
end
disp(Y);

figure;
hold on;

plot(X, Y(5, :), 'r-o', 'LineWidth', 2); 
plot(X, Y(2, :), 'b--s', 'LineWidth', 1.5);  
plot(X, Y(3, :), 'g:.', 'LineWidth', 1);  
plot(X, Y(4, :), 'm-^', 'LineWidth', 1);    
plot(X, Y(1, :), 'k-+', 'LineWidth', 1);

xlabel('Bits/Pixel (BPP)');
ylabel('MSE');

grid on;

legend({'1', '2', '3', '4', '5'}, 'Location', 'best');

hold off;
