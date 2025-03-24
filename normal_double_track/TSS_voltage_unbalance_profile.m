function TSS_voltage_unbalance_profile(TSS_input_no, Unb)
% clc
    % clearvars
    format longG
    tic
    graphics_toolkit ("gnuplot")
    %load("variable_load_flow_mum_to_ahm_each_stop.mat");
    % Unb = load("Unb.txt");
    % TSS_input_no=input('Enter the TSS number to see its voltage unbalance profile');

    % Create a figure handle
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', [100, 100, 1830, 1500]);

    plot(Unb(:,TSS_input_no),'Linewidth',2)
    title(['Voltage unbalance profile of TSS number ',num2str(TSS_input_no)],'Fontsize',16,'FontWeight','bold')
    xlabel('Time (sec)','FontWeight','bold','Fontsize',14)
    ylabel('Voltage unbalance (%)','FontWeight','bold','Fontsize',14)
    allAxes = findall(gcf, 'Type', 'axes'); % Find all axes in the current figure
    set(allAxes, 'FontSize', 16, 'FontWeight', 'bold'); % Set font size and weight
    desired_filename = '../Plots_normal/TSS_voltage_unbalance_profile.png';  % Replace 'desired_name' with your file name
    saveas(gcf, desired_filename);
    toc
end