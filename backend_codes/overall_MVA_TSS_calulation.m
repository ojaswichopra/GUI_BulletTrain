<<<<<<< HEAD

clc
clear all
load("variable_code_Zshort_Zg_3train_hour.mat");
% Zshort=i*4;
track_TSS_no=length(TSS);           %% total no of TSS in track
ntt=length(dTSS_T(:,1));            %% total time interval of whole day operation
for n_track=1:1:track_TSS_no
    i_time=1;
    
    for ii_ntt=((n_track-1)*y+1):1:n_track*y
        primary_current;
        i_time=i_time+1;
       

    end
%plot(tt_time,s_apprant_power_MVA_mag(:,n_track));
%hold on
subplot(track_TSS_no,1,n_track);
plot(tt_time/60,s_apprant_power_MVA_mag(:,n_track))
title(['MVA profile of ',num2str(n_track) ,' no TSS'])
xlabel('Time (minute)')
ylabel('MVA')
maximum_mva(n_track)=max(s_apprant_power_MVA_mag(:,n_track));
maximum_mva_sec(n_track)=max(Mva_sec_abs(:,n_track));
maximum_unbalance(n_track)=max(Unb(:,n_track));
end
maximum_mva
maximum_unbalance
% plot(tt_time,s_apprant_power_MVA_mag(:,1))
=======

clc
clear all
load("variable_code_Zshort_Zg_3train_hour.mat");
% Zshort=i*4;
track_TSS_no=length(TSS);           %% total no of TSS in track
ntt=length(dTSS_T(:,1));            %% total time interval of whole day operation
for n_track=1:1:track_TSS_no
    i_time=1;
    
    for ii_ntt=((n_track-1)*y+1):1:n_track*y
        primary_current;
        i_time=i_time+1;
       

    end
%plot(tt_time,s_apprant_power_MVA_mag(:,n_track));
%hold on
subplot(track_TSS_no,1,n_track);
plot(tt_time/60,s_apprant_power_MVA_mag(:,n_track))
title(['MVA profile of ',num2str(n_track) ,' no TSS'])
xlabel('Time (minute)')
ylabel('MVA')
maximum_mva(n_track)=max(s_apprant_power_MVA_mag(:,n_track));
maximum_mva_sec(n_track)=max(Mva_sec_abs(:,n_track));
maximum_unbalance(n_track)=max(Unb(:,n_track));
end
maximum_mva
maximum_unbalance
% plot(tt_time,s_apprant_power_MVA_mag(:,1))
>>>>>>> a6b21b859934a8cd5093e7439821c631fce9c22b
% plot(tt_time,Unb(:,1))