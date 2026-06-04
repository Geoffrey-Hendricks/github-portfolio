% AE 6553 HW 3

close all
clear
clc

% inputs
% a - semi-major axis
% e - eccentricity
% i - inclination
% omega - right ascension of ascending node
% w - argument of periapsis
% f - true anomaly
% mu - gravitational parameter

a=27617; % km
e=0.635;
i=50.6; % deg
omega=115.3; % deg
w=93.1; % deg
f=259.5; % deg
mu=3.986e5; % km^3/s^2 for Earth ( 1 DU^3/TU^2 if in DU units)

[r,v]=oe2rv(a,e,i,omega,w,f,mu);

function [r,v]=oe2rv(a,e,i,omega,w,f,mu)
p=a*(1-e^2);
r=p/(1+e*cosd(f));

R3_o=[cosd(-omega) sind(-omega) 0
    -sind(-omega) cosd(-omega) 0
    0 0 1];
R1_i=[1 0 0
    0 cosd(-i) sind(-i)
    0 -sind(-i) cosd(-i)];
R3_w=[cosd(-w) sind(-w) 0
    -sind(-w) cosd(-w) 0
    0 0 1];
Rpqw=[r*cosd(f)
    r*sind(f)
    0];
Vpqw=[-sqrt(mu/p)*sind(f)
    sqrt(mu/p)*(e+cosd(f))
    0];

r=R3_o*R1_i*R3_w*Rpqw;
v=R3_o*R1_i*R3_w*Vpqw;

end