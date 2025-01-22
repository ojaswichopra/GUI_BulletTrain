% Braking curve for E5 (v in kM, br_force in kN)

function br_f = braking_force(v)

if ((v >= 0) && (v < 100))
    br_f = v + 500;
end
if (v >= 100)
    br_f = 600 - v;
end
if (v < 0)
    br_f = 0;
end