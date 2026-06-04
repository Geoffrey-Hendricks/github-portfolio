% Euler's equation for Rigid Body Dynamics

function omega_dot = sat_dynamics(omega, torque, I)
omega_dot = I \ (torque - cross(omega, I*omega));
end

% M = I*w_dot + w x (I*w)
% Thus, w_dot = (I^-1)*(M - w x (I*w))
% Note: M = moments or applied torques

% omega: angular velocity (rad/s)
% torque: applied torque (Nm)