% percent_best_mu_and_price.m
%
% Code for "The Joy of Shopping: Thrill of the Treasure Hunt"
% by Gu, Nistor, and Selove
%
% Used to find optimal mu and price for a range of values of V
% Calls file percent_profit_max for each V

% Clear all variables
clear;

% Search utility parameters
alpha = 1;
beta_1 = .05;
beta_2 = .75;

% Profits per customer from cross-selling; set to 0 in main model
x = 0;

% Test values from 1 to 30 in increments of .1
test_values = [1:300]./10;

% Array to store optimal mu, price, and percent utility from search
best_mu = zeros(300,1);
best_price = zeros(300,1);
best_percent = zeros(300,1);

for test_loop = 1:300
    V = test_values(test_loop);
    run percent_profit_max;
    best_mu(test_loop) = current_best_mu;
    best_price(test_loop) = current_best_price;
    best_percent(test_loop) = current_best_percent;
end
