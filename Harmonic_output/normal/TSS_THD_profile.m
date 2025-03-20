function TSS_THD_profile(N_TSS, y, TSS_No)
    tic

    % This .mat file is generated after performing harmonic analysis
    load("harmonic_analysis_variables.mat","TSS_primary_THD")

    % These text files are generated after executing the load flow under normal condition
    % N_TSS=load("N_TSS.txt");
    % y=load("y.txt");

    % % This input is to be taken from the user
    % TSS_No=input("Enter the TSS number to see its primary side voltage THD profile ");

    time=(1:y)/60;  % Time (minutes)

    if (TSS_No>N_TSS)
        fprintf('Invalid TSS number. Please enter a valid TSS number.\n');
    else
        graphics_toolkit ("gnuplot")
        figureHandle = figure;
        screenSize = get(0, 'ScreenSize');
        
        set(figureHandle, 'Position', screenSize);

        subplot(3,1,1)
        plot(time,TSS_primary_THD((TSS_No-1)*y+1:TSS_No*y,1))
        xlabel('Time (minute)')
        ylabel('Phase A voltage THD (%)')
        title(['Phase A voltage THD profile of TSS ',num2str(TSS_No)])
        subplot(3,1,2)
        plot(time,TSS_primary_THD((TSS_No-1)*y+1:TSS_No*y,2))
        xlabel('Time (minute)')
        ylabel('Phase B voltage THD (%)')
        title(['Phase B voltage THD profile of TSS ',num2str(TSS_No)])
        subplot(3,1,3)
        plot(time,TSS_primary_THD((TSS_No-1)*y+1:TSS_No*y,3))
        xlabel('Time (minute)')
        ylabel('Phase C voltage THD (%)')
        title(['Phase C voltage THD profile of TSS ',num2str(TSS_No)])
        allAxes = findall(gcf, 'Type', 'axes'); % Find all axes in the current figure
        set(allAxes, 'XLim', [0 time(end)], 'FontSize', 12, 'FontWeight', 'bold'); % Set font size and weight
        allLines = findall(gcf, 'Type', 'line'); % Find all line objects in the figure
        set(allLines, 'LineWidth', 1.5);          % Set the line width to 1.5
        
        desired_filename = '../Plots_harmonic/TSS_THD_profile.png';
        saveas(gcf, desired_filename);

    end

end