function voltage_profile_design_predetermine_AT(Voltage_distance_matrix_whole,AT,TSS)
    d_at=transpose(abs(Voltage_distance_matrix_whole(:,1)));
    d_TSS=transpose((Voltage_distance_matrix_whole(:,1)));
    ind_at_cond=ismember(d_at,AT);
    AT_points=find(ind_at_cond==1);
    ind_TSS_cond=ismember(d_TSS,TSS);
    TSS_points=find(ind_TSS_cond==1);
    PRE_det_posi=AT_points;
    PRE_det_position=sort(PRE_det_posi,'ascend');
    n_length_det_posi= length(PRE_det_position);
    pre_det_Voltage_distance_matrix_whole=zeros(n_length_det_posi,4);
    for n_j=1:1:n_length_det_posi
        pre_det_Voltage_distance_matrix_whole(n_j,1)=n_j;
        pre_det_Voltage_distance_matrix_whole(n_j,2)=Voltage_distance_matrix_whole(PRE_det_position(n_j),2);
        pre_det_Voltage_distance_matrix_whole(n_j,3)=Voltage_distance_matrix_whole(PRE_det_position(n_j),3);
        pre_det_Voltage_distance_matrix_whole(n_j,4)=Voltage_distance_matrix_whole(PRE_det_position(n_j),4);
    end
    pre_det_Voltage_distance=[pre_det_Voltage_distance_matrix_whole(:,2) pre_det_Voltage_distance_matrix_whole(:,3) pre_det_Voltage_distance_matrix_whole(:,4)];
    % bar(abs(pre_det_Voltage_distance_matrix_whole(:,1)),abs(pre_det_Voltage_distance_matrix_whole(:,2)));
    %bar(abs(pre_det_Voltage_distance))
    % Create the first subplot (3 rows, 1 column, first plot)
    subplot(3, 1, 1);
    bar(abs(pre_det_Voltage_distance_matrix_whole(:,1)), abs(pre_det_Voltage_distance_matrix_whole(:,2)));
    xlabel('AT Numbers', 'FontWeight', 'bold');
    ylabel('Contact voltage magnitude (kV)', 'FontWeight', 'bold');
    % xlim([1, length(pre_det_Voltage_distance_matrix_whole)]); % Uncomment if x-axis limit is needed

    % Create the second subplot (3 rows, 1 column, second plot)
    subplot(3, 1, 2);
    bar(abs(pre_det_Voltage_distance_matrix_whole(:,1)), abs(pre_det_Voltage_distance_matrix_whole(:,3)));
    xlabel('AT Numbers', 'FontWeight', 'bold');
    ylabel('Rail voltage magnitude (kV)', 'FontWeight', 'bold');
    % xlim([1, length(pre_det_Voltage_distance_matrix_whole)]); % Uncomment if x-axis limit is needed

    % Create the third subplot (3 rows, 1 column, third plot)
    subplot(3, 1, 3);
    bar(abs(pre_det_Voltage_distance_matrix_whole(:,1)), abs(pre_det_Voltage_distance_matrix_whole(:,4)));
    xlabel('AT Numbers', 'FontWeight', 'bold');
    ylabel('Feeder voltage magnitude (kV)', 'FontWeight', 'bold');
    % xlim([1, length(pre_det_Voltage_distance_matrix_whole)]); % Uncomment if x-axis limit is needed
    desired_filename = '../Plots/voltage_profile_design_predetermine_AT.png';
    saveas(gcf, desired_filename);

end
