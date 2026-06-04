% Quaternions to Euler angles

function [phi, theta, psi] = quat2angle(q)
q0 = q(1);
q1 = q(2);
q2 = q(3);
q3 = q(4);

phi = atan((2*(q0*q1 + q2*q3))/(1-2*(q1^2 + q2^2))); % rad
theta = asin(2*(q0*q2 - q3*q1)); % rad
psi = atan((2*(q0*q3 + q1*q2))/(1-2*(q2^2 + q3^2))); % rad
end

