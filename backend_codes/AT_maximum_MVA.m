function AT_maximum_MVA(AT_mva_mag, AT)
% clc
    % clearvars
    format longG
    tic
    graphics_toolkit ("gnuplot")
    % load("variable_load_flow_mum_to_ahm_each_stop.mat");
    maximum_mva_AT=max(AT_mva_mag);
    bar(maximum_mva_AT)
    xticks(1:1:length(AT))
    xlabel('AT Number','FontWeight','bold')
    ylabel('MAximum MVA','FontWeight','bold')

    desired_filename = '../Plots/AT_maximum_MVA.png';
    saveas(gcf, desired_filename);

end
