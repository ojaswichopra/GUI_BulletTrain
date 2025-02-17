
NT_T=length(dTSS_down);
no_of_TSS=length(TSS)-length(N_TSS_O);
no_of_TSS_windings=2*no_of_TSS;
dTSS_T_down=zeros(no_of_TSS*y,20);
dTSS_M_down=zeros(no_of_TSS*y,20);
pTSS_T_down=zeros(no_of_TSS*y,20);
pTSS_M_down=zeros(no_of_TSS*y,20);
tTSS_T_down=zeros(no_of_TSS*y,20);
tTSS_M_down=zeros(no_of_TSS*y,20);
winding_position=0;
check=1;
x_dTss_T_down=1;
x_dTss_M_down=1;
for n_time=1:1:NT_T

    if n_time==((2*winding_position+1)*y+1)
        check=check+1;
        winding_position=winding_position+1;
    end
    condition_odd=mod(check,2);
    if condition_odd==1
        dTSS_T_down(x_dTss_T_down,:)=dTSS_down(n_time,:);
         pTSS_T_down(x_dTss_T_down,:)=pTSS_down(n_time,:);
          tTSS_T_down(x_dTss_T_down,:)=tTSS_down(n_time,:);
        x_dTss_T_down=x_dTss_T_down+1;
    end
    if condition_odd==0
        dTSS_M_down(x_dTss_M_down,:)=dTSS_down(n_time,:);
        pTSS_M_down(x_dTss_M_down,:)=pTSS_down(n_time,:);
          tTSS_M_down(x_dTss_M_down,:)=tTSS_down(n_time,:);
        x_dTss_M_down=x_dTss_M_down+1;
    end
end