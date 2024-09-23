<<<<<<< HEAD
% clc
% clearvars
format longG
tic
load("variable_load_flow_mum_to_ahm_each_stop.mat");
maximum_mva_AT=max(AT_mva_mag);
bar(maximum_mva_AT)
xticks(1:1:length(AT))
xlabel('AT Number','FontWeight','bold')
=======
% clc
% clearvars
format longG
tic
load("variable_load_flow_mum_to_ahm_each_stop.mat");
maximum_mva_AT=max(AT_mva_mag);
bar(maximum_mva_AT)
xticks(1:1:length(AT))
xlabel('AT Number','FontWeight','bold')
>>>>>>> a6b21b859934a8cd5093e7439821c631fce9c22b
ylabel('MAximum MVA','FontWeight','bold')