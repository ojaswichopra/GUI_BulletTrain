
% function for constant speed train

function [s,v] = const_speed(v00,s00,t00,td,a,b,c,M,g,delt,init_count,eff,start_km,end_km,gradients)

global train_prof;

% v0, s0     : initial speed (m/s) and initial distance (m) respectively
% td, t0     : duration of constant speed (s) and initial time (s) respectively
% a, b, c    : Davies curve constants
% M, g       : Mass of the train (Ton) and gravitational accln (m/sec^2)
% delt       : time step (s)

v = v00;
s = s00;
for ttt = 1:delt:td
    tr = train_resis_E5(a,b,c,v,M);
    gradi = track_grad_forward(s,start_km,end_km,gradients);
    accln = 0;
    s = s + v*delt + 0.5*accln*(delt^2);
    v = v + accln*delt;
    tf = tr + M*g*gradi;
    train_prof(init_count+ttt,1) = t00+ttt;              % time (sec)
    train_prof(init_count+ttt,2) = v*18/5;             % velocity (km/h);
    train_prof(init_count+ttt,3) = s/1000;             % distance (km)  
    train_prof(init_count+ttt,4) = (tf*v)/(eff*1000);  % power (in MW) 
    train_prof(init_count+ttt,5) = accln;              % m/sec^2
    train_prof(init_count+ttt,6) = tf;                 % tractive force (kN)
end