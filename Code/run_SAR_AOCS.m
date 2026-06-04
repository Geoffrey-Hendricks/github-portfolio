%%% run_simulation.m
% ==========================================================================
% Synspective SAR Satellite AOCS - Full Model-in-the-Loop Simulation Runner
% ==========================================================================

clear; clc; close all;

disp('=== Starting SAR Satellite AOCS Simulation ===');

% Step 1: Initialize Parameters
init_SAR_AOCS;   % Load all satellite, orbit, sensor, actuator, and controller parameters

% Step 2: Simulation Configuration
model_name = 'SAR_AOCS_Model';

% Open the model (optional)
% open_system(model_name);

% Ensure Simulink model exists
if ~isfile([model_name '.slx'])
    error('Simulink model "%s.slx" not found. Please create the model first.', model_name);
end

disp(['Running Simulink model: ', model_name, '.slx']);