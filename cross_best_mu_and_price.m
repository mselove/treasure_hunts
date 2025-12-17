% cross_best_mu_and_price.m
%
% Code for "The Joy of Shopping: Thrill of the Treasure Hunt"
% by Gu, Nistor, and Selove
%
% Used to find optimal mu and price for a range of values of V
% Calls file cross_profit_max for each V
% Used for cross-selling extension

% Clear all variables
clear;

% Search utility parameters
alpha = 1;
beta_1 = .05;
beta_2 = .75;

% Profits per customer from cross-selling; set to 1 in extension
x = 1;

% Test values from .01 to 2 in increments of 0.01
test_values = [1:200]./100;


% Array to store optimal mu
best_mu = zeros(200,1);
best_price = zeros(200,1);

for test_loop = 1:200
    V = test_values(test_loop);
    run cross_profit_max;
    best_mu(test_loop) = current_best_mu;
    best_price(test_loop) = current_best_price;
end
