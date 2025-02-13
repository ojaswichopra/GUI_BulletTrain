track_TSS_no=length(TSS)-length(N_TSS_O);           %% total no of TSS in track
ntt=length(dTSS_T_up(:,1));            %% total time interval of whole day operation
for n_track=1:1:track_TSS_no
    i_time=1;
    for ii_ntt=((n_track-1)*y+1):1:n_track*y
        primary_current;
        i_time=i_time+1;
    end
    percentage_completion_TSS_MVA=(n_track/track_TSS_no)*100   %percentage of total computation completed
end