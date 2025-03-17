pp=pTSS_T_up(nt,:);
pp2=pTSS_T_down(nt,:);
pp=pp(pp~=-100);
pp2=pp2(pp2~=-100);
pp=transpose(pp);
pp2=transpose(pp2);
tt=nonzeros(tTSS_T_up(nt,:));
tt2=nonzeros(tTSS_T_down(nt,:));
tt=transpose(tt);
tt2=transpose(tt2);
ss_pp= length(pp)+length(pp2);
ss_tt= length(tt)+length(tt2);
busdata_TSS_T=zeros(ss_pp-1,4);
xx=1;                                           %% formation of bus data for TSS1 teaser winding %%
xx1=1;
xx11=2;
for ii=1:1:ss_pp-1
    if ii<=length(pp)
        busdata_TSS_T(ii,1)=xx;
        busdata_TSS_T(ii,2)=tt(ii);
        busdata_TSS_T(ii,3)=pp(ii)/1000;   % bus power (MW)
        if tt(ii)==2
            busdata_TSS_T(ii,4)=1;
        else
            busdata_TSS_T(ii,4)=0;
        end
        xx=xx+1;
        xx1=xx;
    else
        
        busdata_TSS_T(ii,1)=xx1;
        busdata_TSS_T(ii,2)=tt2(xx11);
        busdata_TSS_T(ii,3)=pp2(xx11)/1000;   % bus power (MW)
        if tt2(xx11)==2
            busdata_TSS_T(ii,4)=1;
        else
            busdata_TSS_T(ii,4)=0;
        end
        xx1=ii+1;
        xx11=xx11+1;
    end
    %         xx=xx+1;

end
busdata=  busdata_TSS_T;

pp_m=pTSS_M_up(nt,:);
pp2_m=pTSS_M_down(nt,:);
pp_m=pp_m(pp_m~=-100);
pp2_m=pp2_m(pp2_m~=-100);
pp_m=transpose(pp_m);
pp2_m=transpose(pp2_m);
tt_m=nonzeros(tTSS_M_up(nt,:));
tt2_m=nonzeros(tTSS_M_down(nt,:));
tt_m=transpose(tt_m);
tt2_m=transpose(tt2_m);
ss_pp_m= length(pp_m)+length(pp2_m);
ss_tt_m= length(tt_m)+length(tt2_m);
busdata_TSS_M=zeros(ss_pp_m-1,4);
xx=1;                                           %% formation of bus data for TSS1 main winding %%
xx1=1;
xx11=2;
for ii=1:1:ss_pp_m-1
    if ii<=length(pp_m)
        busdata_TSS_M(ii,1)=xx;
        busdata_TSS_M(ii,2)=tt_m(ii);
        busdata_TSS_M(ii,3)=pp_m(ii)/1000;   % bus power (MW)
        if tt_m(ii)==2
            busdata_TSS_M(ii,4)=1;
        else
            busdata_TSS_M(ii,4)=0;
        end
        xx=xx+1;
        xx1=xx;
    else
        
        busdata_TSS_M(ii,1)=xx1;
        busdata_TSS_M(ii,2)=tt2_m(xx11);
        busdata_TSS_M(ii,3)=pp2_m(xx11)/1000;   % bus power (MW)
        if tt2_m(xx11)==2
            busdata_TSS_M(ii,4)=1;
        else
            busdata_TSS_M(ii,4)=0;
        end
        xx1=ii+1;
        xx11=xx11+1;
    end
    %         xx=xx+1;

end
busdataM=  busdata_TSS_M;
