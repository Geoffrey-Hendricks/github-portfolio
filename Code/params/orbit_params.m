% Orbit Parameters (LEO, ~525 km altitude, near sun-synchronous)

function orbit = orbit_params()

orbit.altitude = 525e3;             % m
orbit.a = 6378e3 + orbit.altitude;  % semi-major axis
orbit.e = 0.001;                    % eccentricty (near-circular)
orbit.i = 97.5;                     % inclination (deg)
orbit.Omega = 0;                    % RAAN
orbit.omega = 0;
orbit.M0 = 0;                       % Mean anomaly

orbit.mu = 3.986004418e14;          % Earth GM
orbit.period = 2*pi*sqrt(orbit.a^3/orbit.mu);

end