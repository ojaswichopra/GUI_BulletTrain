function TSS_voltage_unbalance_profile(TSS_input_no, Unb)
    % 
    % clearvars
    format longG
    tic
    graphics_toolkit ("gnuplot")
    % load("variable_load_flow_mum_to_ahm_each_stop.mat");
    % TSS_input_no=input('Enter the TSS number to see its voltage unbalance profile');
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);
    
    plot(Unb(:,TSS_input_no))
    title(['Voltage unbalance profile of TSS number ',num2str(TSS_input_no)])
    xlabel('Time (sec)','FontWeight','bold')
    ylabel('Voltage unbalance (%)','FontWeight','bold')

    desired_filename = '../Plots/TSS_voltage_unbalance_profile.png';
    saveas(gcf, desired_filename);
    toc
end