close all;
clear all;

%% Define inputs
% Wheel rotation rates
w = [0 -5 5]; 

% w = w /10;

%% Define states
% Position of the robot
% x = [x y heading]
% heading [rad]
% x, y position [m]
x = [0 0 0];

x_history = zeros(150, 3);

for i = 1:150
    x = motion_model(x, w);
    x_history(i,:) = x;
end

plot(x_history(:, 1), x_history(:, 2));
axis([-5 5 -10 10]);
