clc
clear all
load("TSS.txt");
load("N_TSS_O.txt");
load("dTSS_T.txt");
load("s_apprant_power_MVA_mag.txt");
load("Mva_sec_abs.txt");
load("Unb.txt");
load("tt_time.txt");
nn_track=input("Enter the TSS number for MVA profile");
track_TSS_no=length(TSS)-length(N_TSS_O);           %% total no of TSS in track
ntt=length(dTSS_T(:,1));            %% total time interval of whole day operation
nt_track=1;
for n_track=1:1:track_TSS_no+2
   

if n_track<N_TSS_O(1)
    maximum_mva(n_track)=max(s_apprant_power_MVA_mag(:,nt_track));
    maximum_unbalance(n_track)=max(Unb(:,nt_track));
    nt_track=nt_track+1;

elseif n_track==N_TSS_O(1)|| n_track==N_TSS_O(2)
    maximum_mva(n_track)=0;
    maximum_unbalance(n_track)=0;
else
    maximum_mva(n_track)=max(s_apprant_power_MVA_mag(:,nt_track));
    maximum_unbalance(n_track)=max(Unb(:,nt_track));
    nt_track=nt_track+1;
end



end
figure;

if nn_track<N_TSS_O
    nn_track_name=nn_track;
    plot(tt_time/60,s_apprant_power_MVA_mag(:,nn_track))
elseif n_track==N_TSS_O(1)|| n_track==N_TSS_O(2)
    outage_TSS_condition=zeros(length(s_apprant_power_MVA_mag(:,1)),1);
    nn_track_name=nn_track;
    plot(tt_time/60,outage_TSS_condition(:,1));
else
    nn_track=nn_track-1
    nn_track_name=nn_track+1;
    plot(tt_time/60,s_apprant_power_MVA_mag(:,nn_track))
end

title(['MVA profile of TSS number ',num2str(nn_track_name) ,'.'])
xlabel('Time (minute)')
ylabel('MVA')
maximum_mva
maximum_unbalance
