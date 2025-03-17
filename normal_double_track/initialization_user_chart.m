function initialization_user_chart(TSS, AT, SP)
    graphics_toolkit ("gnuplot")
    % %distance in km of all the TSSs measured from mumbai
    % TSS = [5 55 105 155 205 255 305 355 405 455 505];

    % %distance in km of all the ATs measured from mumbai
    % AT = [3 13 23 33 43	53 63 73 83	93 103 113 123 133 143 153 163 173 183 193 203 213 223 233 243 253 263 273 283 293 303 313 323 333 343 353 363 373 383 393 403 413 423 433 443 453 463 473 483 493 503 513];

    % %distance in km of all the Section Posts (SPs) measured from mumbai
    % SP=[30	80	130	180	230	280	330	380	430	480	530];
    % %It is assumed that in the middle of two consecutive TSSs, one SP is located
    % Create a figure handle
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', [100, 100, 1900, 1300]);

    TSS = num2cell(TSS);
    TSS = cell2mat(TSS);
    AT = num2cell(AT);
    AT = cell2mat(AT);
    SP = num2cell(SP);
    SP = cell2mat(SP);
    % Open the file for reading
    fileID = fopen('Mumbai_Sabarmati_each_stop_train_schedule (up_track).txt', 'r');

    % Initialize an empty cell array for numeric data rows
    dataRows = {};

    % Read each line and detect numeric data
    while ~feof(fileID)
        line = fgetl(fileID);  % Read a line as a string

        % Try converting the line to numeric data
        numericData = sscanf(line, '%f').';

        % If the line contains numeric data, store it as a row in dataRows
        if ~isempty(numericData)
            dataRows{end+1, 1} = numericData;  % Append the row to dataRows
        end
    end

    % Close the file
    fclose(fileID);

    % Convert the cell array to a 2D numeric array
    each_stop_train_data_up = cell2mat(dataRows);

    % Open the file for reading
    fileID = fopen('Mumbai_Sabarmati_rapid_train_schedule (up_track).txt', 'r');

    % Initialize an empty cell array for numeric data rows
    dataRows = {};

    % Read each line and detect numeric data
    while ~feof(fileID)
        line = fgetl(fileID);  % Read a line as a string

        % Try converting the line to numeric data
        numericData = sscanf(line, '%f').';

        % If the line contains numeric data, store it as a row in dataRows
        if ~isempty(numericData)
            dataRows{end+1, 1} = numericData;  % Append the row to dataRows
        end
    end

    % Close the file
    fclose(fileID);

    % Convert the cell array to a 2D numeric array
    rapid_train_data_up = cell2mat(dataRows);

    % Open the file for reading
    fileID = fopen('Sabarmati_Mumbai_each_stop_train_schedule (down_track).txt', 'r');

    % Initialize an empty cell array for numeric data rows
    dataRows = {};

    % Read each line and detect numeric data
    while ~feof(fileID)
        line = fgetl(fileID);  % Read a line as a string

        % Try converting the line to numeric data
        numericData = sscanf(line, '%f').';

        % If the line contains numeric data, store it as a row in dataRows
        if ~isempty(numericData)
            dataRows{end+1, 1} = numericData;  % Append the row to dataRows
        end
    end

    % Close the file
    fclose(fileID);

    % Convert the cell array to a 2D numeric array
    each_stop_train_data_down = cell2mat(dataRows);

    % Open the file for reading
    fileID = fopen('Sabarmati_Mumbai_rapid_train_schedule (down_track).txt', 'r');

    % Initialize an empty cell array for numeric data rows
    dataRows = {};

    % Read each line and detect numeric data
    while ~feof(fileID)
        line = fgetl(fileID);  % Read a line as a string

        % Try converting the line to numeric data
        numericData = sscanf(line, '%f').';

        % If the line contains numeric data, store it as a row in dataRows
        if ~isempty(numericData)
            dataRows{end+1, 1} = numericData;  % Append the row to dataRows
        end
    end

    % Close the file
    fclose(fileID);

    % Convert the cell array to a 2D numeric array
    rapid_train_data_down = cell2mat(dataRows);

    pkg load io; % Load the io package (needed for xlsread)

    % Read the Excel file
    train_simulation_data = dlmread('train simulation chart.csv', ',', 1, 0);

    train_number=train_simulation_data(:,1);  % train number
    track_type=train_simulation_data(:,2);  % track type (1-Up, 2-Down)
    train_type=train_simulation_data(:,3);  % train type (1-Each stop, 2-Rapid)
    start_time=train_simulation_data(:,4);  % train starting time (in minute)

    n_up_each_stop=0;  % total no. of up-track each stop trains (initialisation)
    n_up_rapid=0;  % total no. of up-track rapid trains (initialisation)
    n_down_each_stop=0;   % total no. of down-track each stop trains (initialisation)
    n_down_rapid=0;   % total no. of down-track rapid trains (initialisation)
    for ii=1:length(train_simulation_data)
        if (track_type(ii)==1 && train_type(ii)==1)
            n_up_each_stop=n_up_each_stop+1;
            train_number_up_each_stop(n_up_each_stop,1)=train_number(ii);  % up-track each stop train numbers
            start_time_up_each_stop(n_up_each_stop,1)=start_time(ii);   % up-track each stop train starting time (in minute)
        elseif (track_type(ii)==1 && train_type(ii)==2)
            n_up_rapid=n_up_rapid+1;
            train_number_up_rapid(n_up_rapid,1)=train_number(ii);  % up-track rapid train numbers
            start_time_up_rapid(n_up_rapid,1)=start_time(ii);   % up-track rapid train starting time (in minute)
        elseif (track_type(ii)==2 && train_type(ii)==1)
            n_down_each_stop=n_down_each_stop+1;
            train_number_down_each_stop(n_down_each_stop,1)=train_number(ii);  % down-track each stop train numbers
            start_time_down_each_stop(n_down_each_stop,1)=start_time(ii);  % down-track each stop train starting time (in minute)
        elseif (track_type(ii)==2 && train_type(ii)==2)
            n_down_rapid=n_down_rapid+1;
            train_number_down_rapid(n_down_rapid,1)=train_number(ii);  % down-track rapid train numbers
            start_time_down_rapid(n_down_rapid,1)=start_time(ii);  % down-track rapid train starting time (in minute)
        end
    end

    D_up_each_stop=each_stop_train_data_up(:,3)*1000;   %distance covered (m) at each second for up-track each stop train
    D_up_rapid=rapid_train_data_up(:,3)*1000;   %distance covered (m) at each second for up-track rapid train
    P_up_each_stop=each_stop_train_data_up(:,4)*1000;   %power consumed (kW) at each second for up-track each stop train
    P_up_rapid=rapid_train_data_up(:,4)*1000;   %power consumed (kW) at each second for up-track rapid train

    D_down_each_stop=each_stop_train_data_down(:,3)*1000;   %distance covered (m) at each second for down-track each stop train
    D_down_rapid=rapid_train_data_down(:,3)*1000;   %distance covered (m) at each second for down-track rapid train
    track_length=max(D_down_each_stop(end),D_down_rapid(end))/1000;  % track length (kM)
    P_down_each_stop=each_stop_train_data_down(:,4)*1000;   %power consumed (kW) at each second for down-track each stop train
    P_down_rapid=rapid_train_data_down(:,4)*1000;   %power consumed (kW) at each second for down-track rapid train

    train_time_each_stop_up=size(each_stop_train_data_up,1);  % total time (sec) taken by the each stop train to complete the route in up-track
    train_time_rapid_up=size(rapid_train_data_up,1);  % total time (sec) taken by the rapid train to complete the route in up-track
    train_time_each_stop_down=size(each_stop_train_data_down,1);  % total time (sec) taken by the each stop train to complete the route in down-track
    train_time_rapid_down=size(rapid_train_data_down,1);  % total time (sec) taken by the rapid train to complete the route in down-track

    y1=max(start_time_up_each_stop)*60+train_time_each_stop_up;
    y2=max(start_time_up_rapid)*60+train_time_rapid_up;
    y3=max(start_time_down_each_stop)*60+train_time_each_stop_down;
    y4=max(start_time_down_rapid)*60+train_time_rapid_down;
    y=max([y1,y2,y3,y4]);  % total time duration (seconds) of train scheduling (or) train simulation time (seconds)

    z_up_each_stop=n_up_each_stop+1;   %no. of columns
    distance_up_each_stop=zeros(y,z_up_each_stop);
    power_up_each_stop=-100*ones(y,z_up_each_stop);

    z_up_rapid=n_up_rapid+1;   %no. of columns
    distance_up_rapid=zeros(y,z_up_rapid);
    power_up_rapid=-100*ones(y,z_up_rapid);

    z_up=z_up_each_stop+z_up_rapid-1;  %no. of columns
    distance_up=zeros(y,z_up);
    power_up=-100*ones(y,z_up);

    z_down_each_stop=n_down_each_stop+1;   %no. of columns
    distance_down_each_stop=zeros(y,z_down_each_stop);
    power_down_each_stop=-100*ones(y,z_down_each_stop);

    z_down_rapid=n_down_rapid+1;   %no. of columns
    distance_down_rapid=zeros(y,z_down_rapid);
    power_down_rapid=-100*ones(y,z_down_rapid);

    z_down=z_down_each_stop+z_down_rapid-1;  %no. of columns
    distance_down=zeros(y,z_down);
    power_down=-100*ones(y,z_down);

    for t=1:y
        distance_up_each_stop(t,1)=t;   %time column of distance matrix
        power_up_each_stop(t,1)=t;   %time column of power matrix
        distance_up_rapid(t,1)=t;   %time column of distance matrix
        power_up_rapid(t,1)=t;   %time column of power matrix
        distance_up(t,1)=t;  %time column of distance matrix for up-track
        power_up(t,1)=t;  %time column of power matrix for up-track
        distance_down_each_stop(t,1)=t;   %time column of distance matrix
        power_down_each_stop(t,1)=t;   %time column of power matrix
        distance_down_rapid(t,1)=t;   %time column of distance matrix
        power_down_rapid(t,1)=t;   %time column of power matrix
        distance_down(t,1)=t;  %time column of distance matrix for down-track
        power_down(t,1)=t;  %time column of power matrix for down-track
    end

    % Create distinct colors using the 'hsv' colormap
    colors = hsv(length(train_number));

    colorIndex = 1;  % Initialize color index

    % Plot for up-track each-stop trains
    for j = 1:n_up_each_stop
        p = 1 + start_time_up_each_stop(j) * 60; % Starting time in seconds
        q = p + train_time_each_stop_up - 1;     % Ending time in seconds

        distance_up_each_stop(p:q,(j+1))=D_up_each_stop;
        power_up_each_stop(p:q,(j+1))=P_up_each_stop;
        dist=distance_up_each_stop(p:q,j+1)./1000;  % train distance (km)
        time=distance_up_each_stop(p:q,1)./60;  % time (minute)

        % Plot distance vs time with unique color
        plot(dist, time, 'Color', colors(colorIndex, :), 'LineWidth', 1.5)

        % Annotate train label at the beginning of the line
        text(dist(1), time(1), sprintf('Train %d', train_number_up_each_stop(j)), ...
            'FontSize', 9, 'FontWeight', 'bold', 'Color', colors(colorIndex, :), ...
            'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom');

        % Update index for next train
        colorIndex = mod(colorIndex, size(colors, 1)) + 1;
        hold on
    end

    % Plot for up-track rapid trains
    for j = 1:n_up_rapid
        p = 1 + start_time_up_rapid(j) * 60; % Starting time in seconds
        q = p + train_time_rapid_up - 1;     % Ending time in seconds

        distance_up_rapid(p:q,(j+1))=D_up_rapid;
        power_up_rapid(p:q,(j+1))=P_up_rapid;
        dist=distance_up_rapid(p:q,j+1)./1000;  % train distance (km)
        time=distance_up_rapid(p:q,1)./60;  % time (minute)

        % Plot distance vs time with unique color
        plot(dist, time, 'Color', colors(colorIndex, :), 'LineWidth', 1.5)

        % Annotate train label at the beginning of the line
        text(dist(1), time(1), sprintf('Train %d', train_number_up_rapid(j)), ...
            'FontSize', 9, 'FontWeight', 'bold', 'Color', colors(colorIndex, :), ...
            'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom');

        % Update index for next train
        colorIndex = mod(colorIndex, size(colors, 1)) + 1;
        hold on
    end

    % Plot for down-track each-stop trains
    for j = 1:n_down_each_stop
        p = 1 + start_time_down_each_stop(j) * 60; % Starting time in seconds
        q = p + train_time_each_stop_down - 1;     % Ending time in seconds

        distance_down_each_stop(p:q,(j+1))=(track_length*1000)-D_down_each_stop;
        power_down_each_stop(p:q,(j+1))=P_down_each_stop;
        dist=distance_down_each_stop(p:q,j+1)./1000;  % train distance (km)
        time=distance_down_each_stop(p:q,1)./60;  % time (minute)

        % Plot distance vs time with unique color
        plot(dist, time, 'Color', colors(colorIndex, :), 'LineWidth', 1.5)

        % Annotate train label at the beginning of the line
        text(dist(1), time(1), sprintf('Train %d', train_number_down_each_stop(j)), ...
            'FontSize', 9, 'FontWeight', 'bold', 'Color', colors(colorIndex, :), ...
            'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom');

        % Update index for next train
        colorIndex = mod(colorIndex, size(colors, 1)) + 1;
        hold on
    end

    % Plot for down-track rapid trains
    for j = 1:n_down_rapid
        p = 1 + start_time_down_rapid(j) * 60; % Starting time in seconds
        q = p + train_time_rapid_down - 1;     % Ending time in seconds

        distance_down_rapid(p:q,(j+1))=(track_length*1000)-D_down_rapid;
        power_down_rapid(p:q,(j+1))=P_down_rapid;
        dist=distance_down_rapid(p:q,j+1)./1000;  % train distance (km)
        time=distance_down_rapid(p:q,1)./60;  % time (minute)

        % Plot distance vs time with unique color
        plot(dist, time, 'Color', colors(colorIndex, :), 'LineWidth', 1.5)

        % Annotate train label at the beginning of the line
        text(dist(1), time(1), sprintf('Train %d', train_number_down_rapid(j)), ...
            'FontSize', 9, 'FontWeight', 'bold', 'Color', colors(colorIndex, :), ...
            'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom');

        % Update index for next train
        colorIndex = mod(colorIndex, size(colors, 1)) + 1;
        hold on
    end

    set(gca,'YDir','reverse')
    xlim([0,track_length])
    ylim([0,y/60])
    % tick_1=start_time_up_each_stop;
    % tick_2=start_time_up_rapid;
    % tick_3=start_time_down_each_stop;
    % tick_4=start_time_down_rapid;
    % ticks=unique([tick_1',tick_2',tick_3',tick_4']);
    ticks=0:10:y/60;
    yticks(ticks)
    xlabel('Distance (km)','FontWeight','bold')
    ylabel('Time (minute)','FontWeight','bold')
    grid on
    set(gca, 'FontSize', 12);

    for ii=1:y
        A=distance_up_each_stop(ii,2:end);
        A=A(A>0);
        B=distance_up_rapid(ii,2:end);
        B=B(B>0);
        C=[A,B];
        col=size(C,2);
        distance_up(ii,2:col+1)=C;
        AA=power_up_each_stop(ii,2:end);
        AA=AA(AA~=-100);
        BB=power_up_rapid(ii,2:end);
        BB=BB(BB~=-100);
        CC=[AA,BB];
        col1=size(CC,2);
        power_up(ii,2:col1+1)=CC;
        AAA=distance_down_each_stop(ii,2:end);
        AAA=AAA(AAA>0);
        BBB=distance_down_rapid(ii,2:end);
        BBB=BBB(BBB>0);
        CCC=[AAA,BBB];
        col2=size(CCC,2);
        distance_down(ii,2:col2+1)=CCC;
        AAAA=power_down_each_stop(ii,2:end);
        AAAA=AAAA(AAAA~=-100);
        BBBB=power_down_rapid(ii,2:end);
        BBBB=BBBB(BBBB~=-100);
        CCCC=[AAAA,BBBB];
        col3=size(CCCC,2);
        power_down(ii,2:col3+1)=CCCC;
    end

    AT=AT*10^3;   %distance of ATs in meters
    TSS=TSS*10^3;   %distance of TSSs in meters
    SP=SP*10^3;   %distance of SPs in meters
    N_TSS=length(TSS);  %no. of TSS
    l_a=2*N_TSS;  % number of windings
    d(1)=0; %starting point
    d(2:2:l_a)=TSS;
    d(3:2:l_a+1)=SP;
    %distance (in meter) of all the TSSs and the section posts measured from Mumbai i.e. [0 TSS1 SP1 TSS2 SP2..........TSSn SPn].
    desired_filename = '../Plots_normal/Simulation_Chart.png';
    saveas(gcf, desired_filename);
end




