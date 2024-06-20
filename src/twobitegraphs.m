clear
clc

% Darian Irani
% 26 Nov 2022

% %% flat plate plot
% 
% Instron_FINAL_data = readtable('MATLABvalues', 'Sheet', 'Zelin');
% 
% x = Instron_FINAL_data.Time;
% 
% y = Instron_FINAL_data.Force;
% 
% figure % 0 deg
% plot(x,y, 'LineWidth', 2);
% xlabel('Time (s)', 'Fontsize', 14);
% ylabel('Force (N)','Fontsize', 14);
% xlim([0, 6]);
% ylim([0, 1500]);
% set(gca, 'FontSize', 16);
% yline(0);
% 
% figure % 25 deg
% plot(x,y2, 'LineWidth', 2);
% xlabel('Time (s)');
% ylabel('Force (N)');
% figure % 29.1 deg
% plot(x,y3, 'LineWidth', 2);
% xlabel('Time (s)');
% ylabel('Force (N)');

%% Sensitivity analysis plot

s_analysis = readtable('Instron data v3', 'Sheet', 'Sensitivity analysis');

x = s_analysis.Compressionspeed;

y = s_analysis.YS;

figure
scatter(x,y, 'filled', 'LineWidth', 2);
grid on
xlabel('Compression Speed (mm/s)', 'Fontsize', 16);
ylabel('Hardness (N)','Fontsize', 16);
xlim([0, 10]);
ylim([300, 600]);
set(gca, 'FontSize', 16);

hold on; % Keep the plot active for further plotting
coeffs = polyfit(x, y, 1); % Compute coefficients for linear regression
y_fit = polyval(coeffs, x); % Compute predicted y values using the coefficients
plot(x, y_fit, 'k-', 'LineWidth', 2); % Plot the line of best fit in red
hold off; % Release the plot

%% Final 0deg plot

Two_bite_data = readtable('MATLABvalues', 'Sheet', '0deg');

x = Two_bite_data.Time;

y1 = Two_bite_data.Lowforce;

y2 = Two_bite_data.Average;

y3 = Two_bite_data.Highforce;

figure;
plot(x, y1, 'Color', [0, 0.5, 0], 'LineWidth', 2);
grid on;
hold on;
plot(x, y2, 'k', 'LineWidth', 2);
plot(x, y3, 'r', 'LineWidth', 2);

xlabel('Time (s)', 'Fontsize', 14);
ylabel('Force (N)', 'Fontsize', 14);
xlim([1.5, 4.5]);
ylim([0, 600]);
legend('Minimum', 'Average', 'Maximum');
set(gca, 'FontSize', 16);

% Add force peak value for y2 as a data label
[peak_value, peak_index] = max(y2);
text(x(peak_index)-0.1, peak_value, num2str(peak_value), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 15);

hold off;


%% Final 25deg plot

Two_bite_data = readtable('MATLABvalues', 'Sheet', '25deg');

x = Two_bite_data.Time;

y1 = Two_bite_data.Lowforce;

y2 = Two_bite_data.Average;

y3 = Two_bite_data.Highforce;

figure;
plot(x, y1, 'Color', [0, 0.5, 0], 'LineWidth', 2);
grid on;
hold on;
plot(x, y2, 'k', 'LineWidth', 2);
plot(x, y3, 'r', 'LineWidth', 2);
xlabel('Time (s)', 'Fontsize', 14);
ylabel('Force (N)','Fontsize', 14);
xlim([1.5, 4.5]);
ylim([0, 300]);
legend('Minimum', 'Average', 'Maximum');
set(gca, 'FontSize', 16);

% Add force peak value for y2 as a data label
[peak_value, peak_index] = max(y2);
text(x(peak_index)-0.1, peak_value, num2str(peak_value), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 15);

hold off

%% Final 29.1deg plot

Two_bite_data = readtable('MATLABvalues', 'Sheet', '29.1deg');

x = Two_bite_data.Time;

y3 = Two_bite_data.Lowforce;

y2 = Two_bite_data.Average;

y1 = Two_bite_data.Highforce;


figure;
plot(x, y1, 'Color', [0, 0.5, 0], 'LineWidth', 2);
grid on;
hold on;
plot(x, y2, 'k', 'LineWidth', 2);
plot(x, y3,'r', 'LineWidth', 2);

xlabel('Time (s)', 'Fontsize', 14);
ylabel('Force (N)','Fontsize', 14);
xlim([1.5, 4.5]);
ylim([0, 230]);
legend('Minimum', 'Average', 'Maximum');
set(gca, 'FontSize', 16);

