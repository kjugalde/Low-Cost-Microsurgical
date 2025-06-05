% Comparative Cost Bar Chart for Microsurgical Instruments
clc; clear; close all 
% Instrument names
instruments = {'Jeweler Forcep','Dilator Forcep','Microneedle Holder'};

% Cost data: rows correspond to [Commercial; Prototype; Outsourced (Additive); Outsourced (Injection Molded)]
costs = [
    14.30, 23.30, 26.03;   % Commercial
     0.59,  0.86,  0.67;   % Prototype
     2.61,  2.62,  4.03;   % Outsourced (Additive)
     1.62,  1.69,  1.15    % Outsourced (Injection Molded)
];

% Transpose so that each group is one instrument
costs = costs';

% Create grouped bar chart
figure('Position',[100, 100, 750, 800]);
bar(costs, 'grouped');
set(gca, 'XTickLabel', instruments, 'FontSize', 12);
xlabel('Instrument Type');
ylabel('Per-Unit Cost');
ax = gca; 
ax.YAxis.TickLabelFormat = '$%,.0f';   % e.g. $1,234
% title('Cost Analysis of Microsurgical Training Instruments', 'FontWeight', 'bold');
grid minor 
% Add legend
legend( ...
    'Current / Commercially Available', ...
    'Low-Cost, Prototype (In-House)', ...
    'Low-Cost, Outsourced (Additive)', ...
    'Low-Cost, Outsourced (Injection Molded)', ...
    'Location', 'northwest' ...
);

% Optional: Rotate x‐tick labels if they overlap
xtickangle(0);
