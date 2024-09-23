d_at=transpose(abs(Voltage_distance_matrix_whole(:,1)));
d_TSS=transpose((Voltage_distance_matrix_whole(:,1)));
ind_at_cond=ismember(d_at,AT);
AT_points=find(ind_at_cond==1);
ind_TSS_cond=ismember(d_TSS,TSS);
TSS_points=find(ind_TSS_cond==1);
 PRE_det_posi=TSS_points;
PRE_det_position=sort(PRE_det_posi,'ascend');
n_length_det_posi= length(PRE_det_position);
pre_det_Voltage_distance_matrix_whole=zeros(n_length_det_posi/2,4);
n_jj=1;
for n_j=1:2:n_length_det_posi
    pre_det_Voltage_distance_matrix_whole(n_jj,1)=n_jj;
    pre_det_Voltage_distance_matrix_whole(n_jj,2)=Voltage_distance_matrix_whole(PRE_det_position(n_j),2);
    pre_det_Voltage_distance_matrix_whole(n_jj,3)=Voltage_distance_matrix_whole(PRE_det_position(n_j),3);
    pre_det_Voltage_distance_matrix_whole(n_jj,4)=Voltage_distance_matrix_whole(PRE_det_position(n_j),4);
    n_jj=n_jj+1;
end
pre_det_Voltage_distance=[pre_det_Voltage_distance_matrix_whole(:,2) pre_det_Voltage_distance_matrix_whole(:,3) pre_det_Voltage_distance_matrix_whole(:,4)];
% bar(abs(pre_det_Voltage_distance_matrix_whole(:,1)),abs(pre_det_Voltage_distance_matrix_whole(:,2)));
%bar(abs(pre_det_Voltage_distance))
tiledlayout(3,1);
nexttile
bar(abs(pre_det_Voltage_distance_matrix_whole(:,1)),abs(pre_det_Voltage_distance_matrix_whole(:,2)));
xlabel('TSS Numbers','FontWeight','bold')
ylabel('Contact voltage magnitude (kV)','FontWeight','bold')
nexttile
bar(abs(pre_det_Voltage_distance_matrix_whole(:,1)),abs(pre_det_Voltage_distance_matrix_whole(:,3)));
xlabel('TSS Numbers','FontWeight','bold')
ylabel('Rail voltage magnitude (kV)','FontWeight','bold')
nexttile
bar(abs(pre_det_Voltage_distance_matrix_whole(:,1)),abs(pre_det_Voltage_distance_matrix_whole(:,4)));
xlabel('TSS Numbers','FontWeight','bold')
ylabel('Feeder voltage magnitude (kV)','FontWeight','bold')