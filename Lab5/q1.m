%%Fiona Jin

% data definition
num_students = 246;
mean_score = 62.38;
std_dev = 18.88;

% grade range and actual counts
ranges = [90, 100; 80, 89; 70, 79; 60, 69; 50, 59; 40, 49; 30, 39; 0, 29];
actual_counts = [19, 31, 43, 46, 46, 28, 24, 9];

% estimate
estimated_counts = zeros(size(actual_counts));
for i = 1:size(ranges, 1)
    lower = ranges(i, 1);
    upper = ranges(i, 2);
    prob = normcdf(upper, mean_score, std_dev) - normcdf(lower, mean_score, std_dev);
    estimated_counts(i) = round(prob * num_students);
end

% actual vs estimated plot
x_labels = {'90-100', '80-89', '70-79', '60-69', '50-59', '40-49', '30-39', '<30'};
x = 1:length(actual_counts);
width = 0.4;

bar(x - width/2, actual_counts, width, 'b');
hold on;
bar(x + width/2, estimated_counts, width, 'r');
hold off;

xlabel('score range');
ylabel('students');
set(gca, 'XTick', x, 'XTickLabel', x_labels);
legend('actual', 'estimated');
title('actual vs estimated');