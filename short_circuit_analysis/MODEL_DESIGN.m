a2 = Vp/(2*Vs);
Va=(Vp);  % input for phase voltages
 Vc=(Vp)*(cos(120*pi/180)+i*sin(120*pi/180)); %input for phase voltage b
 Vb=(Vp)*(cos(-120*pi/180)+i*sin(-120*pi/180)); %input for phase voltase c
a1 = (sqrt(3)/2)*a2;
% Zshort=i*4; %short circuit impedance of source
Zshort=1i*(Vp^2/short_ckt_MVA); %short circuit impedance of source
Z1=((4*Za+Zshort)+(Zb+Zshort)+(Zc+Zshort)+(4*a1^2*Zs1))/(8*a1^2);
Z2 = ((Zb+Zshort)+(Zc+Zshort)+(a2^2)*Zs2)/(2*a2^2);


%% Ybus Matrix for Main Winding YcrfM %%

YcrfM = [((1 / (2 * Z2)) + (1 / Zs2)), - (2 / Zs2), (- (1 / (2 * Z2)) + (1 / Zs2));
 - (2 / Zs2), ((4 / Zs2)+(1/Zn)), - (2 / Zs2);
(- (1 / (2 * Z2)) + (1 / Zs2)), - (2 / Zs2), ((1 / (2 * Z2)) + (1 / Zs2))];

%% Ybus Matrix for Teaser Winding YcrfM %%
YcrfT = [((1 / (2 * Z1)) + (1 / Zs1)), - (2 / Zs1), (- (1 / (2 * Z1)) + (1 / Zs1));
 - (2 / Zs1), ((4 / Zs1)+(1/Zn)), - (2 / Zs1);
(- (1 / (2 * Z1)) + (1 / Zs1)), - (2 / Zs1), ((1 / (2 * Z1)) + (1 / Zs1))];
%%Ybus Matrix formation of Auto transformar%%
Zg = zg;
Zm = zm;
Yat = [((1 / (2 * Zg)) - (1 / (Zm + 2 * Zg))), - (1 / Zg), ((1 / (2 * Zg)) + (1 / (Zm + 2 * Zg)));
 - (1 / Zg), (2 / Zg), - (1 / Zg);
((1 / (2 * Zg)) + (1 / (Zm + 2 * Zg))), - (1 / Zg), ((1 / (2 * Zg)) - (1 / (Zm + 2 * Zg)))];
