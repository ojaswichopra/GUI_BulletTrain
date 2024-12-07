

load("variable_code_Zshort_Zg_3train_hour.mat");
tic
nn=0;
ss_length=0;
for x_i=1:1:length(dTSS_T)
    AT_index_T=find(tTSS_T(x_i,:)==3);
    AT_index_M=find(tTSS_M(x_i,:)==3);
    if mod(x_i,y)==1
        time_i=1;
        nn=nn+1;
    end
    for xx_i=1:1:length(AT_index_T)
        V_crf_T=[Vc_mag_Td(x_i,AT_index_T(xx_i))*(cos(Vc_ang_Td(x_i,AT_index_T(xx_i))*pi/180)+i*sin(Vc_ang_Td(x_i,AT_index_T(xx_i))*pi/180));
            VR_mag_Td(x_i,AT_index_T(xx_i))*(cos(VR_ang_Td(x_i,AT_index_T(xx_i))*pi/180)+i*sin(VR_ang_Td(x_i,AT_index_T(xx_i))*pi/180));
            Vf_mag_Td(x_i,AT_index_T(xx_i))*(cos(Vf_ang_Td(x_i,AT_index_T(xx_i))*pi/180)+i*sin(Vf_ang_Td(x_i,AT_index_T(xx_i))*pi/180));];
        I_crf_T=Yat*V_crf_T;
        %         AT_MVA_T(x_i,xx_i)= transpose(V_crf_T)*conj(I_crf_T);
        AT_MVA_T(x_i,xx_i)=(V_crf_T(1,1)-V_crf_T(2,1))*conj(I_crf_T(1,1))+(V_crf_T(2,1)-V_crf_T(3,1))*conj(I_crf_T(3,1));
    end

    for xx_i=1:1:length(AT_index_M)
        V_crf_M=[Vc_mag_Md(x_i,AT_index_M(xx_i))*(cos(Vc_ang_Md(x_i,AT_index_M(xx_i))*pi/180)+i*sin(Vc_ang_Md(x_i,AT_index_M(xx_i))*pi/180));
            VR_mag_Md(x_i,AT_index_M(xx_i))*(cos(VR_ang_Md(x_i,AT_index_M(xx_i))*pi/180)+i*sin(VR_ang_Md(x_i,AT_index_M(xx_i))*pi/180));
            Vf_mag_Md(x_i,AT_index_M(xx_i))*(cos(Vf_ang_Md(x_i,AT_index_M(xx_i))*pi/180)+i*sin(Vf_ang_Md(x_i,AT_index_M(xx_i))*pi/180));];
        I_crf_M=Yat*V_crf_M;
%         AT_MVA_M(x_i,xx_i)= transpose(V_crf_M)*conj(I_crf_M);
        AT_MVA_M(x_i,xx_i)=(V_crf_M(1,1)-V_crf_M(2,1))*conj(I_crf_M(1,1))+(V_crf_M(2,1)-V_crf_M(3,1))*conj(I_crf_M(3,1));
    end

    if nn>1
        ss_length=sum(s_length(time_i,:));
    end
    

if mod(nn,2)==1
    ss_current_length=0;
    for ss_i=1:1:length(nonzeros(AT_MVA_T(x_i,:)))
        AT_mva(time_i,ss_length+ss_i+ss_current_length)=AT_MVA_T(x_i,ss_i);
        
    end
    ss_current_length=ss_i;
    for ss_i=1:1:length(nonzeros(AT_MVA_M(x_i,:)))
        AT_mva(time_i,ss_length+ss_i+ss_current_length)=AT_MVA_M(x_i,ss_i);
    end

end
if mod(nn,2)==0
    ss_current_length=0;
    for ss_i=1:1:length(nonzeros(AT_MVA_M(x_i,:)))
        AT_mva(time_i,ss_length+ss_i+ss_current_length)=AT_MVA_M(x_i,ss_i);
        
    end
    ss_current_length=ss_i;
    for ss_i=1:1:length(nonzeros(AT_MVA_T(x_i,:)))
        AT_mva(time_i,ss_length+ss_i+ss_current_length)=AT_MVA_T(x_i,ss_i);
    end


end

s_length(time_i,nn)=length(nonzeros(AT_MVA_T(x_i,:)))+length(nonzeros(AT_MVA_M(x_i,:)));

    time_i=time_i+1;
end
AT_mva_mag=abs(AT_mva);
toc