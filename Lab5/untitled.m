% generate 
rng("default");
x = (1:10)';
y = 1.5 * x + 3 + randn(10, 1);

% scatter plot
figure;
scatter(x, y, 'b', 'filled');
hold on;

% make maticx
A = [x ones(size(x))];
params = A \ y;
a = params(1);
b = params(2);

% plot
x_fit = linspace(min(x), max(x), 100)';
y_fit = a * x_fit + b;
plot(x_fit, y_fit, 'r', 'LineWidth', 2);

xlabel('x');
ylabel('y');
title('Least Squares Fit');
legend('points', 'line');
grid on;
hold off;

disp(['Optimal a: ', num2str(a)]);
disp(['Optimal b: ', num2str(b)]);