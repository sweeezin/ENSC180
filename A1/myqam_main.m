function myqam_main()
    % Define noise levels
    noiselevels = [0.3, 0.4, 0.6, 0.8, 1.0];
    err_rates = zeros(1, length(noiselevels));

    % Create a single figure window
    figure;

    % Loop through each noise level and create subplots
    for i = 1:length(noiselevels)
       
        ax = subplot(2, 3, i); 

        % Call myqam for each noise level and pass the subplot handle
        err_rates(i) = myqam(1000, noiselevels(i), ax);
    end

    % Add a final subplot for the noise level vs error rate plot
    ax = subplot(2, 3, 6); % Last position in the 2x3 grid
    plot(ax, noiselevels, err_rates, '-o');
    xlabel('Noise Level');
    ylabel('Error Rate');
    title('Noise Level vs Error Rate');

    % Display error rates
    disp('Error rates for different noise levels:');
    disp(err_rates);
end