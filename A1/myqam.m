function err_rate = myqam(lth, noiselevel, ax)
    % err_rate = myqam(lth, noiselevel, ax):
    % lth:          Number of symbols.
    % noiselevel:   Noise level.
    % ax:           Subplot axes handle.
    % err_rate:     Error rate.

    % Create transmitted data
    tx = zeros(2, lth);
    tx(1, :) = randsample([1, -1], lth, true); % true: sample with replacement
    tx(2, :) = randsample([1, -1], lth, true);

    % Create received data after adding noise
    rx = tx + noiselevel * randn(2, lth);

    % Define colors for each group
    colors = ['r', 'g', 'b', 'k']; % Red, Green, Blue, Black

    % Initialize error count
    E = 0;

    % Plot the received symbols in the provided subplot
    axes(ax); % Set the current axes to the provided subplot
    hold on;
    for i = 1:4
        % Determine the original symbol group
        if i == 1
            idx = tx(1, :) == 1 & tx(2, :) == 1; % (1, 1)
        elseif i == 2
            idx = tx(1, :) == 1 & tx(2, :) == -1; % (1, -1)
        elseif i == 3
            idx = tx(1, :) == -1 & tx(2, :) == -1; % (-1, -1)
        elseif i == 4
            idx = tx(1, :) == -1 & tx(2, :) == 1; % (-1, 1)
        end

        % Extract the corresponding received symbols
        rx_group = rx(:, idx);

        % Plot the received symbols
        scatter(rx_group(1, :), rx_group(2, :), [], colors(i));

        % Find decoding errors
        if i == 1
            errors = rx_group(1, :) < 0 | rx_group(2, :) < 0; % (1, 1) -> (x < 0 or y < 0)
        elseif i == 2
            errors = rx_group(1, :) < 0 | rx_group(2, :) > 0; % (1, -1) -> (x < 0 or y > 0)
        elseif i == 3
            errors = rx_group(1, :) > 0 | rx_group(2, :) > 0; % (-1, -1) -> (x > 0 or y > 0)
        elseif i == 4
            errors = rx_group(1, :) > 0 | rx_group(2, :) < 0; % (-1, 1) -> (x > 0 or y < 0)
        end

        % Highlight decoding errors
        scatter(rx_group(1, errors), rx_group(2, errors), [], colors(i), 'filled');

        % Count errors
        E = E + sum(errors);
    end

    % Add x and y axes
    xline(0, 'k--');
    yline(0, 'k--');

    % Calculate error rate
    err_rate = E / lth;

    % Display error rate for the current noise level
    disp(['Error rate for noise level ', num2str(noiselevel), ': ', num2str(err_rate)]);

    % Add title to the subplot
    title(['Noise Level: ', num2str(noiselevel), ', Error Rate: ', num2str(err_rate)]);
end