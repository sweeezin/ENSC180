%%Fiona Jin 301612323 fja20@sfu.ca

%% part 1
clc; clear;
n_values = 2:5;
k_values = 0:max(n_values);

results = [];
for n = n_values
    for k = 0:n
        Cnk = nchoosek(n, k);  % combination
        Pnk = factorial(n) / factorial(n-k);  % permutation
        results = [results; n, k, Cnk, Pnk];
    end
end

% display results in table format
tbl = array2table(results, 'VariableNames', {'n', 'k', 'C(n,k)', 'P(n,k)'});
disp(tbl);

%% Part 2

total = nchoosek(49, 6);
p_match6 = 1 / total;
p_match5 = nchoosek(6,5) * nchoosek(43,1) / total;
p_match4 = nchoosek(6,4) * nchoosek(43,2) / total;

% Display results using sprintf
fprintf('Total: %d\n', total);
fprintf('Probability of matching all 6 numbers: %.12f\n', p_match6);
fprintf('Probability of matching 5 numbers: %.12f\n', p_match5);
fprintf('Probability of matching 4 numbers: %.12f\n', p_match4);

%% Part 3
grades = [...
    56 64 42 56 40 50 44 56 66 70, ...
    48 63 36 94 47 32 54 69 80 50, ...
    19 79 60 96 53 74 37 69 66 85, ...
    65 41 43 46 28 73 61 78 51 47, ...
    54 62 72 19 83 35 39];

% plot
figure;
histogram(grades, 'BinWidth', 5);
title('Histogram of Exam Grades');
xlabel('Grade');
ylabel('Frequency');

% mean and std
mean_grade = mean(grades);
std_grade = std(grades, 1);
fprintf('Mean: %.2f, Standard Deviation: %.2f\n', mean_grade, std_grade);

% Compute probabilities within 1, 2, 3 std deviations
within_std = [sum(abs(grades - mean_grade) <= 1*std_grade), ...
              sum(abs(grades - mean_grade) <= 2*std_grade), ...
              sum(abs(grades - mean_grade) <= 3*std_grade)] / length(grades);
within_std

% probalities calculation
z_vals = [1, 2, 3];
norm_probs = 2 * normcdf(z_vals) - 1;
norm_probs

% absolute error
abs_error = abs(within_std - norm_probs);
abs_error
