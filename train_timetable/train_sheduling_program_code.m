function train_sheduling_program_code(M, g, delt, eff, m_decl, a, b, c, max_speed, sect)

    max_speed = cell2mat(max_speed);
    sect = cell2mat(sect);

    global train_prof;

    %initial GA data

    % input train data
    train_data;
    % input track data
    track_data_common_rectified;
    yy=0;
    for i_section=sect:sect
        % section_calculate(i_section);
        section_calculate;
        % init_data_seed;

        % fprintf('calculating %s - %s position-power curve through optimization.......\n....Please wait ......\n', station_names{i_section}, station_names{i_section+1});
        % dura = section_duration(i_section)*60;
        % time_var = operation_mode_number(i_section);    % total  time variables or number of operation
        % start_distance = station_distances(i_section);
        % end_distance = station_distances(i_section + 1);

        % speed_limits_sec=zeros(1,limits_count_per_segment(i_section));
        % speed_limit_st_sec=zeros(1,limits_count_per_segment(i_section));
        % speed_limit_end_sec=zeros(1,limits_count_per_segment(i_section));
        % i_ss=1;
        % for i_sp_lim=1:length(start_pt_limit)
        %     %         if start_pt_limit(i_sp_lim)>=start_section_distance(i_section) && (end_pt_limit(i_sp_lim)<=end_section_distance(i_section)||start_pt_limit(i_sp_lim)<=end_section_distance(i_section)&& end_pt_limit(i_sp_lim)>=end_section_distance(i_section))
        %     if (start_pt_limit(i_sp_lim) <= end_distance && end_pt_limit(i_sp_lim) >= start_distance)
        %         speed_limits_sec(i_ss)=speed_limit(i_sp_lim);
        %         speed_limit_st_sec(i_ss)=start_pt_limit(i_sp_lim);
        %         if speed_limit_st_sec(i_ss)<station_distances(i_section)
        %             speed_limit_st_sec(i_ss)=station_distances(i_section);
        %         end
        %         speed_limit_end_sec(i_ss)=end_pt_limit(i_sp_lim);
        %         if speed_limit_end_sec(i_ss)>station_distances(i_section+1)
        %             speed_limit_end_sec(i_ss)=station_distances(i_section+1);
        %         end
        %         i_ss=i_ss+1;
        %     end
        % end

        % % operation_mode for perticular section
        % mode_matrix=[1 2 3 4];
        % appand_mode_matrix=[2 1 2 3 4];
        % if limits_count_per_segment(i_section) > 0
        %     for i_mode=1:limits_count_per_segment(i_section)
        %         mode_matrix=[mode_matrix,appand_mode_matrix];

        %     end
        % end


        % braking_force_counting= sum(mode_matrix==4);
        % num_of_var = time_var+braking_force_counting;  % total 9 variables are there
        % acceleration_index= find(mode_matrix==1);
        % cruisig_index= find(mode_matrix==2);
        % costing_index= find(mode_matrix==3);
        % braking_index= find(mode_matrix==4);

        % %pop = zeros(no_of_pop,15);

        % % used for mutation
        % %     global_err = 999.0;
        % %     r_count = 0;

        % %     gen_count = 0;
        % %     g_count = 0;
        % %     tot_err = 1.0;
        %     d_dura_modi=round(dura/time_var);
        % %     d_dura_modi=100;
        % while (tot_err > toler_ga)
        %     for ij = 1:no_of_pop

        %         for jj=1:time_var

        %             pop(ij,jj) = round(d_dura_modi*rand(1));   % duration time variable (a,cru, cost, brak) upto no of tme varriable
        %         end
        %         for jj=time_var+1:time_var+braking_force_counting
        %             pop(ij,jj) = BF_max*rand(1);        % Braking force  upto no of braking time
        %         end
        %     end

        %     if (gen_count > 0)
        %         % best_sol
        %         pop(1,1:time_var+braking_force_counting) = best_sol(1,1:time_var+braking_force_counting);
        %     end





        %     %     while ((gen_count < num_gen) && (tot_err > toler_ga))
        %     while (gen_count_temp < num_gen)
        %         %        disp("inside")
        %         gen_count_temp = gen_count_temp + 1;
        %         for ij = 1:no_of_pop
        %             for jj=1:time_var
        %                 tt(jj)=pop(ij,jj);
        %             end
        %             for jj=time_var+1:time_var+braking_force_counting
        %                 f_bk(jj-time_var)=pop(ij,jj);
        %                 ss_jj=jj;
        %             end
        %             section_eval_com;
        %             % calculating number of errors
        %             n_errors_vel= length(acceleration_index)+limits_count_per_segment(i_section)+1; %no of acc+ no of limits+end (1) velocity
        %             error_vel=zeros(1,n_errors_vel);
        %             n_errors_time=1; % no of time error
        %             error_time=zeros(1,n_errors_time);
        %             n_errors_distance= 2*limits_count_per_segment(i_section)+1; % no of limits starting distance +end distance (1)
        %             errors_distance=zeros(1,n_errors_distance);
        %             for i_er=1:length(acceleration_index)
        %                 %                 disp("i_er=")
        %                 %                 i_er
        %                 error_vel(i_er)=max(0,((v0(acceleration_index(i_er)+1)*18/5)-max_speed));
        %                 pop(ij,ss_jj+i_er) = error_vel(i_er);
        %                 pop_jj=ss_jj+i_er;
        %             end

        %             for i_er=length(acceleration_index)+1:length(acceleration_index)+limits_count_per_segment(i_section)
        %                 error_vel(i_er)=max(0,(v0(braking_index(i_er-length(acceleration_index))+1)*18/5)- speed_limits_sec(i_er-length(acceleration_index))); %%changed
        %                 pop(ij,ss_jj+i_er) = error_vel(i_er);
        %                 pop_jj=ss_jj+i_er;
        %             end
        %             error_vel(n_errors_vel)=abs(v0(time_var+1) - toler);
        %             %             disp(" end pop_jj=")
        %             %                 pop_jj


        %             pop(ij,pop_jj+1) = error_vel(n_errors_vel);
        %             p_lin=pop_jj+1;
        %             error_time(1)= abs(sum(tt) - dura);
        %             pop(ij,p_lin+1) = error_time(1);
        %             pop_jj=p_lin+1;
        %             ii_er=0;
        %             for i_er=1:limits_count_per_segment(i_section)
        %                 errors_distance(i_er)=abs((s0(braking_index(i_er)+1)/1000) - speed_limit_st_sec(i_er)); %%abs((s0(braking_index(i_er))/1000)
        %                 %                 errors_distance(i_er+1)=abs((s0(braking_index(i_er)+2)/1000) - speed_limit_end_sec(i_er));
        %                 pop(ij,p_lin+1+i_er) =errors_distance(i_er);
        %                 pop_jj=p_lin+1+i_er;
        %                 ii_er=i_er;
        %                 %                 pop(ij,p_lin+1+i_er+1) =errors_distance(i_er+1);
        %             end
        %             iii_er=ii_er;
        %             %             pp_lin=p_lin+1+ii_er;
        %             pp_lin=pop_jj;
        %             %             i_er=0;
        %             for i_er=1:1:limits_count_per_segment(i_section)
        %                 errors_distance(ii_er+i_er)=abs((s0(braking_index(i_er)+2)/1000) - speed_limit_end_sec(i_er));
        %                 pop(ij,pp_lin+i_er)=errors_distance(ii_er+i_er);
        %                 pop_jj=pp_lin+i_er;
        %                 iii_er=ii_er+i_er;
        %             end
        %             p_lin=pop_jj;
        %             %             disp("iii_er=")
        %             %             iii_er
        %             errors_distance(iii_er+limits_count_per_segment(i_section)+1)=abs((s0(time_var+1)/1000) - station_distances(i_section+1)); %%%(i_er+1)----------->(i_er+2) for endfinaldistance
        %             pop(ij,p_lin+1) =errors_distance(iii_er+limits_count_per_segment(i_section)+1);                %%%(i_er+1)----------->(i_er+2)
        %             pop_lin=p_lin+1;                     %%%(i_er+1)----------->(i_er+2)
        %             pop_jj=p_lin+1;
        %             n_errors_bf=length(braking_index);
        %             error_bf=zeros(1,n_errors_bf);
        %             max_bf=zeros(1,n_errors_bf);
        %             for i_er=1:length(braking_index)
        %                 max_bf(i_er)=braking_force(v0(braking_index(i_er))*18/5); error_bf(i_er)=max(0,f_bk(i_er)-max_bf(i_er));
        %                 pop(ij,pop_lin+i_er) = max_bf(i_er);
        %                 pop_jj=pop_lin+i_er;
        %             end
        %             pp_lin=pop_jj;

        %             % sum_error= sum(error_vel)+sum(error_time)+sum(errors_distance)+sum(error_bf);
        %             % sum_error= max(max(error_vel), max(error_time), max(errors_distance), max(error_bf));
        %             max_error_vel = max(error_vel(:));  % Maximum value in error_vel
        %             max_error_time = max(error_time(:));  % Maximum value in error_time
        %             max_errors_distance = max(errors_distance(:));  % Maximum value in errors_distance
        %             max_error_bf = max(error_bf(:));  % Maximum value in error_bf

        %             % Now find the overall maximum
        %             sum_error = max([max_error_vel, max_error_time, max_errors_distance, max_error_bf]);

        %             pop(ij,pop_jj+1) = sum_error;
        %             pop_jj=pop_jj+1;

        %             %             pop_size_col = size(pop,2);

        %         end
        %         pop_size_col = size(pop,2);
        %         err_vec = pop(:,pop_size_col);         tot_err = min(err_vec);
        %         min_err_ind = find(err_vec == tot_err);

        %         % for checking need of mutation
        %         if (tot_err < global_err)
        %             global_err = tot_err;
        %             best_sol(1,:) = pop(min_err_ind(1),:);  % best solution so far
        %             r_count = 0;
        %         else
        %             r_count = r_count + 1;
        %         end

        %         g_count = g_count + 1;
        %         if (g_count == g_print)
        %             sprintf('.....Calculating position-power curve %s - %s %d (%g) .......',station_names{i_section}, station_names{i_section+1},gen_count+gen_count_temp,global_err)
        %             % sprintf('Generation = %d, minimum error = %g,  error index %d, global error = %g\n',...
        %             %     gen_count,tot_err,min_err_ind(1),global_err)

        %             g_count = 0;
        %         end

        %         % execute GA
        %         execute_GA;

        %     end
        %     gen_count_temp = 0;
        %     gen_count = gen_count + num_gen;
        %     tot_err = best_sol(1,pop_size_col);


        % end

        % %     if (tot_err > toler_ga)
        % %         sprintf('convergence criterion (0.1) has not been achieved\nthe optimization may be executed again or the generation number may be increased')
        % %     end

        % % writing position-power curve
        % sprintf('storing position power curve in the output file')

        % %     err_vec = pop_old(:,pop_size_col);            tot_err = min(err_vec);
        % %     best_sol(1,:) = pop_old(min_err_ind(1),:);
        % for i_err=1:time_var
        %     tt(i_err)=best_sol(i_err);
        % end
        % for i_bk=time_var+1:time_var+braking_force_counting
        %     f_bk(i_bk-time_var)=best_sol(i_bk);

        % end

        % % final evaluate
        % section_eval_com;
        % % Stoppage at Thane
        % dura_s = stop_data(i_section+1)*60;
        % xx = size(train_prof,1);
        % dista = train_prof(xx,3);

        % for ij = xx+1:xx+dura_s
        %     train_prof(ij,1) = ij-1;    % time in sec
        %     train_prof(ij,2) = 0;     % velocity
        %     train_prof(ij,3) = dista; % position
        %     train_prof(ij,4) = 0;     % power drawn
        %     train_prof(ij,5) = 0;     % acceleration
        %     train_prof(ij,6) = 0;     % force (tractive or braking)
        % end

        % fid=fopen('output_vadodara_ahmedabad_01.txt','w');
        % xx = size(train_prof,1);
        % for ii = 1:xx
        %     fprintf(fid,'%5d %10.5f %10.5f %10.5f %10.5f %10.5f\n',train_prof(ii,1),...
        %         train_prof(ii,2),train_prof(ii,3),train_prof(ii,4),train_prof(ii,5),train_prof(ii,6));
        % end
        % yy=xx+dura_s;
        % fclose(fid);
        % %     clear best_sol;
    end
    final_compile;
    plot_all;
end



