
% tractive effort curve for E5 train

function tf = trac_eff_E5(v)
% v in km/h and tf in kN

v = v*18/5;      % converting from (m/sec) to (km/h);
 if (v <= 150)
     tf = 425;
 end
 if (v > 150)
     tf = 425*150/v;
 end