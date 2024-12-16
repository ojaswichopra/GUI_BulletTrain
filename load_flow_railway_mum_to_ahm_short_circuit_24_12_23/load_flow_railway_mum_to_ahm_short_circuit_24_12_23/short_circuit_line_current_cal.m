
if fault_wind_side==1
    Nb_s=NBranch;
    VD_s=zeros(3,1);
    I_line_currentT_s=zeros(Nb_s,3);
    %  I_line_currentM_s=zeros(3*Nb_M_s,1);
    for j=1:1:Nb_s
        VD_s= transpose(Vs_T(line_start_bus(j),:)-Vs_T(line_end_bus(j),:));
        %     f=2;
        %     for k=1:1:3
        %         VD_s(k)=VcrfT(3*line_start_bus(j)-f)-VcrfT(3*line_end_bus(j)-f);
        %         f=f-1;
        %     end
        l=line_length(j);
        I_line= inv(l*z1)*VD_s;
        s=1;
        I_line_currentT_s(j,:)=transpose(I_line);

        %     for g=3*j-2:1:3*j
        %
        %         I_line_currentT_s(g)=I_line(s);
        %         s=s+1;
        %     end
    end
    I_line_current_magT_s=abs(I_line_currentT_s);
    I_line_current_angT_s= angle(I_line_currentT_s)*180/pi;

else if fault_wind_side==2
        Nb_M_s=NBranch_M;
        I_line_currentM_s=zeros(Nb_M_s,3);
        VDM_s=zeros(3,1);
        for j=1:1:Nb_M_s
        VDM_s= transpose(Vs_M(line_start_bus_M(j),:)-Vs_M(line_end_bus_M(j),:));
%             f=2;
%             for k=1:1:3
%                 VDM_s(k)=VcrfM(3*line_start_bus_M(j)-f)-VcrfM(3*line_end_bus_M(j)-f);
%                 f=f-1;
%             end
            l=line_length_M(j);
            I_line= inv(l*z1)*VDM_s;
            s=1;
            I_line_currentM_s(j,:)=transpose(I_line);
%             for g=3*j-2:1:3*j
%         
%                 I_line_currentM_s(g)=I_line(s);
%                 s=s+1;
%             end
        end
        I_line_current_magM_s=abs(I_line_currentM_s);
        I_line_current_angM_s= angle(I_line_currentM_s)*180/pi;
end
end