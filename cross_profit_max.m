% cross_profit_max.m
%
% Code for "The Joy of Shopping: A Model of Treasure Hunts"
% by Gu, Nistor, and Selove
%
% Used to compute profits from a treasure hunt
% and optimal price (p) and ease of finding treasure (mu)
% to maximize profits.
% Allows negative prices for cross-selling extension



% Check values of mu from 0.01 to 3
% in increments of 0.001
mu_grid = [1:3000]'./1000;

% Check values of p from -0.99 to 2
% in increments of 0.001
p_grid = [1:3000]'./1000 - 1;


% Arrays to store outcomes for each p and mu
% These variables have the same definition as in profit_max.m
zero_mat = zeros(3000,3000);
t_star = zero_mat;
q_star = zero_mat;
u_treasure = zero_mat;
u_search = zero_mat;
u_total = zero_mat;
sales = zero_mat;
profits = zero_mat;

for i = 1:3000
for j = 1:3000
    mu = mu_grid(i);
    p = p_grid(j);

    if (p < V)
        tval = V - p;
    else
        tval = 0;
    end

    % Optimal time to stop hunting
    t_star(i,j) = (alpha + beta_1.*mu + beta_2.*tval + mu.*tval);

    % Probability of finding treasure
    q_star(i,j) = 1 - exp(-mu.*t_star(i,j));

    % Expected utility from finding treasure
    u_treasure(i,j) = q_star(i,j) .* tval;

    % Expected utility from joy of search
    u_search(i,j) = (alpha/mu + beta_1 + (beta_2.*tval)./mu - 1/(mu^2)).*(1-exp(-mu.*t_star(i,j))) + (1/mu).*t_star(i,j).*exp(-mu.*t_star(i,j));

    % Total utility
    u_total(i,j) = u_treasure(i,j) + u_search(i,j);

    % Number of treasures sold and profits
    if p <= V
        sales(i,j) = u_total(i,j).*q_star(i,j);
    end

    % Profits p from treasure and x from cross-sold products
    profits(i,j) = (p + x).*sales(i,j);
end
end

% Compute best mu and p
[max_prof index_prof] = max(profits);
[max_prof2 index_prof2] = max(max_prof);
current_best_mu = mu_grid(index_prof(index_prof2));
current_best_price = p_grid(index_prof2);

