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

% define Temp vals
T_vals = [1 1.5 2 2.5];

for j = 1:length(T_vals)
    T = T_vals(j);
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

        x = monte_carlo(x,iter,N,h,J,T);

        % record mean magnetization
        mag_vals(1,i) = magnetizationIsing(x);
    end



    %% Going from +h to -h
    % Inital Configuration, x is the matrix rapresenting the spin lattice
    % initialized with all spins up (+1)
    x = ones(N);
    for i = 1:length(h_vals)
        idx = length(h_vals)-i+1; % iterate from end of h_vals array
        h = h_vals(idx);disp(h)

        % Actual Monte Carlo Simulation

        x = monte_carlo(x,iter,N,h,J,T);

        % record mean magnetization
        mag_vals(2,idx) = magnetizationIsing(x);
    end

    %% Plot magnetization
    figure;plot(h_vals,mag_vals(1,:),'b-');hold on;plot(h_vals,mag_vals(2,:),'r-');
    Legends={};
    Legends{1}='-h to +h';Legends{2}='+h to -h';
    legend(Legends)

    title(sprintf('Hysteresis Loop (T = %g)',T));xlabel('External Field H');ylabel('Mean Magnetization');
    saveas(gcf,sprintf('HysteresisLoop_T%g.jpg',T));close all;
end