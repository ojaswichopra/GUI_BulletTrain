function AT_MVA_profile_outage(AT_input_no, AT_UP_down, AT_mva_mag_up, AT_mva_mag_down, tt_time)
    % clc
    % clearvars
    format longG
    tic
    graphics_toolkit ("gnuplot")
    % load("load_flow_mum_to_sab_double_today.mat");
    % AT_mva_mag_up = load("AT_mva_mag_up.txt");
    % AT_mva_mag_down = load("AT_mva_mag_down.txt");
    % tt_time=load("tt_time.txt");
    % AT_UP_down=input('Enter 1 for UP track AT MVA profile and 2 for Down track AT MVA profile');
    % AT_input_no=input('Enter the AT number to see its MVA profile');
    if AT_UP_down==1
        % Create a figure handle
        figureHandle = figure;

        % Get screen size from root object (0)
        screenSize = get(0, 'ScreenSize');

        % Set the figure to match the screen size
        set(figureHandle, 'Position', screenSize);

        plot(tt_time/60,AT_mva_mag_up(:,AT_input_no),'Linewidth',2)
        title(['MVA profile of up-track AT number ',num2str(AT_input_no)], 'Fontsize',16)
        xlabel('Time (min)','FontWeight','bold', 'Fontsize',16)
        ylabel('MVA','FontWeight','bold', 'Fontsize',16)
        allAxes = findall(gcf, 'Type', 'axes'); % Find all axes in the current figure
        set(allAxes, 'FontSize', 16,'FontWeight','bold'); % Set font size and weight
    else
        % Create a figure handle
        figureHandle = figure;

        % Get screen size from root object (0)
        screenSize = get(0, 'ScreenSize');

        % Set the figure to match the screen size
        set(figureHandle, 'Position', screenSize);

        plot(tt_time/60,AT_mva_mag_down(:,AT_input_no),'Linewidth',2)
        title(['MVA profile of down-track AT number ',num2str(AT_input_no)], 'Fontsize',16)
        xlabel('Time (min)','FontWeight','bold', 'Fontsize',16)
        ylabel('MVA','FontWeight','bold', 'Fontsize',16)
        allAxes = findall(gcf, 'Type', 'axes'); % Find all axes in the current figure
        set(allAxes, 'FontSize', 16,'FontWeight','bold'); % Set font size and weight
    end

    desired_filename = '../Plots_tTo_double/AT_MVA_profile_outage.png';  % Replace 'desired_name' with your file name
    saveas(gcf, desired_filename);
    toc
end