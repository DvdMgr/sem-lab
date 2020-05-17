% Load results from the file
load('results.mat');
results = squeeze(cell2mat(cellfun(@(s) s.stdout, results, 'uni', 0)));

% Select how many runs to keep
runs = 3;
results = results(:, :, 1:runs);

% Only plot the mean
figure;
mean_throughput = mean(results, 3);
plot([1, 20, 40, 60], mean_throughput);

% Plot 95% confidence interval
figure;
std_throughput = std(results, 0, 3);
errorbar(mean_throughput, 1.96 * std_throughput / sqrt(runs));