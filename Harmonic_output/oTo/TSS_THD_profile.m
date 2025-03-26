function TSS_THD_profile(N_TSS, y, N_TSS_O, TSS_No)
    tic

    % This .mat file is generated after performing harmonic analysis under one TSS outage condition
    load("harmonic_analysis_variables_1_TSS_outage.mat","TSS_primary_THD")
    % load("harmonic_analysis_variables_5th_TSS_outage.mat","TSS_primary_THD")
    % load("harmonic_analysis_variables_11th_TSS_outage.mat","TSS_primary_THD")

    % load("Double_track_TSS1_outage_load_flow_variables.mat","y","N_TSS","N_TSS_O")
    % load("Double_track_TSS5_outage_load_flow_variables.mat","y","N_TSS","N_TSS_O")
    % load("Double_track_TSS11_outage_load_flow_variables.mat","y","N_TSS","N_TSS_O")

    % These text files are generated after executing the load flow under one TSS outage condition
    % N_TSS=load("N_TSS.txt");
    % N_TSS_O=load("N_TSS_O.txt");
    % y=load("y.txt");

    % This input is to be taken from the user
    % TSS_No=input("Enter the TSS number to see its primary side voltage THD profile ");

    time=(1:y)/60;  % Time (minutes)

    if (TSS_No>N_TSS)
        fprintf('Invalid TSS number. Please enter a valid TSS number.\n');
    elseif (TSS_No==N_TSS_O)
        graphics_toolkit ("gnuplot")
        figureHandle = figure;
        screenSize = get(0, 'ScreenSize');
        
        set(figureHandle, 'Position', [100, 100, 1500, 1400]);
        subplot(3,1,1)
        plot(time,zeros(1,y))
        xlabel('Time (minute)', 'FontSize', 10, 'FontWeight', 'bold')
        ylabel('Phase A voltage THD (%)', 'FontSize', 10, 'FontWeight', 'bold')
        title(['Phase A voltage THD profile of TSS ',num2str(TSS_No)])
        subplot(3,1,2)
        plot(time,zeros(1,y))
        xlabel('Time (minute)', 'FontSize', 10, 'FontWeight', 'bold')
        ylabel('Phase B voltage THD (%)', 'FontSize', 10, 'FontWeight', 'bold')
        title(['Phase B voltage THD profile of TSS ',num2str(TSS_No)])
        subplot(3,1,3)
        plot(time,zeros(1,y))
        xlabel('Time (minute)', 'FontSize', 10, 'FontWeight', 'bold')
        ylabel('Phase C voltage THD (%)', 'FontSize', 10, 'FontWeight', 'bold')
        title(['Phase C voltage THD profile of TSS ',num2str(TSS_No)])

        allAxes = findall(gcf, 'Type', 'axes'); % Find all axes in the current figure
        set(allAxes, 'XLim', [0 time(end)], 'FontSize', 12); % Set font size and weight
        allLines = findall(gcf, 'Type', 'line'); % Find all line objects in the figure
        set(allLines, 'LineWidth', 2);          % Set the line width to 1.5

        desired_filename = '../../Plots_harmonic/TSS_THD_profile_oTo.png';
        saveas(gcf, desired_filename);
    else
        graphics_toolkit ("gnuplot")
        figureHandle = figure;
        screenSize = get(0, 'ScreenSize');
        
        set(figureHandle, 'Position', [100, 100, 1500, 1400]);

        if (N_TSS_O==1)  % First TSS outage
            subplot(3,1,1)
            plot(time,TSS_primary_THD((TSS_No-2)*y+1:(TSS_No-1)*y,1))
            xlabel('Time (minute)', 'FontSize', 10, 'FontWeight', 'bold')
            ylabel('Phase A voltage THD (%)', 'FontSize', 10, 'FontWeight', 'bold')
            title(['Phase A voltage THD profile of TSS ',num2str(TSS_No)])
            subplot(3,1,2)
            plot(time,TSS_primary_THD((TSS_No-2)*y+1:(TSS_No-1)*y,2))
            xlabel('Time (minute)', 'FontSize', 10, 'FontWeight', 'bold')
            ylabel('Phase B voltage THD (%)', 'FontSize', 10, 'FontWeight', 'bold')
            title(['Phase B voltage THD profile of TSS ',num2str(TSS_No)])
            subplot(3,1,3)
            plot(time,TSS_primary_THD((TSS_No-2)*y+1:(TSS_No-1)*y,3))
            xlabel('Time (minute)', 'FontSize', 10, 'FontWeight', 'bold')
            ylabel('Phase C voltage THD (%)', 'FontSize', 10, 'FontWeight', 'bold')
            title(['Phase C voltage THD profile of TSS ',num2str(TSS_No)])
            allAxes = findall(gcf, 'Type', 'axes'); % Find all axes in the current figure
            set(allAxes, 'XLim', [0 time(end)], 'FontSize', 12); % Set font size and weight
            allLines = findall(gcf, 'Type', 'line'); % Find all line objects in the figure
            set(allLines, 'LineWidth', 2);          % Set the line width to 1.5
        elseif (N_TSS_O==N_TSS)  % Last TSS outage
            subplot(3,1,1)
            plot(time,TSS_primary_THD((TSS_No-1)*y+1:TSS_No*y,1))
            xlabel('Time (minute)', 'FontSize', 10, 'FontWeight', 'bold')
            ylabel('Phase A voltage THD (%)', 'FontSize', 10, 'FontWeight', 'bold')
            title(['Phase A voltage THD profile of TSS ',num2str(TSS_No)])
            subplot(3,1,2)
            plot(time,TSS_primary_THD((TSS_No-1)*y+1:TSS_No*y,2))
            xlabel('Time (minute)', 'FontSize', 10, 'FontWeight', 'bold')
            ylabel('Phase B voltage THD (%)', 'FontSize', 10, 'FontWeight', 'bold')
            title(['Phase B voltage THD profile of TSS ',num2str(TSS_No)])
            subplot(3,1,3)
            plot(time,TSS_primary_THD((TSS_No-1)*y+1:TSS_No*y,3))
            xlabel('Time (minute)', 'FontSize', 10, 'FontWeight', 'bold')
            ylabel('Phase C voltage THD (%)', 'FontSize', 10, 'FontWeight', 'bold')
            title(['Phase C voltage THD profile of TSS ',num2str(TSS_No)])
            allAxes = findall(gcf, 'Type', 'axes'); % Find all axes in the current figure
            set(allAxes, 'XLim', [0 time(end)], 'FontSize', 12); % Set font size and weight
            allLines = findall(gcf, 'Type', 'line'); % Find all line objects in the figure
            set(allLines, 'LineWidth', 2);          % Set the line width to 1.5
        else  % Any intermediate TSS outage
            if (TSS_No<N_TSS_O)
                subplot(3,1,1)
                plot(time,TSS_primary_THD((TSS_No-1)*y+1:TSS_No*y,1))
                xlabel('Time (minute)', 'FontSize', 10, 'FontWeight', 'bold')
                ylabel('Phase A voltage THD (%)', 'FontSize', 10, 'FontWeight', 'bold')
                title(['Phase A voltage THD profile of TSS ',num2str(TSS_No)])
                subplot(3,1,2)
                plot(time,TSS_primary_THD((TSS_No-1)*y+1:TSS_No*y,2))
                xlabel('Time (minute)', 'FontSize', 10, 'FontWeight', 'bold')
                ylabel('Phase B voltage THD (%)', 'FontSize', 10, 'FontWeight', 'bold')
                title(['Phase B voltage THD profile of TSS ',num2str(TSS_No)])
                subplot(3,1,3)
                plot(time,TSS_primary_THD((TSS_No-1)*y+1:TSS_No*y,3))
                xlabel('Time (minute)', 'FontSize', 10, 'FontWeight', 'bold')
                ylabel('Phase C voltage THD (%)', 'FontSize', 10, 'FontWeight', 'bold')
                title(['Phase C voltage THD profile of TSS ',num2str(TSS_No)])
                allAxes = findall(gcf, 'Type', 'axes'); % Find all axes in the current figure
                set(allAxes, 'XLim', [0 time(end)], 'FontSize', 12); % Set font size and weight
                allLines = findall(gcf, 'Type', 'line'); % Find all line objects in the figure
                set(allLines, 'LineWidth', 2);          % Set the line width to 1.5
            elseif (TSS_No>N_TSS_O)
                subplot(3,1,1)
                plot(time,TSS_primary_THD((TSS_No-2)*y+1:(TSS_No-1)*y,1))
                xlabel('Time (minute)', 'FontSize', 10, 'FontWeight', 'bold')
                ylabel('Phase A voltage THD (%)', 'FontSize', 10, 'FontWeight', 'bold')
                title(['Phase A voltage THD profile of TSS ',num2str(TSS_No)])
                subplot(3,1,2)
                plot(time,TSS_primary_THD((TSS_No-2)*y+1:(TSS_No-1)*y,2))
                xlabel('Time (minute)', 'FontSize', 10, 'FontWeight', 'bold')
                ylabel('Phase B voltage THD (%)', 'FontSize', 10, 'FontWeight', 'bold')
                title(['Phase B voltage THD profile of TSS ',num2str(TSS_No)])
                subplot(3,1,3)
                plot(time,TSS_primary_THD((TSS_No-2)*y+1:(TSS_No-1)*y,3))
                xlabel('Time (minute)', 'FontSize', 10, 'FontWeight', 'bold')
                ylabel('Phase C voltage THD (%)', 'FontSize', 10, 'FontWeight', 'bold')
                title(['Phase C voltage THD profile of TSS ',num2str(TSS_No)])
                allAxes = findall(gcf, 'Type', 'axes'); % Find all axes in the current figure
                set(allAxes, 'XLim', [0 time(end)], 'FontSize', 12); % Set font size and weight
                allLines = findall(gcf, 'Type', 'line'); % Find all line objects in the figure
                set(allLines, 'LineWidth', 2);          % Set the line width to 1.5
            end
        end
        desired_filename = '../../Plots_harmonic/TSS_THD_profile_oTo.png';
        saveas(gcf, desired_filename);
    end

    toc
end