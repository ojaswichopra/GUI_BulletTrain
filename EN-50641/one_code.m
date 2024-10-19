clc
close all
 clear all
 tic
 load("double_line2.mat");
 li_len=length(sub_station_catenary_current);
 for li=1:1:li_len
     sub_station_current_catenary_ang(li)=angle(sub_station_catenary_current(li))*180/pi;
     cat_current_angle(li)=wrapTo360(sub_station_current_catenary_ang(li));
     if cat_current_angle(li)>90 && cat_current_angle(li)<270
         sub_station_catenary_current_abs(li)=-abs(sub_station_catenary_current(li))*1000;
     else
         sub_station_catenary_current_abs(li)=abs(sub_station_catenary_current(li))*1000;
     end
     sub_station_current_feeder_ang(li)=angle(sub_station_feeder_current(li))*180/pi;
     fed_current_angle(li)=wrapTo360(sub_station_current_feeder_ang(li));
     if fed_current_angle(li)>90 && fed_current_angle(li)<270
         sub_station_feeder_current_abs(li)=abs(sub_station_feeder_current(li))*1000;
     else
         sub_station_feeder_current_abs(li)=-abs(sub_station_feeder_current(li))*1000;
     end

 end
 subplot(2,1,2)
 plot(sub_station_catenary_current_abs);
 hold on
 plot(sub_station_feeder_current_abs);
xlabel('time (sec)','FontWeight','bold')
ylabel('Current Magnitude (Amp)','FontWeight','bold')
legend('contact line total current','negative feeder total current','FontWeight','bold')
subplot(2,1,1)
plot(Vc_mag_Td(:,1));
hold on
plot(Vf_mag_Td(:,1));
ylim([27,28])
xlabel('time (sec)','FontWeight','bold')
ylabel('Volatge magnitude (kV)','FontWeight','bold')
legend('contact line bus bar voltage','negative feeder bus bar voltage','FontWeight','bold')
toc