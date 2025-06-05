clc; clear; close all

data = readtable("costData2.csv"); 

% define the exact left-to-right order you want:
newOrder = { ...
    'Jeweler Forcep', ...
    'Dilator Forcep', ...
    'Microneedle Holder' ...
};

% prepare
inst = categorical(data.Instrument);
inst = reordercats(inst, newOrder);    % ← enforce your order
cost = data.Cost;

% find your two groups
isSS = strcmp(data.Material,'Stainless Steel');
isTi = strcmp(data.Material,'Titanium');

figure; hold on
jw = 0.5;  % width of horizontal spread (0–1)
hSS = swarmchart(inst(isSS), cost(isSS), 80, 's','filled', ...
    'XJitter','rand', 'XJitterWidth',jw);
hTi = swarmchart(inst(isTi), cost(isTi), 80, '^','filled', ...
    'XJitter','rand', 'XJitterWidth',jw);
ylabel('Retail Cost')
grid on
legend([hSS hTi],{'Stainless Steel','Titanium'},'Location','best')
ax = gca;
ax.YAxis.TickLabelFormat = '$%,.0f';   % e.g. $1,234