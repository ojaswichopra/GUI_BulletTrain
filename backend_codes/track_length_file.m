<<<<<<< HEAD
d_length=length(d);
d_modified=zeros(1,d_length-1);
for jj=1:1:d_length-1
    d_modified(jj)=d(jj+1)-d(jj);
end
no_of_TSS=length(TSS);
no_of_TSS_windings=2*no_of_TSS;
winding_position_track=0;
check_lt=1;
winding_length_T=zeros(1,no_of_TSS);
winding_length_M=zeros(1,no_of_TSS);
jj_t=1;
jj_m=1;
for jj=1:1:length(d_modified)
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


=======
d_length=length(d);
d_modified=zeros(1,d_length-1);
for jj=1:1:d_length-1
    d_modified(jj)=d(jj+1)-d(jj);
end
no_of_TSS=length(TSS);
no_of_TSS_windings=2*no_of_TSS;
winding_position_track=0;
check_lt=1;
winding_length_T=zeros(1,no_of_TSS);
winding_length_M=zeros(1,no_of_TSS);
jj_t=1;
jj_m=1;
for jj=1:1:length(d_modified)
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


>>>>>>> a6b21b859934a8cd5093e7439821c631fce9c22b
