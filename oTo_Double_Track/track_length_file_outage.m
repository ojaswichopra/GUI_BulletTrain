d_length=length(d);
d_new_length=d_length-2*length(N_TSS_O);
dd_i=1;
if N_TSS_O==1
    for d_i=1:1:d_new_length
        if dd_i==2*N_TSS_O-1
            dd_i=dd_i;
            % continue
        end
        if dd_i==2*N_TSS_O
            dd_i=dd_i+2;
        end
        d_new(d_i)=d(dd_i);
        dd_i=dd_i+1;
    end
elseif N_TSS_O==N_TSS
    for d_i=1:1:d_new_length
        if dd_i==2*N_TSS_O-1
            dd_i=dd_i+2;
            % continue
        end
        if dd_i==2*N_TSS_O
            dd_i=dd_i+1;
        end
        d_new(d_i)=d(dd_i);
        dd_i=dd_i+1;
    end
else
    for d_i=1:1:d_new_length
        if dd_i==2*N_TSS_O-1
            dd_i=dd_i+1;
        end
        if dd_i==2*N_TSS_O+1
            dd_i=dd_i+1;
        end
        d_new(d_i)=d(dd_i);
        dd_i=dd_i+1;
    end
end
d_modified=zeros(1,d_new_length-1);
for jj=1:1:d_new_length-1
    d_modified(jj)=d_new(jj+1)-d_new(jj);
end
no_of_TSS_new=length(TSS)-length(N_TSS_O);
no_of_TSS_windings=2*(no_of_TSS_new);
winding_position_track=0;
check_lt=1;
winding_length_T=zeros(1,no_of_TSS_new);
winding_length_M=zeros(1,no_of_TSS_new);
jj_t=1;
jj_m=1;
for jj=1:1:length(d_modified)
    if jj==2*N_TSS_O-1
        check_lt=check_lt+1;
    end
    if jj==(2*winding_position_track+1)+1
        check_lt=check_lt+1;
        winding_position_track=winding_position_track+1;
    end
    condition_odd_track=mod(check_lt,2);
    if condition_odd_track==1
        winding_length_T(1,jj_t)=d_modified(1,jj);
        jj_t=jj_t+1;
    end
    if condition_odd_track==0
        winding_length_M(1,jj_m)=d_modified(1,jj);
        jj_m=jj_m+1;
    end
end


