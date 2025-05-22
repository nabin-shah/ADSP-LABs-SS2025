% MATLAB Code Snippet for GBWP Check
GBWP = 8e6; % Hz (Gain-Bandwidth Product for OP27)
Q_filter = 5; % Q factor of your filter

f = logspace(2, 7, 500); % Frequency vector from 100 Hz to 10 MHz
A_OL = GBWP ./ f;    % Open-loop gain approximation

Margin_10Q = 10 * Q_filter;
Margin_20Q = 20 * Q_filter;

f_limit_10Q = GBWP / Margin_10Q;
f_limit_20Q = GBWP / Margin_20Q;

fprintf('Upper frequency for A_OL >= 10*Q (%.0f) is approx. %.1f kHz\n', Margin_10Q, f_limit_10Q/1000);
fprintf('Upper frequency for A_OL >= 20*Q (%.0f) is approx. %.1f kHz\n', Margin_20Q, f_limit_20Q/1000);

figure;
loglog(f, A_OL, 'b', 'LineWidth', 1.5, 'DisplayName', 'OP27 A_{OL}(f) (approx.)');
hold on;
line([f(1) f(end)], [Margin_10Q Margin_10Q], 'Color', 'r', 'LineStyle', '--', 'DisplayName', sprintf('A_{OL} = 10*Q = %.0f', Margin_10Q));
line([f(1) f(end)], [Margin_20Q Margin_20Q], 'Color', 'g', 'LineStyle', '--', 'DisplayName', sprintf('A_{OL} = 20*Q = %.0f', Margin_20Q));
xlabel('Frequency (Hz)');
ylabel('Open-Loop Gain');
title('OP27 Open-Loop Gain vs. Ideal Behavior Thresholds');
legend('show', 'Location', 'southwest');
grid on;
ylim([1, 1e5]); % Adjust Y-axis for better visualization if needed
xlim([1e2, 1e7]);

% Mark calculated limits
plot([f_limit_10Q f_limit_10Q], get(gca,'YLim'), 'r:', 'HandleVisibility','off');
text(f_limit_10Q*0.9, Margin_10Q*1.5, sprintf('%.0f kHz', f_limit_10Q/1000), 'Color', 'r', 'HorizontalAlignment', 'right');
plot([f_limit_20Q f_limit_20Q], get(gca,'YLim'), 'g:', 'HandleVisibility','off');
text(f_limit_20Q*0.9, Margin_20Q*1.5, sprintf('%.0f kHz', f_limit_20Q/1000), 'Color', 'g', 'HorizontalAlignment', 'right');