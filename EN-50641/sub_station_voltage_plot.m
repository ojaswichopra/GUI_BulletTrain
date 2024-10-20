function sub_station_voltage_plot(Vc_mag_Td,Vf_mag_Td)
    % ##clc
    % ##clear all
    tic
    % load('required_variable_load_flow_standard.mat')

    %  substation_voltage=[0; Vc_mag_Td(:,1)];

    % Create a figure handle
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);

    plot(Vc_mag_Td(:,1));
    hold on
    plot(Vf_mag_Td(:,1));
    ylim([27,28])
    xlabel('Time (sec)','FontWeight','bold')
    ylabel('Volatge Magnitude (kV)','FontWeight','bold')
    legend('contact line bus bar voltage','negative feeder bus bar voltage','FontWeight','bold')
    set(gca, 'FontSize', 16);

    desired_filename = '../Plots/sub_station_voltage.png';
    saveas(gcf, desired_filename);

    toc
end