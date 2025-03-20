function Train_contact_terminal_THD(entered_train_number, train_number, track_type, train_type, start_time, each_stop_train_data_up, rapid_train_data_up, each_stop_train_data_down, rapid_train_data_down, track_length, d, dTSS_up, dTSS_down, N_TSS, y)
    tic

    % This .mat file is generated after performing harmonic analysis
    load("harmonic_analysis_variables.mat","THD_C_T_up","THD_C_M_up","THD_C_T_down","THD_C_M_down")

    % These text files are generated after executing the load flow under normal condition
    % train_number=load("train_number.txt");
    % track_type = load("track_type.txt");
    % train_type = load("train_type.txt");
    % start_time = load("start_time.txt");
    % each_stop_train_data_up = load("each_stop_train_data_up.txt");
    % rapid_train_data_up = load("rapid_train_data_up.txt");
    % each_stop_train_data_down = load("each_stop_train_data_down.txt");
    % rapid_train_data_down = load("rapid_train_data_down.txt");
    % track_length = load("track_length.txt");
    % d=load("d.txt");
    % dTSS_up=load("dTSS_up.txt");
    % dTSS_down=load("dTSS_down.txt");
    % N_TSS=load("N_TSS.txt");
    % y=load("y.txt");

    %Up-track contact wire THD (percentage) of all windings along the track for entire time instant of operation
    THD_C_up_track=-10*ones(2*N_TSS*y,15);
    %Down-track contact wire THD (percentage) of all windings along the track for entire time instant of operation
    THD_C_down_track=-10*ones(2*N_TSS*y,15);

    %Suppose Teaser winding is the 1st winding from mumbai (starting point)
    winding_position=0;
    check=1;
    count_T=1;
    count_M=1;

    for ii=1:2*N_TSS*y
        if ii==(2*winding_position+1)*y+1
            check=check+1;
            winding_position=winding_position+1;
        end
        condition_odd=mod(check,2);
        if (condition_odd==1)
            THD_C_up_track(ii,:)=THD_C_T_up(count_T,:);
            count_T=count_T+1;
        else
            THD_C_up_track(ii,:)=THD_C_M_up(count_M,:);
            count_M=count_M+1;
        end
    end

    winding_position_1=0;
    check_1=1;
    count_T_1=1;
    count_M_1=1;

    for ii=1:2*N_TSS*y
        if ii==(2*winding_position_1+1)*y+1
            check_1=check_1+1;
            winding_position_1=winding_position_1+1;
        end
        condition_odd=mod(check_1,2);
        if (condition_odd==1)
            THD_C_down_track(ii,:)=THD_C_T_down(count_T_1,:);
            count_T_1=count_T_1+1;
        else
            THD_C_down_track(ii,:)=THD_C_M_down(count_M_1,:);
            count_M_1=count_M_1+1;
        end
    end

    % Contact terminal voltage THD profile of a particular train

    % Display available train numbers
    fprintf('Available train numbers: ');
    fprintf('%d ', train_number);
    fprintf('\n');

    % This is to be taken from the user
    % entered_train_number = input('Enter the train number to see its Contact terminal voltage THD profile: ');

    % Check if the entered train number exists in the list
    if ismember(entered_train_number, train_number)
        fprintf('Train number %d exists. Displaying its Contact terminal voltage THD profile...\n', entered_train_number);

        entered_train_indx=find(entered_train_number==train_number);
        entered_track_type=track_type(entered_train_indx);   % Track type (1=up or 2=down) of the entered train number
        entered_train_type=train_type(entered_train_indx);   % Train type (1=each-stop or 2=rapid) of the entered train number
        entered_train_starting_time=start_time(entered_train_indx);  % Starting time (minute) of the entered train number

        if (entered_track_type==1 && entered_train_type==1)  % Up-track each-stop train

            % Array initialization
            train_time_instant=zeros(length(each_stop_train_data_up(:,1)),1);
            train_distance_from_start=zeros(length(each_stop_train_data_up(:,1)),1);
            THD_Train_C=zeros(length(each_stop_train_data_up(:,1)),1);

            for t_i=1:length(each_stop_train_data_up(:,1))
                train_time_instant(t_i)=each_stop_train_data_up(t_i,1)+entered_train_starting_time*60;  % Time instant (second)
                train_distance_from_start(t_i)=each_stop_train_data_up(t_i,3)*1000;   % Distance (m) of the train at each time instant
                for ii=1:2:length(d)-1
                    if (train_distance_from_start(t_i)>d(ii) && train_distance_from_start(t_i)<=d(ii+1))
                        train_check=d(ii+1)-train_distance_from_start(t_i);
                        for i_a=1:length(nonzeros(dTSS_up((ii-1)*y+train_time_instant(t_i),:)))
                            if (abs(sum(dTSS_up((ii-1)*y+train_time_instant(t_i),1:i_a))-train_check)<1e-5)
                                train_node=i_a+1;
                            end
                        end
                        THD_Train_C(t_i)=THD_C_up_track((ii-1)*y+train_time_instant(t_i),train_node);
                    elseif (train_distance_from_start(t_i)>d(ii+1) && train_distance_from_start(t_i)<=d(ii+2))
                        for i_a=1:length(nonzeros(dTSS_up(ii*y+train_time_instant(t_i),:)))
                            if (abs(train_distance_from_start(t_i)-(d(ii+1)+sum(dTSS_up(ii*y+train_time_instant(t_i),1:i_a))))<1e-5)
                                train_node=i_a+1;
                            end
                        end
                        THD_Train_C(t_i)=THD_C_up_track(ii*y+train_time_instant(t_i),train_node);
                    end
                end
            end

        elseif (entered_track_type==1 && entered_train_type==2)  % Up-track rapid train

            % Array initialization
            train_time_instant=zeros(length(rapid_train_data_up(:,1)),1);
            train_distance_from_start=zeros(length(rapid_train_data_up(:,1)),1);
            THD_Train_C=zeros(length(rapid_train_data_up(:,1)),1);

            for t_i=1:length(rapid_train_data_up(:,1))
                train_time_instant(t_i)=rapid_train_data_up(t_i,1)+entered_train_starting_time*60;  % Time instant (second)
                train_distance_from_start(t_i)=rapid_train_data_up(t_i,3)*1000;   % Distance (m) of the train at each time instant
                for ii=1:2:length(d)-1
                    if (train_distance_from_start(t_i)>d(ii) && train_distance_from_start(t_i)<=d(ii+1))
                        train_check=d(ii+1)-train_distance_from_start(t_i);
                        for i_a=1:length(nonzeros(dTSS_up((ii-1)*y+train_time_instant(t_i),:)))
                            if (abs(sum(dTSS_up((ii-1)*y+train_time_instant(t_i),1:i_a))-train_check)<1e-5)
                                train_node=i_a+1;
                            end
                        end
                        THD_Train_C(t_i)=THD_C_up_track((ii-1)*y+train_time_instant(t_i),train_node);
                    elseif (train_distance_from_start(t_i)>d(ii+1) && train_distance_from_start(t_i)<=d(ii+2))
                        for i_a=1:length(nonzeros(dTSS_up(ii*y+train_time_instant(t_i),:)))
                            if (abs(train_distance_from_start(t_i)-(d(ii+1)+sum(dTSS_up(ii*y+train_time_instant(t_i),1:i_a))))<1e-5)
                                train_node=i_a+1;
                            end
                        end
                        THD_Train_C(t_i)=THD_C_up_track(ii*y+train_time_instant(t_i),train_node);
                    end
                end
            end

        elseif (entered_track_type==2 && entered_train_type==1)  % Down-track each-stop train

            % Array initialization
            train_time_instant=zeros(length(each_stop_train_data_down(:,1)),1);
            train_distance_from_start=zeros(length(each_stop_train_data_down(:,1)),1);
            THD_Train_C=zeros(length(each_stop_train_data_down(:,1)),1);

            for t_i=1:length(each_stop_train_data_down(:,1))
                train_time_instant(t_i)=each_stop_train_data_down(t_i,1)+entered_train_starting_time*60;  % Time instant (second)
                train_distance_from_start(t_i)=(track_length-each_stop_train_data_down(t_i,3))*1000;   % Distance (m) of the train at each time instant
                for ii=1:2:length(d)-1
                    if (train_distance_from_start(t_i)>d(ii) && train_distance_from_start(t_i)<=d(ii+1))
                        train_check=d(ii+1)-train_distance_from_start(t_i);
                        for i_a=1:length(nonzeros(dTSS_down((ii-1)*y+train_time_instant(t_i),:)))
                            if (abs(sum(dTSS_down((ii-1)*y+train_time_instant(t_i),1:i_a))-train_check)<1e-5)
                                train_node=i_a+1;
                            end
                        end
                        THD_Train_C(t_i)=THD_C_down_track((ii-1)*y+train_time_instant(t_i),train_node);
                    elseif (train_distance_from_start(t_i)>d(ii+1) && train_distance_from_start(t_i)<=d(ii+2))
                        for i_a=1:length(nonzeros(dTSS_down(ii*y+train_time_instant(t_i),:)))
                            if (abs(train_distance_from_start(t_i)-(d(ii+1)+sum(dTSS_down(ii*y+train_time_instant(t_i),1:i_a))))<1e-5)
                                train_node=i_a+1;
                            end
                        end
                        THD_Train_C(t_i)=THD_C_down_track(ii*y+train_time_instant(t_i),train_node);
                    end
                end
            end

        elseif (entered_track_type==2 && entered_train_type==2)  % Down-track rapid train

            % Array initialization
            train_time_instant=zeros(length(rapid_train_data_down(:,1)),1);
            train_distance_from_start=zeros(length(rapid_train_data_down(:,1)),1);
            THD_Train_C=zeros(length(rapid_train_data_down(:,1)),1);

            for t_i=1:length(rapid_train_data_down(:,1))
                train_time_instant(t_i)=rapid_train_data_down(t_i,1)+entered_train_starting_time*60;  % Time instant (second)
                train_distance_from_start(t_i)=(track_length-rapid_train_data_down(t_i,3))*1000;   % Distance (m) of the train at each time instant
                for ii=1:2:length(d)-1
                    if (train_distance_from_start(t_i)>d(ii) && train_distance_from_start(t_i)<=d(ii+1))
                        train_check=d(ii+1)-train_distance_from_start(t_i);
                        for i_a=1:length(nonzeros(dTSS_down((ii-1)*y+train_time_instant(t_i),:)))
                            if (abs(sum(dTSS_down((ii-1)*y+train_time_instant(t_i),1:i_a))-train_check)<1e-5)
                                train_node=i_a+1;
                            end
                        end
                        THD_Train_C(t_i)=THD_C_down_track((ii-1)*y+train_time_instant(t_i),train_node);
                    elseif (train_distance_from_start(t_i)>d(ii+1) && train_distance_from_start(t_i)<=d(ii+2))
                        for i_a=1:length(nonzeros(dTSS_down(ii*y+train_time_instant(t_i),:)))
                            if (abs(train_distance_from_start(t_i)-(d(ii+1)+sum(dTSS_down(ii*y+train_time_instant(t_i),1:i_a))))<1e-5)
                                train_node=i_a+1;
                            end
                        end
                        THD_Train_C(t_i)=THD_C_down_track(ii*y+train_time_instant(t_i),train_node);
                    end
                end
            end
        end
        graphics_toolkit ("gnuplot")
        figureHandle = figure;
        screenSize = get(0, 'ScreenSize');
        
        set(figureHandle, 'Position', screenSize);

        figure('Name','Contact terminal voltage THD profile of a particular train')
        plot(train_time_instant/60,THD_Train_C)
        title(['Contact terminal voltage THD profile of Train ',num2str(entered_train_number)])
        xlabel('Travel time (minute)')
        ylabel('Contact terminal voltage THD (%)')
        allAxes = findall(gcf, 'Type', 'axes'); % Find all axes in the current figure
        set(allAxes, 'FontSize', 12, 'FontWeight', 'bold'); % Set font size and weight
        allLines = findall(gcf, 'Type', 'line'); % Find all line objects in the figure
        set(allLines, 'LineWidth', 1.5);          % Set the line width to 1.5
                
        desired_filename = '../../Plots_harmonic/Train_contact_terminal_THD_normal.png';
        saveas(gcf, desired_filename);
    else
        fprintf('Invalid train number. Please enter a valid train number.\n');
    end

    toc
end