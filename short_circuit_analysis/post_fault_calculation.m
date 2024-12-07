NBranch = length(linedata(:, 1));
NBranch_M = length(linedataM(:, 1));
if fault_wind_side==1
    Vsc_mag_T=zeros(1,length(Vc_mag_T));
    Vsc_ang_T=zeros(1,length(Vc_ang_T));
    Isc_mag_T=zeros(1,length(Ic_mag_T));
    Isc_ang_T=zeros(1,length(Ic_ang_T));
    VsR_mag_T=zeros(1,length(VR_mag_T));
    VsR_ang_T=zeros(1,length(VR_ang_T));
    IsR_mag_T=zeros(1,length(IR_mag_T));
    IsR_ang_T=zeros(1,length(IR_ang_T));
    Vsf_mag_T=zeros(1,length(Vf_mag_T));
    Vsf_ang_T=zeros(1,length(Vf_ang_T));
    Isf_mag_T=zeros(1,length(If_mag_T));
    Isf_ang_T=zeros(1,length(If_ang_T));
    for nn_i=1:1:length(Vc_mag_T)
        Vs_T(nn_i,:)=transpose([Vsc_mag_T(1,nn_i)*(cos(Vsc_ang_T(1,nn_i)*pi/180)+i*sin(Vsc_ang_T(1,nn_i)*pi/180));
            VsR_mag_T(1,nn_i)*(cos(VsR_ang_T(1,nn_i)*pi/180)+i*sin(VsR_ang_T(1,nn_i)*pi/180));
            Vsf_mag_T(1,nn_i)*(cos(Vsf_ang_T(1,nn_i)*pi/180)+i*sin(Vsf_ang_T(1,nn_i)*pi/180))]);
    end
    for nn_i=1:1:length(Vc_mag_T)
        Vpre_T(nn_i,:)=transpose([Vc_mag_T(1,nn_i)*(cos(Vc_ang_T(1,nn_i)*pi/180)+i*sin(Vc_ang_T(1,nn_i)*pi/180));
            VR_mag_T(1,nn_i)*(cos(VR_ang_T(1,nn_i)*pi/180)+i*sin(VR_ang_T(1,nn_i)*pi/180));
            Vf_mag_T(1,nn_i)*(cos(Vf_ang_T(1,nn_i)*pi/180)+i*sin(Vf_ang_T(1,nn_i)*pi/180))]);
    end

    Vs_T(ft_n_no,:)=transpose(inv([1 0 0;0 1 0;0 0 1]+[ZbusT(3*ft_n_no-2,3*ft_n_no-2) ZbusT(3*ft_n_no-2,3*ft_n_no-1) ZbusT(3*ft_n_no-2,3*ft_n_no); ZbusT(3*ft_n_no-1,3*ft_n_no-2) ZbusT(3*ft_n_no-1,3*ft_n_no-1) ZbusT(3*ft_n_no-1,3*ft_n_no);ZbusT(3*ft_n_no,3*ft_n_no-2) ZbusT(3*ft_n_no,3*ft_n_no-1) ZbusT(3*ft_n_no,3*ft_n_no)]*Y_fault_mat)*transpose(Vpre_T(ft_n_no,:)));

    for nn_i=1:1:length(Vc_mag_T)
        Vs_T(nn_i,:)=Vpre_T(nn_i,:)-transpose([ZbusT(3*nn_i-2,3*ft_n_no-2) ZbusT(3*nn_i-2,3*ft_n_no-1) ZbusT(3*nn_i-2,3*ft_n_no); ZbusT(3*nn_i-1,3*ft_n_no-2) ZbusT(3*nn_i-1,3*ft_n_no-1) ZbusT(3*nn_i-1,3*ft_n_no);ZbusT(3*nn_i,3*ft_n_no-2) ZbusT(3*nn_i,3*ft_n_no-1) ZbusT(3*nn_i,3*ft_n_no)]*Y_fault_mat*transpose(Vs_T(ft_n_no,:)));
    end