% Add force peak value for y2 as a data label
[peak_value, peak_index] = max(y2);
text(x(peak_index)-0.1, peak_value, num2str(peak_value), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 15);

hold off

%% TPA Parameters - Work Done & Hardness

% Data
x_categories = {'Flat mandible', '25^{\circ} mandible', '29.1^{\circ} mandible'};
% y1 = [1258.25, 762.36, 517.44];
y1 = [542.52, 272.58, 195.84];
y2 = [542.52, 272.58, 195.84];

errhigh1 = [10.97 19.6 33.48];
errlow1 = [58.89 4.58 33.02];
errhigh2 = [27.48 7.82 14.86];
errlow2 = [25.52 9.48 6.44];

% Create the figure
figure;
grid on

% Define the bar width and gap between groups
bar_width = 0.35;
group_gap = 0.05;

% Calculate the x-positions for each group
x_positions = 1:numel(x_categories);
x_group1 = x_positions - bar_width/2;
x_group2 = x_positions + bar_width/2 + group_gap;

% Create the left y-axis and plot the WD data
yyaxis left;
bar(x_group1, y1, bar_width, 'cyan');
hold on
errorbar(x_group1, y1, errlow1, errhigh1, 'k.', 'LineWidth', 1);
ylabel('Work Done (J)');
ax = gca;
ax.YColor = 'k'; % Set the y-axis label color to blue

% Create the right y-axis and plot the H data
yyaxis right;
bar(x_group2, y2, bar_width, 'blue');
hold on
errorbar(x_group2, y2, errlow2, errhigh2, 'k.', 'LineWidth', 1);
ylabel('Hardness (N)');
ax = gca;
ax.YColor = 'k'; % Set the y-axis label color to red

% Set the x-axis tick labels
xticks(x_positions);
xticklabels(x_categories);

