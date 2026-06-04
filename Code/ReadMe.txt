% Full Junior AOCS System Project Modeled after Synspective's desired Qualifications - Geoffrey Hendricks

Instructions: 
1) initialization file gathers parameters for Simulink which can also be run from the run_SAR_AOCS.m file
2) run the Simulink simulation

Folder Structure

Sysnspective_AOCS_Project/
│
├── init_SAR_AOCS.m
├── run_SAR_AOCS.m
├── params/
│   ├── orbit_params.m
│   ├── satellite_params.m
│   └── sensor_params.m
│
├── util/
│   ├── angle2quat.m
│   ├── OrbitalElements2rv.m
│   ├── quat2angle.m
│   ├── quat_I2B.m
│   ├── quat_kinematics.m
│   ├── quat_multiply.m
│   ├── rv2OrbitalElements.m
│   └── sat_dynamics.m
│
├── EKF/
│   ├── dynamicFunctions2.m
│   └── measurementFunction2.m