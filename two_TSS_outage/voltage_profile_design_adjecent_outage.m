length_profile_T=length(Voltage_distance_matrix_T);
length_profile_M=length(Voltage_distance_matrix_M);
total_length_profile=length_profile_M+length_profile_T;
profile_winding_position=1;
profile_check=0;
n_winding_T=1;
n_winding_M=1;

% voltage_matrix_index=1;
for jj_track_no=1:1:length(d_modified)


    condition_odd_winding=mod(profile_winding_position,2);
    if condition_odd_winding==1
        check_TandM=fix(profile_winding_position/2);        %inversion
        condition_odd_check_TandM=mod(check_TandM,2);
        if condition_odd_check_TandM==0
            %teaser
            kk_pos=fix(winding_length_T(n_winding_T)/x_reso);
            for K_position=1:1:fix(winding_length_T(n_winding_T)/x_reso)
                Voltage_distance_matrix_whole(K_position+fix(d1(jj_track_no)/x_reso),1)=winding_length_T(n_winding_T)-Voltage_distance_matrix_T(kk_pos+sum(points_index(1:(n_winding_T))),1)+d1(jj_track_no);
                Voltage_distance_matrix_whole(K_position+fix(d1(jj_track_no)/x_reso),2)=Voltage_distance_matrix_T(kk_pos+sum(points_index(1:(n_winding_T))),2);
                Voltage_distance_matrix_whole(K_position+fix(d1(jj_track_no)/x_reso),3)=Voltage_distance_matrix_T(kk_pos+sum(points_index(1:(n_winding_T))),3);
                Voltage_distance_matrix_whole(K_position+fix(d1(jj_track_no)/x_reso),4)=Voltage_distance_matrix_T(kk_pos+sum(points_index(1:(n_winding_T))),4);
                kk_pos=kk_pos-1;
            end
            n_winding_T=n_winding_T+1;
        end
        if condition_odd_check_TandM==1
            % main
            kk_pos=fix(winding_length_M(n_winding_M)/x_reso);
            for K_position=1:1:fix(winding_length_M(n_winding_M)/x_reso)
                Voltage_distance_matrix_whole(K_position+fix(d1(jj_track_no)/x_reso),1)=winding_length_M(n_winding_M)-Voltage_distance_matrix_M(kk_pos+sum(points_index_M(1:(n_winding_M))),1)+d1(jj_track_no);
                Voltage_distance_matrix_whole(K_position+fix(d1(jj_track_no)/x_reso),2)=Voltage_distance_matrix_M(kk_pos+sum(points_index_M(1:(n_winding_M))),2);
                Voltage_distance_matrix_whole(K_position+fix(d1(jj_track_no)/x_reso),3)=Voltage_distance_matrix_M(kk_pos+sum(points_index_M(1:(n_winding_M))),3);
                Voltage_distance_matrix_whole(K_position+fix(d1(jj_track_no)/x_reso),4)=Voltage_distance_matrix_M(kk_pos+sum(points_index_M(1:(n_winding_M))),4);
                kk_pos=kk_pos-1;
            end
            n_winding_M=n_winding_M+1;
        end

    end
    if condition_odd_winding==0
        check_TandM=fix(profile_winding_position/2);        % no inversion
        condition_odd_check_TandM=mod(check_TandM,2);
        if condition_odd_check_TandM==0
            for K_position=1:1:fix(winding_length_T(n_winding_T)/x_reso)          %teaser
                Voltage_distance_matrix_whole(K_position+fix(d1(jj_track_no)/x_reso),1)=Voltage_distance_matrix_T(K_position+sum(points_index(1:(n_winding_T))),1)+d1(jj_track_no);
                Voltage_distance_matrix_whole(K_position+fix(d1(jj_track_no)/x_reso),2)=Voltage_distance_matrix_T(K_position+sum(points_index(1:(n_winding_T))),2);
                Voltage_distance_matrix_whole(K_position+fix(d1(jj_track_no)/x_reso),3)=Voltage_distance_matrix_T(K_position+sum(points_index(1:(n_winding_T))),3);
                Voltage_distance_matrix_whole(K_position+fix(d1(jj_track_no)/x_reso),4)=Voltage_distance_matrix_T(K_position+sum(points_index(1:(n_winding_T))),4);
            end
            n_winding_T=n_winding_T+1;

        end
        if condition_odd_check_TandM==1
            for K_position=1:1:fix(winding_length_M(n_winding_M)/x_reso)
                % main
                Voltage_distance_matrix_whole(K_position+fix(d1(jj_track_no)/x_reso),1)=Voltage_distance_matrix_M(K_position+sum(points_index_M(1:(n_winding_M))),1)+d1(jj_track_no);
                Voltage_distance_matrix_whole(K_position+fix(d1(jj_track_no)/x_reso),2)=Voltage_distance_matrix_M(K_position+sum(points_index_M(1:(n_winding_M))),2);
                Voltage_distance_matrix_whole(K_position+fix(d1(jj_track_no)/x_reso),3)=Voltage_distance_matrix_M(K_position+sum(points_index_M(1:(n_winding_M))),3);
                Voltage_distance_matrix_whole(K_position+fix(d1(jj_track_no)/x_reso),4)=Voltage_distance_matrix_M(K_position+sum(points_index_M(1:(n_winding_M))),4);

            end

            n_winding_M=n_winding_M+1;
        end

    end
    profile_winding_position=profile_winding_position+1;

end

figureHandle = figure;

    % Get screen size from root object (0)
screenSize = get(0, 'ScreenSize');

% Set the figure to match the screen size
set(figureHandle, 'Position', [100, 100, 2500, 2000]);

subplot(3,1,1)
plot((Voltage_distance_matrix_whole(:,1)/1000),abs(Voltage_distance_matrix_whole(:,2)));
title('Contact wire Voltage magnitude')
xlabel('Distance (kM)')
ylabel('Voltage magnitude (kV)')
%set(gca,'XTick',[5 55 105 155 205 255 305 355 405 455 505],'XTickLabel',{'TSS','TSS','TSS','TSS','TSS','TSS','TSS','TSS','TSS','TSS','TSS'})
 subplot(3,1,2)
plot((Voltage_distance_matrix_whole(:,1)/1000),abs(Voltage_distance_matrix_whole(:,3)));
title('Rail wire Voltage magnitude')
xlabel('Distance (kM)')
ylabel('Voltage magnitude (kV)')
subplot(3,1,3)
plot((Voltage_distance_matrix_whole(:,1)/1000),abs(Voltage_distance_matrix_whole(:,4)));
title('Feeder wire Voltage magnitude')
xlabel('Distance (kM)')
ylabel('Voltage magnitude (kV)')

desired_filename = '../Plots_tTo/tTo_voltage_profile_full_track.png';  % Replace 'desired_name' with your file name
saveas(gcf, desired_filename);