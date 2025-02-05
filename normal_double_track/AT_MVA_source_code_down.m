nn_dw=0;
ss_length=0;

for d_x_i=1:1:length(dTSS_T_down)
    AT_index_T_down=find(tTSS_T_down(d_x_i,:)==3);
    AT_index_M_down=find(tTSS_M_down(d_x_i,:)==3);
    if (mod(d_x_i,y)==1)
        time_i_down=1;
        nn_dw=nn_dw+1;
    end
    for xx_i=1:1:length(AT_index_T_down)
        V_crf_T=[Vc_mag_Td_down(d_x_i,AT_index_T_down(xx_i))*(cos(Vc_ang_Td_down(d_x_i,AT_index_T_down(xx_i))*pi/180)+1i*sin(Vc_ang_Td_down(d_x_i,AT_index_T_down(xx_i))*pi/180));
            VR_mag_Td_down(d_x_i,AT_index_T_down(xx_i))*(cos(VR_ang_Td_down(d_x_i,AT_index_T_down(xx_i))*pi/180)+1i*sin(VR_ang_Td_down(d_x_i,AT_index_T_down(xx_i))*pi/180));
            Vf_mag_Td_down(d_x_i,AT_index_T_down(xx_i))*(cos(Vf_ang_Td_down(d_x_i,AT_index_T_down(xx_i))*pi/180)+1i*sin(Vf_ang_Td_down(d_x_i,AT_index_T_down(xx_i))*pi/180));];
        I_crf_T=Yat*V_crf_T;
        %         AT_MVA_T(x_i,xx_i)= transpose(V_crf_T)*conj(I_crf_T);
        AT_MVA_T_down(d_x_i,xx_i)=(V_crf_T(1,1)-V_crf_T(2,1))*conj(I_crf_T(1,1))+(V_crf_T(2,1)-V_crf_T(3,1))*conj(I_crf_T(3,1));
    end

    for xx_i=1:1:length(AT_index_M_down)
        V_crf_M=[Vc_mag_Md_down(d_x_i,AT_index_M_down(xx_i))*(cos(Vc_ang_Md_down(d_x_i,AT_index_M_down(xx_i))*pi/180)+1i*sin(Vc_ang_Md_down(d_x_i,AT_index_M_down(xx_i))*pi/180));
            VR_mag_Md_down(d_x_i,AT_index_M_down(xx_i))*(cos(VR_ang_Md_down(d_x_i,AT_index_M_down(xx_i))*pi/180)+1i*sin(VR_ang_Md_down(d_x_i,AT_index_M_down(xx_i))*pi/180));
            Vf_mag_Md_down(d_x_i,AT_index_M_down(xx_i))*(cos(Vf_ang_Md_down(d_x_i,AT_index_M_down(xx_i))*pi/180)+1i*sin(Vf_ang_Md_down(d_x_i,AT_index_M_down(xx_i))*pi/180));];
        I_crf_M=Yat*V_crf_M;
%         AT_MVA_M(x_i,xx_i)= transpose(V_crf_M)*conj(I_crf_M);
        AT_MVA_M_down(d_x_i,xx_i)=(V_crf_M(1,1)-V_crf_M(2,1))*conj(I_crf_M(1,1))+(V_crf_M(2,1)-V_crf_M(3,1))*conj(I_crf_M(3,1));
    end

    if (nn_dw>1)
        ss_length=sum(s_length_down(time_i_down,:));
    end


if (mod(nn_dw,2)==1)
    ss_current_length=0;
    for ss_i=1:1:length(nonzeros(AT_MVA_T_down(d_x_i,:)))
        AT_mva_down(time_i_down,ss_length+ss_i+ss_current_length)=AT_MVA_T_down(d_x_i,ss_i);

    end
    ss_current_length=ss_i;
    for ss_i=1:1:length(nonzeros(AT_MVA_M_down(d_x_i,:)))
        AT_mva_down(time_i_down,ss_length+ss_i+ss_current_length)=AT_MVA_M_down(d_x_i,ss_i);
    end

end
if (mod(nn_dw,2)==0)
    ss_current_length=0;
    for ss_i=1:1:length(nonzeros(AT_MVA_M_down(d_x_i,:)))
        AT_mva_down(time_i_down,ss_length+ss_i+ss_current_length)=AT_MVA_M_down(d_x_i,ss_i);

    end
    ss_current_length=ss_i;
    for ss_i=1:1:length(nonzeros(AT_MVA_T_down(d_x_i,:)))
        AT_mva_down(time_i_down,ss_length+ss_i+ss_current_length)=AT_MVA_T_down(d_x_i,ss_i);
    end
end

s_length_down(time_i_down,nn_dw)=length(nonzeros(AT_MVA_T_down(d_x_i,:)))+length(nonzeros(AT_MVA_M_down(d_x_i,:)));

    time_i_down=time_i_down+1;

    percentage_completion_AT_MVA_down=(d_x_i/length(dTSS_T_down))*100       %percentage of total computation completed
end
AT_mva_mag_down=abs(AT_mva_down);