% Add data labels to each bar
text(x_group1, y1 + 0.25, num2str(y1', '%.2f'), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 15);
text(x_group2, y2 + 0.25, num2str(y2', '%.2f'), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 15);

% Set the legend and font size
legend('Work Done', 'Hardness');
set(gca, 'FontSize', 16);


%% TPA Parameters - PSFR and Chewiness

% Data
x_categories = {'Flat mandible', '25^{\circ} mandible', '29.1^{\circ} mandible'};
y1 = [7, 16.95, 8.1]; % Chewiness
y2 = [3.19, 1.14, 0.85]; % PSFR

errhigh1 = [2 0.74 0.22];
errlow1 = [1.21 1.7 0.14];
errhigh2 = [0.16 0.03 0.07];
errlow2 = [0.15 0 0.03];

% Create the figure
figure;
grid on

% Define the bar width and gap between groups
bar_width = 0.35;
group_gap = 0.05;

% Calculate the x-positions for each group
x_positions = 1:numel(x_categories);
x_group1 = x_positions - bar_width/2;
x_group2 = x_positions + bar_width/2 + group_gap;

legend('Work Done', 'Hardness');

% Create the left y-axis and plot the WD data
yyaxis left;
bar(x_group1, y1, bar_width, 'cyan');
hold on
errorbar(x_group1, y1, errlow1, errhigh1, 'k.', 'LineWidth', 1);
ylabel('Chewiness (N)');
ax = gca;
ax.YColor = 'k'; % Set the y-axis label color to blue

% Create the right y-axis and plot the H data
yyaxis right;
bar(x_group2, y2, bar_width, 'blue');
hold on
errorbar(x_group2, y2, errlow2, errhigh2, 'k.', 'LineWidth', 1);
ylabel('PSFR (kN/s)');
ax = gca;
ax.YColor = 'k'; % Set the y-axis label color to red

% Set the x-axis tick labels
xticks(x_positions);
xticklabels(x_categories);

% Add data labels to each bar
text(x_group1, y1 + 0.15, num2str(y1', '%.2f'), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 15);
text(x_group2, y2 + 0.15, num2str(y2', '%.2f'), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 15);

legend('Chewiness', 'PSFR');

set(gca, 'FontSize', 16);



%% TPA Parameters - Compressibility, Cohesiveness, & Springiness

% Data
x_categories = {'Flat mandible', '25^{\circ} mandible', '29.1^{\circ} mandible'};;
group1_data = [0.18, 0.20, 0.18];
group1_error_high = [0, 0.02, 0.01];
group1_error_low = [0, 0.02, 0];
group2_data = [0.06, 0.16, 0.14];
group2_error_high = [0, 0.01, 0.01];
group2_error_low = [0.01, 0.02, 0.01];
group3_data = [0.23, 0.39, 0.29];
group3_error_high = [0.02, 0, 0];
group3_error_low = [0.01, 0.01, 0.01];

% Create the figure
figure;
grid on

% Define the bar width and gap between groups
bar_width = 0.25;
group_gap = 0.02;

% Calculate the x-positions for each group
x_positions = 1:numel(x_categories);
x_group1 = x_positions - bar_width - group_gap;
x_group2 = x_positions;
x_group3 = x_positions + bar_width + group_gap;

% Create the grouped bar chart
bar(x_group1, group1_data, bar_width, 'cyan');
hold on;
% errorbar(x_group1, group1_data, group1_error_low, group1_error_high, 'k.', 'LineWidth', 1);
bar(x_group2, group2_data, bar_width, 'blue');
% errorbar(x_group2, group2_data, group2_error_low, group2_error_high, 'k.', 'LineWidth', 1);
bar(x_group3, group3_data, bar_width, 'green');
% errorbar(x_group3, group3_data, group3_error_low, group3_error_high, 'k.', 'LineWidth', 1);

errorbar(x_group1, group1_data, group1_error_low, group1_error_high, 'k.', 'LineWidth', 1);
errorbar(x_group2, group2_data, group2_error_low, group2_error_high, 'k.', 'LineWidth', 1);
errorbar(x_group3, group3_data, group3_error_low, group3_error_high, 'k.', 'LineWidth', 1);
% Set the x-axis tick labels
xticks(x_positions);
xticklabels(x_categories);

% Set the y-axis limits and tick values
ylim([0 1]);
yticks(0:0.1:1);
grid on

% Add labels to the bars
for i = 1:numel(group1_data)
    text(x_group1(i), group1_data(i)+0.05, num2str(group1_data(i)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 15);
end
for i = 1:numel(group2_data)
    text(x_group2(i), group2_data(i)+0.05, num2str(group2_data(i)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 15);
end
for i = 1:numel(group3_data)
    text(x_group3(i), group3_data(i)+0.05, num2str(group3_data(i)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 15);
end


legend('Compressibility', 'Cohesiveness', 'Springiness');

set(gca, 'FontSize', 16);

ylabel('Ratio');


% %% TPA Parameters - Work Done & Hardness (ignore)
% 
% % Data
% x_categories = {'Flat mandible', '25^{\circ} mandible', '29.1^{\circ} mandible'};
% y1 = [1258.25, 762.36, 517.44];
% y2 = [542.52, 272.58, 195.84];
% 
% errhigh1 = [10.97 19.6 33.48];
% errlow1 = [58.89 4.58 33.02];
% errhigh2 = [27.48 7.82 14.86];
% errlow2 = [25.52 9.48 6.44];
% 
% % Create the figure
% figure;
% grid on;
% 
% % Define the bar width and gap between groups
% bar_width = 0.35;
% group_gap = 0.05;
% 
% % Calculate the x-positions for each group
% x_positions = 1:numel(x_categories);
% x_group1 = x_positions - bar_width/2;
% x_group2 = x_positions + bar_width/2 + group_gap;
% 
% % Create the left y-axis and plot the WD data
% yyaxis left;
% bar(x_group1, y1, bar_width, 'cyan');
% hold on;
% errorbar(x_group1, y1, errlow1, errhigh1, 'k.', 'LineWidth', 1);
% ylabel('Work Done (J)');
% ax = gca;
% ax.YColor = 'k'; % Set the y-axis label color to blue
% 
% % Create the right y-axis and plot the H data
% yyaxis right;
% bar(x_group2, y2, bar_width, 'blue');
% hold on;
% errorbar(x_group2, y2, errlow2, errhigh2, 'k.', 'LineWidth', 1);
% ylabel('Hardness (N)');
% ax = gca;
% ax.YColor = 'k'; % Set the y-axis label color to red
% 
% % Set the x-axis tick labels
% xticks(x_positions);
% xticklabels(x_categories);
% 
% % Add labels to the bars
% for i = 1:numel(y1)
%     bar_height = y1(i) + 0.000001 * max([y1, y2]);  % Calculate the bar height for label positioning
%     text(x_group1(i), bar_height, num2str(y1(i)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 13);
% end
% 
% for i = 1:numel(y2)
%     bar_height = y2(i) + 0.05 * max([y1, y2]);  % Calculate the bar height for label positioning
%     text(x_group2(i), bar_height, num2str(y2(i)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize', 13);
% end
% 
% 
% 
% % Set the legend and font size
% legend('Work Done', 'Hardness');
% set(gca, 'FontSize', 16);
