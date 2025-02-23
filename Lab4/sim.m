
function sim(M, N, p)
    rng('default'); 
    
    % make matrix
    bernoulli_trials = rand(N, M) < p;
    
    % define x
    X = sum(bernoulli_trials, 1);
    
    % grpah
    edges = -0.5:1:N+0.5;
    h = histogram(X, edges, 'Normalization', 'probability');
    title('Estimated Probability Distribution');
    xlabel('Number of Successes');
    ylabel('Estimated Probability');
    
    % probablities
    estimated_probs = h.Values
    
    % probablities
    Tprob = bino_pk(N, p);
    Tprob
    
    % avg
    avg_abs_error = mean(abs(estimated_probs - Tprob));
    fprintf('Average Absolute Error: %.6f\n', avg_abs_error);
    
    % estimation
    figure;
    bar(0:N, [estimated_probs; Tprob]');
    title('Comparison of Estimated and Theoretical Probabilities');
    xlabel('Number of Successes');
    ylabel('Probability');
    legend('Estimated', 'Theoretical');
    set(gca, 'XTick', 0:N);
end

