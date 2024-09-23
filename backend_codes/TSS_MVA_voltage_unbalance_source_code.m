<<<<<<< HEAD

track_TSS_no=length(TSS);           %% total no of TSS in track
ntt=length(dTSS_T(:,1));            %% total time interval of whole day operation
for n_track=1:1:track_TSS_no
    i_time=1;

    for ii_ntt=((n_track-1)*y+1):1:n_track*y
        primary_current;
        i_time=i_time+1;
    end
    percentage_completion_4=(n_track/track_TSS_no)*100   %percentage of total computation completed
end
=======

track_TSS_no=length(TSS);           %% total no of TSS in track
ntt=length(dTSS_T(:,1));            %% total time interval of whole day operation
for n_track=1:1:track_TSS_no
    i_time=1;

    for ii_ntt=((n_track-1)*y+1):1:n_track*y
        primary_current;
        i_time=i_time+1;
    end
    percentage_completion_4=(n_track/track_TSS_no)*100   %percentage of total computation completed
end
>>>>>>> a6b21b859934a8cd5093e7439821c631fce9c22b
