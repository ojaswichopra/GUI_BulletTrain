function voltage_profile_design_predetermine_AT_outage (N_TSS_O, Voltage_distance_matrix_whole,AT,TSS)
    d_at=transpose(abs(Voltage_distance_matrix_whole(:,1)));
    d_TSS=transpose((Voltage_distance_matrix_whole(:,1)));
    ind_at_cond=ismember(d_at,AT);
    AT_points=find(ind_at_cond==1);
    ind_TSS_cond=ismember(d_TSS,TSS);
    TSS_points=find(ind_TSS_cond==1);
    PRE_det_posi=[AT_points];
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
% Create the first subplot (3 rows, 1 column, first plot)
    graphics_toolkit ("gnuplot")
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);
    x_spacing = 1;
    
    subplot(3, 1, 1);
    bar(abs(pre_det_Voltage_distance_matrix_whole(:,1)), abs(pre_det_Voltage_distance_matrix_whole(:,2)));
    xticks(1:x_spacing:length(AT))
    % set(gca, 'XTick', x_values(1:x_spacing:end)); % Increase x-axis spacing
    xlabel('AT Numbers', 'FontWeight', 'bold');
    ylabel('Contact voltage magnitude (kV)', 'FontWeight', 'bold');
    xlim([0, length(pre_det_Voltage_distance_matrix_whole)+1]); % Uncomment if x-axis limit is needed

    % Create the second subplot (3 rows, 1 column, second plot)
    subplot(3, 1, 2);
    bar(abs(pre_det_Voltage_distance_matrix_whole(:,1)), abs(pre_det_Voltage_distance_matrix_whole(:,3)));
    xticks(1:x_spacing:length(AT))
    xlabel('AT Numbers', 'FontWeight', 'bold');
    ylabel('Rail voltage magnitude (kV)', 'FontWeight', 'bold');
    xlim([0, length(pre_det_Voltage_distance_matrix_whole)+1]); % Uncomment if x-axis limit is needed

    % Create the third subplot (3 rows, 1 column, third plot)
    subplot(3, 1, 3);
    bar(abs(pre_det_Voltage_distance_matrix_whole(:,1)), abs(pre_det_Voltage_distance_matrix_whole(:,4)));
    xticks(1:x_spacing:length(AT))
    xlabel('AT Numbers', 'FontWeight', 'bold');
    ylabel('Feeder voltage magnitude (kV)', 'FontWeight', 'bold');
    xlim([0, length(pre_det_Voltage_distance_matrix_whole)+1]); % Uncomment if x-axis limit is needed
    desired_filename = '../Plots_oTo_double/voltage_profile_design_predetermine_AT_outage.png';
    saveas(gcf, desired_filename);

end