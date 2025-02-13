NT_T=length(dTSS_down);
no_of_TSS=length(TSS);
no_of_TSS_windings=2*no_of_TSS;  %under normal condition%
%dTSS_T=zeros(no_of_TSS*y,15);    %under normal condition%
dTSS_T_down=zeros((no_of_TSS-1)*y,15);    %under outage condition%
%dTSS_M=zeros(no_of_TSS*y,15);       %under normal condition%
dTSS_M_down=zeros((no_of_TSS-1)*y,15);       %under outage condition%
%pTSS_T=zeros(no_of_TSS*y,15);       %under normal condition%
pTSS_T_down=zeros((no_of_TSS-1)*y,15);       %under outage condition%
%pTSS_M=zeros(no_of_TSS*y,15);       %under normal condition% 
pTSS_M_down=zeros((no_of_TSS-1)*y,15);       %under outage condition% 
%tTSS_T=zeros(no_of_TSS*y,15);       %under normal condition%
tTSS_T_down=zeros((no_of_TSS-1)*y,15);       %under outage condition%
%tTSS_M=zeros(no_of_TSS*y,15);       %under normal condition%
tTSS_M_down=zeros((no_of_TSS-1)*y,15);       %under outage condition%

winding_position=0;     %%indecating TSS no+1%%
check=1;
x_dTss_T_down=1;
x_dTss_M_down=1;


if N_TSS_O==1
    check=check-1;

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
end
if N_TSS_O==no_of_TSS
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
end
if N_TSS_O ~= 1 && N_TSS_O~=no_of_TSS
    for n_time=1:1:NT_T

        if n_time==((2*winding_position+1)*y+1)
            check=check+1;
            winding_position=winding_position+1;            %% to be done%%
        end
        if check==N_TSS_O
            if n_time==((2*winding_position)*y+1)
                check=check+1;
            end
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
end

