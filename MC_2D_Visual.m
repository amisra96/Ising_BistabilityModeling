close all
clc
clear all

% Dimension of the system

N = 32 ;

%Number of iteration

iter = 10000 ;

% Parameter of the simulation

J = 1 ; % Exchange integral
h = 0;  % External applied field
T = 1.5;  % Temperature in unit of Kb



% Define list of h (external field) values to iterate thru
h_vals = -2:0.1:2;
% Define results vector for which you want to store the mean magnetization
% values
mag_vals = zeros(2,length(h_vals));

%% Going from -h to +h
% Inital Configuration, x is the matrix rapresenting the spin lattice
% initialized with all spins down (-1)
x = -1*ones(N);
for i = 1:length(h_vals)
    h = h_vals(i); disp(h)


    % Actual Monte Carlo Simulation
    fname = sprintf('plot2D_-Hto+H_%g.jpg',i);

    x = monte_carlo_vis(x,iter,N,h,J,T,fname);

    % record mean magnetization
    mag_vals(1,i) = magnetizationIsing(x);
end
close all;


%% Going from +h to -h
% Inital Configuration, x is the matrix rapresenting the spin lattice
% initialized with all spins up (+1)
x = ones(N);
for i = 1:length(h_vals)
    idx = length(h_vals)-i+1; % iterate from end of h_vals array
    h = h_vals(idx);disp(h)

    % Actual Monte Carlo Simulation
    fname = sprintf('plot2D_+Hto-H_%g.jpg',i);
    x = monte_carlo_vis(x,iter,N,h,J,T,fname);
    % record mean magnetization
    mag_vals(2,idx) = magnetizationIsing(x);
end
close all;
