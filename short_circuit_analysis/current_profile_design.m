current_length_profile_T=length(current_distance_matrix_T);
current_length_profile_M=length(current_distance_matrix_M);
total_length_profile=current_length_profile_M+current_length_profile_T;
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
                current_distance_matrix_whole(K_position+fix(d(jj_track_no)/x_reso),1)=winding_length_T(n_winding_T)-current_distance_matrix_T(kk_pos+sum(points_index(1:(n_winding_T))),1)+d(jj_track_no);
                current_distance_matrix_whole(K_position+fix(d(jj_track_no)/x_reso),2)=current_distance_matrix_T(kk_pos+sum(points_index(1:(n_winding_T))),2);
                current_distance_matrix_whole(K_position+fix(d(jj_track_no)/x_reso),3)=current_distance_matrix_T(kk_pos+sum(points_index(1:(n_winding_T))),3);
                current_distance_matrix_whole(K_position+fix(d(jj_track_no)/x_reso),4)=current_distance_matrix_T(kk_pos+sum(points_index(1:(n_winding_T))),4);
                kk_pos=kk_pos-1;
            end
            n_winding_T=n_winding_T+1;
        end
        if condition_odd_check_TandM==1
            % main
            kk_pos=fix(winding_length_M(n_winding_M)/x_reso);
            for K_position=1:1:fix(winding_length_M(n_winding_M)/x_reso)
                current_distance_matrix_whole(K_position+fix(d(jj_track_no)/x_reso),1)=winding_length_M(n_winding_M)-current_distance_matrix_M(kk_pos+sum(points_index_M(1:(n_winding_M))),1)+d(jj_track_no);
                current_distance_matrix_whole(K_position+fix(d(jj_track_no)/x_reso),2)=current_distance_matrix_M(kk_pos+sum(points_index_M(1:(n_winding_M))),2);
                current_distance_matrix_whole(K_position+fix(d(jj_track_no)/x_reso),3)=current_distance_matrix_M(kk_pos+sum(points_index_M(1:(n_winding_M))),3);
                current_distance_matrix_whole(K_position+fix(d(jj_track_no)/x_reso),4)=current_distance_matrix_M(kk_pos+sum(points_index_M(1:(n_winding_M))),4);
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
                current_distance_matrix_whole(K_position+fix(d(jj_track_no)/x_reso),1)=current_distance_matrix_T(K_position+sum(points_index(1:(n_winding_T))),1)+d(jj_track_no);
                current_distance_matrix_whole(K_position+fix(d(jj_track_no)/x_reso),2)=current_distance_matrix_T(K_position+sum(points_index(1:(n_winding_T))),2);
                current_distance_matrix_whole(K_position+fix(d(jj_track_no)/x_reso),3)=current_distance_matrix_T(K_position+sum(points_index(1:(n_winding_T))),3);
                current_distance_matrix_whole(K_position+fix(d(jj_track_no)/x_reso),4)=current_distance_matrix_T(K_position+sum(points_index(1:(n_winding_T))),4);
            end
            n_winding_T=n_winding_T+1;

        end
        if condition_odd_check_TandM==1
            for K_position=1:1:fix(winding_length_M(n_winding_M)/x_reso)
                % main
                current_distance_matrix_whole(K_position+fix(d(jj_track_no)/x_reso),1)=current_distance_matrix_M(K_position+sum(points_index_M(1:(n_winding_M))),1)+d(jj_track_no);
                current_distance_matrix_whole(K_position+fix(d(jj_track_no)/x_reso),2)=current_distance_matrix_M(K_position+sum(points_index_M(1:(n_winding_M))),2);
                current_distance_matrix_whole(K_position+fix(d(jj_track_no)/x_reso),3)=current_distance_matrix_M(K_position+sum(points_index_M(1:(n_winding_M))),3);
                current_distance_matrix_whole(K_position+fix(d(jj_track_no)/x_reso),4)=current_distance_matrix_M(K_position+sum(points_index_M(1:(n_winding_M))),4);

            end

            n_winding_M=n_winding_M+1;
        end

    end
    profile_winding_position=profile_winding_position+1;

end

graphics_toolkit ("gnuplot")
figureHandle = figure;
screenSize = get(0, 'ScreenSize');

set(figureHandle, 'Position', [100, 100, 1830, 1300]);

subplot(3,1,1)
plot((current_distance_matrix_whole(:,1)/1000),abs(current_distance_matrix_whole(:,2)));
title('Contact wire current magnitude')
xlabel('Distance (kM)','FontWeight','bold')
ylabel('current magnitude (kA)','FontWeight','bold')
%set(gca,'XTick',[5 55 105 155 205 255 305 355 405 455 505],'XTickLabel',{'TSS','TSS','TSS','TSS','TSS','TSS','TSS','TSS','TSS','TSS','TSS'})
 subplot(3,1,2)
plot((current_distance_matrix_whole(:,1)/1000),abs(current_distance_matrix_whole(:,3)));
title('Rail current magnitude')
xlabel('Distance (kM)','FontWeight','bold')
ylabel('current magnitude (kA)','FontWeight','bold')
subplot(3,1,3)
plot((current_distance_matrix_whole(:,1)/1000),abs(current_distance_matrix_whole(:,4)));
title('Feeder wire current magnitude')
xlabel('Distance (kM)','FontWeight','bold')
ylabel('current magnitude (kA)','FontWeight','bold')

desired_filename = '../Plots_SCA/current_profile.png';
saveas(gcf, desired_filename);