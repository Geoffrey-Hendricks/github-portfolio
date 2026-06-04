% AE 6553 HW 3

close all
clear
clc

% inputs
% r - position vector ECI
% v - velocity vector ECI
% mu - gravitational parameter

rvec=[9899.74
    -6157.12
    2034.55]; % km

vvec=[5.2165
    1.9489
    -6.1424]; % km/s

mu=3.986e5; % km^3/s^2 for Earth ( 1 DU^3/TU^2 if in DU units)

[a,e,i,omega,w,f]=rv2oe(rvec,vvec,mu);

function [a,e,i,omega,w,f]=rv2oe(rvec,vvec,mu)

r=sqrt(rvec(1,1)^2 + rvec(2,1)^2 + rvec(3,1)^2);
v=sqrt(vvec(1,1)^2 + vvec(2,1)^2 + vvec(3,1)^2);
hvec=cross(rvec,vvec);
h=sqrt(hvec(1,1)^2 + hvec(2,1)^2 + hvec(3,1)^2);
k=[0
    0
    1];
evec=(cross(vvec,hvec)-(mu*rvec)/r)*(1/mu);
e=sqrt(evec(1,1)^2 + evec(2,1)^2 + evec(3,1)^2);
nvec=cross(k,hvec);
n=sqrt(nvec(1,1)^2 + nvec(2,1)^2 + nvec(3,1)^2);
w=acosd(dot(nvec,evec)/(n*e));
w_check=dot(evec,nvec);
if w_check < 0
    w=w+180;
end
f=acosd(dot(evec,rvec)/(e*r));
f_check=dot(rvec,nvec);
if f_check < 0
    f=f_check+180;
end
i=acosd(dot(hvec,k)/h);
p=(h^2)/mu;
a=p/(1-e^2);
omega=acosd(nvec(1,1)/n);

end