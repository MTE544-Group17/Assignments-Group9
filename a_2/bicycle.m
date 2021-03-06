function xcur = bicycle(xprev,v,delta,l,dt)
%% Bicycle robot model kinematics. This function takes in previous state 
%  xprev = [x,y,theta]', speed v and steering angle delta, the distance from 
%  the front wheel to rear, l, as well as the timestep dt. It returns the new 
%  robot pose. 

% Calculate noise
pos_noise = normrnd(0, 0.02);
rotational_noise = normrnd(0, deg2rad(1));

% Motion increment in the body frame
dx_b = dt*[v 0 v*tan(delta)/l]';

% Rotation matrix for conversion from body to inertial frame
R = rot(xprev(3),3); 

% Robot state update in inertial frame
xcur = xprev + R*dx_b + [pos_noise; pos_noise; rotational_noise];

