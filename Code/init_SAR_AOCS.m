%%% init_SAR_AOCS.m
% ==========================================================
% Synspective SAR Satellite AOCS Model Initialization Script
% ==========================================================
% This script initializes all parameters for a full Model-in-the-Loop (MILS)
% simulation of a small Synthetic Aperture Radar (SAR) satellite AOCS

addpath(genpath(pwd));

% Parameters
sat = satellite_params();
orbit = orbit_params();
sensor = sensor_params();

% Simulation Settings
sim.dt = 0.01; % Time Step (s)

% Initial Conditions
% Tumbling after deployment
initial.q = [0.7071; 0; 0.7071; 0];   % scalar-first quaternion (45° rotation)
initial.omega = [0.05; -0.08; 0.06];   % rad/s (high initial rates)
initial.omegad = initial.omega*(180/pi);
initial.omegadot = [0; 0; 0];

initial.pos_eci = [orbit.a; 0; 0];     % Simple starting position
initial.vel_eci = [0; sqrt(orbit.mu/orbit.a); 0];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Imported Values for Sensors and Actuators %

Hrw_B_init = [0; 0; 0]; 
wRW_init = [0;0;0;0];
w_init = initial.omega;
Ts = sim.dt;

% Process Noise Covariance Matrix
Q = 1e-10;
unit6 = ones(6,1);
unit7 = ones(7,1);

% Actuators Initial Value

rw_SensorToBody = [0 0.4741 0.4741 -0.9482;...
                  -0.9999 0.3333 0.3333 0.3333;...
                   0 -0.8165 0.8165 0 ];
RW_wmax = 300; % 3000 rpm ~ 293.215 rad/sn.
RW_Vmax = 20;   % V
RW_Vmin = 0.5;  % V
RW_Imax = 0.2;  % A
RW_Imin = 0.12; % A
RW_Hmax = 0.12;
RW_Mmax = 0.015; % Nm. 
RW_Ts = (1/10);  % sn.
RW_InnerLoop = (1/1000);% sn.
RW_OuterLoop = (1/100);% sn.

rw_Inertia = 5e-4; % kgm^2
R = 2;    % Ohm
L = 5.2e-3;  % H
b = 10e-6; % 10e-6 coefficient - kg.m^2/s (Nms) 
K = 0.1;  % 0.1 If coefficient Kt = Km 
Km = 0.1; % 0.1 coefficient - V/(rad/s) 
Kt = 0.1; % 0.1 coefficient - Nm/Amper

% Measurement Noise Covariance Matrix
Rgyro = 1e-12;
Rstr = 1e-12; 
Rmgm = 1e-7; 
Rsus = 1e-7; 
Rgps1 = 1e-7; 
Rgps2 = 1e-7;

% Measurement Matrix
gyro = ones(1,3);
Hgyro = [diag(gyro) zeros(3,4)];

str = ones(1,4);
Hstr = [zeros(4,3) diag(str)];

% Configuration-4: GYRO + STR
Hconf4 =[Hgyro;Hstr];
Rconf4 =[diag(ones(3,1))*Rgyro zeros(3,4);...
        zeros(4,3) diag(ones(1,4))*Rstr];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Save to base workspace
assignin('base', 'sat', sat);
assignin('base', 'orbit', orbit);
assignin('base', 'initial', initial);
assignin('base', 'sensor', sensor);
assignin('base', 'sim', sim);

disp('SAR AOCS Simulation initialized successfully.');