function sub_station_current_plot(sub_station_catenary_current,sub_station_feeder_current)    
    % ##clc
    % ##clear all
    tic
    % load('required_variable_load_flow_standard.mat')
    %pkg uninstall matgeom
    %pkg install -forge matgeom
    graphics_toolkit ("gnuplot")
    pkg load mapping

    li_len=length(sub_station_catenary_current);
    for li=1:1:li_len
        sub_station_current_catenary_ang(li)=angle(sub_station_catenary_current(li))*180/pi;
        cat_current_angle(li)=wrapTo360(sub_station_current_catenary_ang(li));
        if cat_current_angle(li)>90 && cat_current_angle(li)<270
            sub_station_catenary_current_abs(li)=-abs(sub_station_catenary_current(li))*1000;
        else
            sub_station_catenary_current_abs(li)=abs(sub_station_catenary_current(li))*1000;
        end
        sub_station_current_feeder_ang(li)=angle(sub_station_feeder_current(li))*180/pi;
        fed_current_angle(li)=wrapTo360(sub_station_current_feeder_ang(li));
        if fed_current_angle(li)>90 && fed_current_angle(li)<270
            sub_station_feeder_current_abs(li)=abs(sub_station_feeder_current(li))*1000;
        else
            sub_station_feeder_current_abs(li)=-abs(sub_station_feeder_current(li))*1000;
        end

    end

    % Create a figure handle
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);

    plot(sub_station_catenary_current_abs);
    hold on
    plot(sub_station_feeder_current_abs);
    xlabel('Time (sec)','FontWeight','bold')
    ylabel('Current Magnitude (Amp)','FontWeight','bold')
    legend('contact line total current','negative feeder total current','FontWeight','bold')
    set(gca, 'FontSize', 16);

    desired_filename = '../Plots/sub_station_current.png';
    saveas(gcf, desired_filename);
    toc
end