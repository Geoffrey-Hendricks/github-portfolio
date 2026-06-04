% Sensor Parameters (Average noise values)

function sensor = sensor_params()

% Gyroscope
sensor.gyro.sample_rate = 100;                   % Hz
sensor.gyro.bias = [0.001; -0.0008; 0.0012];     % rad/s bias
sensor.gyro.ARW = 0.0005;                        % Angle Random Walk (rad/s/sqrt(Hz))
sensor.gyro.noise_std = 0.001;                   % white noise std

% Star Tracker
sensor.star_tracker.sample_rate = 2;             % Hz
sensor.star_tracker.noise_std = 5e-6;            % ~10 arcsec accuracy (rad)
sensor.star_tracker.update_rate = 1;             % Hz

% Magnetometer
sensor.mag.sample_rate  = 10;                    % Hz
sensor.mag.noise_std = 50e-9;                    % Tesla

% GPS
sensor.gps.sample_rate  = 1;                     % Hz
sensor.gps.pos_noise_std = 10;                   % m
sensor.gps.vel_noise_std = 0.1;                  % m/s

end