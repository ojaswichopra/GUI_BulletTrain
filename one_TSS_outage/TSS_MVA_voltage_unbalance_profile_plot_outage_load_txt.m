function [maximum_mva,maximum_unbalance] = TSS_MVA_voltage_unbalance_profile_plot_outage_load_txt(nn_track,TSS,N_TSS_O,dTSS_T,s_apprant_power_MVA_mag,Unb,tt_time)
    % load("TSS.txt");
    % load("N_TSS_O.txt");
    % load("dTSS_T.txt");
    % load("s_apprant_power_MVA_mag.txt");
    % load("Mva_sec_abs.txt");
    % load("Unb.txt");
    % load("tt_time.txt");
    graphics_toolkit ("gnuplot")
    % nn_track=input("Enter the TSS number for MVA profile");
    track_TSS_no=length(TSS)-length(N_TSS_O);           %% total no of TSS in track
    ntt=length(dTSS_T(:,1));            %% total time interval of whole day operation
    nt_track=1;
    for n_track=1:1:track_TSS_no+1
    
    % subplot(track_TSS_no,1,n_track);
    % plot(tt_time/60,s_apprant_power_MVA_mag(:,n_track))
    % if n_track<N_TSS_O
    %     n_track_name=n_track;
    % else
    %     n_track_name=n_track+1;
    % end
    % title(['MVA profile of TSS number ',num2str(n_track_name) ,'.'])
    % xlabel('Time (minute)')
    % ylabel('MVA')
    if n_track<N_TSS_O
        maximum_mva(n_track)=max(s_apprant_power_MVA_mag(:,nt_track));
        maximum_unbalance(n_track)=max(Unb(:,nt_track));
        nt_track=nt_track+1;

    elseif n_track==N_TSS_O
        maximum_mva(n_track)=0;
        maximum_unbalance(n_track)=0;
    else
        maximum_mva(n_track)=max(s_apprant_power_MVA_mag(:,nt_track));
        maximum_unbalance(n_track)=max(Unb(:,nt_track));
        nt_track=nt_track+1;
    end


    % maximum_mva(n_track)=max(s_apprant_power_MVA_mag(:,n_track));

    % maximum_unbalance(n_track)=max(Unb(:,n_track));
    end
    figure;
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);
    
    if nn_track<N_TSS_O
        nn_track_name=nn_track;
        plot(tt_time/60,s_apprant_power_MVA_mag(:,nn_track))
    elseif nn_track==N_TSS_O
        outage_TSS_condition=zeros(length(s_apprant_power_MVA_mag(:,1)),1);
        nn_track_name=nn_track;
        plot(tt_time/60,outage_TSS_condition(:,1));
    else
        nn_track=nn_track-1
        nn_track_name=nn_track+1;
        plot(tt_time/60,s_apprant_power_MVA_mag(:,nn_track))
    end
    

    title(['MVA profile of TSS number ',num2str(nn_track_name)])
    xlabel('Time (minute)')
    ylabel('MVA')

    desired_filename = '../Plots_oTo/oTo_TSS_MVA_voltage_unbalance.png';
    saveas(gcf, desired_filename);

    maximum_mva
    maximum_unbalance
end