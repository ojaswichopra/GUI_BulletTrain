function voltage_profile_design_predetermine_TSS_outage(N_TSS_O, Voltage_distance_matrix_whole,AT,TSS)
    d_at=transpose(abs(Voltage_distance_matrix_whole(:,1)));
    d_TSS=transpose((Voltage_distance_matrix_whole(:,1)));
    ind_at_cond=ismember(d_at,AT);
    AT_points=find(ind_at_cond==1);
    ind_TSS_cond=ismember(d_TSS,TSS);
    TSS_points=find(ind_TSS_cond==1);
    PRE_det_posi=[TSS_points];
    PRE_det_position=sort(PRE_det_posi,'ascend');
    n_length_det_posi= length(PRE_det_position);
    % pre_det_Voltage_distance_matrix_whole=zeros(n_length_det_posi/2,4);
    n_jj=1;
    for n_j=1:2:n_length_det_posi
        if n_jj<N_TSS_O
            TSS_numbers=n_jj;
        else
            TSS_numbers=n_jj+1;
        end
        pre_det_Voltage_distance_matrix_whole(n_jj,1)=TSS_numbers;
        pre_det_Voltage_distance_matrix_whole(n_jj,2)=Voltage_distance_matrix_whole(PRE_det_position(n_j),2);
        pre_det_Voltage_distance_matrix_whole(n_jj,3)=Voltage_distance_matrix_whole(PRE_det_position(n_j),3);
        pre_det_Voltage_distance_matrix_whole(n_jj,4)=Voltage_distance_matrix_whole(PRE_det_position(n_j),4);
        n_jj=n_jj+1;
    end
    pre_det_Voltage_distance=[pre_det_Voltage_distance_matrix_whole(:,2) pre_det_Voltage_distance_matrix_whole(:,3) pre_det_Voltage_distance_matrix_whole(:,4)];
    % bar(abs(pre_det_Voltage_distance_matrix_whole(:,1)),abs(pre_det_Voltage_distance_matrix_whole(:,2)));
    %bar(abs(pre_det_Voltage_distance))
    graphics_toolkit ("gnuplot")
    figureHandle = figure;

    % Get screen size from root object (0)
    screenSize = get(0, 'ScreenSize');

    % Set the figure to match the screen size
    set(figureHandle, 'Position', screenSize);

    % Define x-axis values and labels
    x_values = abs(pre_det_Voltage_distance_matrix_whole(:, 1)); % TSS numbers
    x_labels = 1:length(x_values); % Sequential numbers as labels
    x_spacing = 1; % Adjust this value for wider spacing
    
    subplot(3, 1, 1);
    bar(abs(pre_det_Voltage_distance_matrix_whole(:, 1)), abs(pre_det_Voltage_distance_matrix_whole(:, 2)));
    set(gca, 'XTick', x_values(1:x_spacing:end)); % Increase x-axis spacing
    xlabel('TSS Numbers', 'FontWeight', 'bold');
    ylabel('Contact voltage magnitude (kV)', 'FontWeight', 'bold');

    % Create the second subplot (3 rows, 1 column, second plot)
    subplot(3, 1, 2);
    bar(abs(pre_det_Voltage_distance_matrix_whole(:, 1)), abs(pre_det_Voltage_distance_matrix_whole(:, 3)));
    set(gca, 'XTick', x_values(1:x_spacing:end)); % Increase x-axis spacing
    xlabel('TSS Numbers', 'FontWeight', 'bold');
    ylabel('Rail voltage magnitude (kV)', 'FontWeight', 'bold');

    % Create the third subplot (3 rows, 1 column, third plot)
    subplot(3, 1, 3);
    bar(abs(pre_det_Voltage_distance_matrix_whole(:, 1)), abs(pre_det_Voltage_distance_matrix_whole(:, 4)));
    set(gca, 'XTick', x_values(1:x_spacing:end)); % Increase x-axis spacing
    xlabel('TSS Numbers', 'FontWeight', 'bold');
    ylabel('Feeder voltage magnitude (kV)', 'FontWeight', 'bold');

    desired_filename = '../Plots_oTo_double/voltage_profile_design_predetermine_TSS_outage.png';
    saveas(gcf, desired_filename);

end