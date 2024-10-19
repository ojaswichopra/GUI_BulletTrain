NT_T=length(dTSS_F_A);
no_of_TSS=length(TSS);
no_of_TSS_windings=2*no_of_TSS;
dTSS_T_F_A=zeros(no_of_TSS*y_whole,15);
dTSS_M_F_A=zeros(no_of_TSS*y_whole,15);
pTSS_T_F_A=zeros(no_of_TSS*y_whole,15);
pTSS_M_F_A=zeros(no_of_TSS*y_whole,15);
tTSS_T_F_A=zeros(no_of_TSS*y_whole,15);
tTSS_M_F_A=zeros(no_of_TSS*y_whole,15);
winding_position=0;
check=1;
x_dTss_T_F_A=1;
x_dTss_M_F_A=1;
for n_time=1:1:NT_T

    if n_time==((2*winding_position+1)*y_whole+1)
        check=check+1;
        winding_position=winding_position+1;
    end
    condition_odd=mod(check,2);
    if condition_odd==1
        dTSS_T_F_A(x_dTss_T_F_A,:)=dTSS_F_A(n_time,:);
         pTSS_T_F_A(x_dTss_T_F_A,:)=pTSS_F_A(n_time,:);
          tTSS_T_F_A(x_dTss_T_F_A,:)=tTSS_F_A(n_time,:);
        x_dTss_T_F_A=x_dTss_T_F_A+1;
    end
    if condition_odd==0
        dTSS_M_F_A(x_dTss_M_F_A,:)=dTSS_F_A(n_time,:);
        pTSS_M_F_A(x_dTss_M_F_A,:)=pTSS_F_A(n_time,:);
          tTSS_M_F_A(x_dTss_M_F_A,:)=tTSS_F_A(n_time,:);
        x_dTss_M_F_A=x_dTss_M_F_A+1;
    end
end