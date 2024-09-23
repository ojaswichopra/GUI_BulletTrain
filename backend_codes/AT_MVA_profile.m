function AT_MVA_profile(AT_no)
% clc
    % clearvars
    format longG
    tic
    %load("variable_load_flow_mum_to_ahm_each_stop.mat");
    %AT_input_no=input('Enter the AT number to see its MVA profile');
    AT_input_no=AT_no;
    plot(AT_mva_mag(:,AT_input_no))
    title(['MVA profile of AT number ',num2str(AT_input_no)])
    xlabel('Time (sec)','FontWeight','bold')
    ylabel('MVA','FontWeight','bold')

    saveas(gcf, 'AT_MVA_profile.png')

    toc
end