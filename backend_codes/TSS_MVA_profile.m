function TSS_MVA_profile(TSS_input_no,s_apprant_power_MVA_mag)
 % clc
    % clearvars
    format longG
    tic

    plot(s_apprant_power_MVA_mag(:,TSS_input_no))
    title(['MVA profile of TSS number ',num2str(TSS_input_no)])
    xlabel('Time (sec)','FontWeight','bold')
    ylabel('MVA','FontWeight','bold')
    desired_filename = '../Plots/TSS_MVA_profile.png';
    saveas(gcf, desired_filename);
    toc
end