else if fault_wind_side==2
        Vsc_mag_M=zeros(1,length(Vc_mag_M));
        Vsc_ang_M=zeros(1,length(Vc_ang_M));
        Isc_mag_M=zeros(1,length(Ic_mag_M));
        Isc_ang_M=zeros(1,length(Ic_ang_M));
        VsR_mag_M=zeros(1,length(VR_mag_M));
        VsR_ang_M=zeros(1,length(VR_ang_M));
        IsR_mag_M=zeros(1,length(IR_mag_M));
        IsR_ang_M=zeros(1,length(IR_ang_M));
        Vsf_mag_M=zeros(1,length(Vf_mag_M));
        Vsf_ang_M=zeros(1,length(Vf_ang_M));
        Isf_mag_M=zeros(1,length(If_mag_M));
        Isf_ang_M=zeros(1,length(If_ang_M));
        for nn_i=1:1:length(Vc_mag_M)
            Vs_M(nn_i,:)=transpose([Vsc_mag_M(1,nn_i)*(cos(Vsc_ang_M(1,nn_i)*pi/180)+i*sin(Vsc_ang_M(1,nn_i)*pi/180));
                VsR_mag_M(1,nn_i)*(cos(VsR_ang_M(1,nn_i)*pi/180)+i*sin(VsR_ang_M(1,nn_i)*pi/180));
                Vsf_mag_M(1,nn_i)*(cos(Vsf_ang_M(1,nn_i)*pi/180)+i*sin(Vsf_ang_M(1,nn_i)*pi/180))]);
        end
        for nn_i=1:1:length(Vc_mag_M)
            Vpre_M(nn_i,:)=transpose([Vc_mag_M(1,nn_i)*(cos(Vc_ang_M(1,nn_i)*pi/180)+i*sin(Vc_ang_M(1,nn_i)*pi/180));
                VR_mag_M(1,nn_i)*(cos(VR_ang_M(1,nn_i)*pi/180)+i*sin(VR_ang_M(1,nn_i)*pi/180));
                Vf_mag_M(1,nn_i)*(cos(Vf_ang_M(1,nn_i)*pi/180)+i*sin(Vf_ang_M(1,nn_i)*pi/180))]);
        end

        Vs_M(ft_n_no,:)=transpose(inv([1 0 0;0 1 0;0 0 1]+[ZbusM(3*ft_n_no-2,3*ft_n_no-2) ZbusM(3*ft_n_no-2,3*ft_n_no-1) ZbusM(3*ft_n_no-2,3*ft_n_no); ZbusM(3*ft_n_no-1,3*ft_n_no-2) ZbusM(3*ft_n_no-1,3*ft_n_no-1) ZbusM(3*ft_n_no-1,3*ft_n_no);ZbusM(3*ft_n_no,3*ft_n_no-2) ZbusM(3*ft_n_no,3*ft_n_no-1) ZbusM(3*ft_n_no,3*ft_n_no)]*Y_fault_mat)*transpose(Vpre_M(ft_n_no,:)));

        for nn_i=1:1:length(Vc_mag_M)
            Vs_M(nn_i,:)=Vpre_M(nn_i,:)-transpose([ZbusM(3*nn_i-2,3*ft_n_no-2) ZbusM(3*nn_i-2,3*ft_n_no-1) ZbusM(3*nn_i-2,3*ft_n_no); ZbusM(3*nn_i-1,3*ft_n_no-2) ZbusM(3*nn_i-1,3*ft_n_no-1) ZbusM(3*nn_i-1,3*ft_n_no);ZbusM(3*nn_i,3*ft_n_no-2) ZbusM(3*nn_i,3*ft_n_no-1) ZbusM(3*nn_i,3*ft_n_no)]*Y_fault_mat*transpose(Vs_M(ft_n_no,:)));
        end

end
end

