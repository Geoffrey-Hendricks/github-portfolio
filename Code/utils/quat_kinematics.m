% Quaternion Kinematics

function q_dot = quat_kinematics(q, omega)
Omega = [ 0      -omega';
          omega  -skew(omega)];
q_dot = 0.5 * Omega * q;
end

% or optionally: 
% function q_dot = quat_kinematics(q0123, pqr)
% p = pqr(1);
% q = pqr(2);
% r = pqr(3);
% q_dot = 0.5*[0 -p -q -r; p 0 r -q; q -r 0 p; r q -p 0]*q0123;
% end

function S = skew(w)
S = [0 -w(3) w(2);
     w(3) 0 -w(1);
    -w(2) w(1) 0];
end