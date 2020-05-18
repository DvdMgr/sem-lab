% Load results from the file
load('results.mat');
results = squeeze(cell2mat(cellfun(@(s) s.stdout, results, 'uni', 0)));

% Plot 95% confidence interval
figure;
mean_throughput = mean(results, 3);
std_throughput = std(results, 0, 3);
errorbar(repmat([10, 20, 40, 60].', 1, 3), ...
         mean_throughput, ...
         1.96 * std_throughput / sqrt(size(results)(3)));
legend('MCS 0', 'MCS 3', 'MCS 6');
xlabel('Distance [m]')
ylabel('Throughput [Mbps]')