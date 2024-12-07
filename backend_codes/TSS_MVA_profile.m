function TSS_MVA_profile(TSS_input_no,s_apprant_power_MVA_mag)
 % 
    % clearvars
    format longG
    tic
    graphics_toolkit ("gnuplot")
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);
    
    plot(s_apprant_power_MVA_mag(:,TSS_input_no))
    title(['MVA profile of TSS number ',num2str(TSS_input_no)])
    xlabel('Time (sec)','FontWeight','bold')
    ylabel('MVA','FontWeight','bold')
    desired_filename = '../Plots/TSS_MVA_profile.png';
    saveas(gcf, desired_filename);
    toc
end