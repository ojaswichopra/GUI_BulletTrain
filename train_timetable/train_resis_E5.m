
% function for calculating train resistance for E5 train

function tr = train_resis_E5(a,b,c,v,M)

v = v*18/5;    % converting from (m/sec) to (km/h)
force = a + b*v + c*(v^2);
tr = force*M/1000;