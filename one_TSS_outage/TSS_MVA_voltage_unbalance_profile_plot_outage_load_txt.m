function [maximum_mva, maximum_unbalance] = TSS_MVA_voltage_unbalance_profile_plot_outage_load_txt(TSS,N_TSS_O,dTSS_T,s_apprant_power_MVA_mag,Unb,tt_time)

    % load("TSS.txt");
    % load("N_TSS_O.txt");
    % load("dTSS_T.txt");
    % load("s_apprant_power_MVA_mag.txt");
    % load("Mva_sec_abs.txt");
    % load("Unb.txt");
    % load("tt_time.txt");
    graphics_toolkit ("gnuplot")
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);
    
    track_TSS_no=length(TSS)-length(N_TSS_O);           %% total no of TSS in track
    ntt=length(dTSS_T(:,1));            %% total time interval of whole day operation
    for n_track=1:1:track_TSS_no
    
    subplot(track_TSS_no,1,n_track);
    plot(tt_time/60,s_apprant_power_MVA_mag(:,n_track))
    if n_track<N_TSS_O
        n_track_name=n_track;
    else
        n_track_name=n_track+1;
    end
    title(['MVA profile of TSS number ',num2str(n_track_name) ,'.'])
    xlabel('Time (minute)')
    ylabel('MVA')
    maximum_mva(n_track)=max(s_apprant_power_MVA_mag(:,n_track));
    % maximum_mva_sec(n_track)=max(Mva_sec_abs(:,n_track));
    maximum_unbalance(n_track)=max(Unb(:,n_track));
    end

    desired_filename = '../Plots/oTo_TSS_MVA_voltage_unbalance.png';
    saveas(gcf, desired_filename);
    
    maximum_mva
    maximum_unbalance

end