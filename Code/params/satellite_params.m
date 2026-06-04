% Spacecraft Parameters (SAR StriX series)

function sat = satellite_params()

sat.mass = 120; % kg - SAR StriX series roughly 100 - 150kg
sat.I = diag([10 10 7.2]); % Moments of Inertia kg*(m^2)

% Moments of Inertia of a Rectangular Prism (Assuming CubeSat Shape)
% Ix = (1/12)*m*(y^2 + z^2)
% Iy = (1/12)*m*(x^2 + z^2)
% Iz = (1/12)*m*(x^2 + y^2)

end

% Note: Deploying radar antenna would increase Ix or Iy depending on
% deployment direction. Also mass distribution is not uniform so that could
% also cause a change in actual Ix, Iy, Iz values