pp=pTSS_T(nt,:);
pp2=pTSS_T_F_A(nt,:);
pp=pp(pp~=-100);
pp2=pp2(pp2~=-100);
pp=transpose(pp);
pp2=transpose(pp2);
tt=nonzeros(tTSS_T(nt,:));
tt2=nonzeros(tTSS_T_F_A(nt,:));
tt=transpose(tt);
tt2=transpose(tt2);
ss_pp= length(pp)+length(pp2);
ss_tt= length(tt)+length(tt2);
busdata_TSS_T=zeros(ss_pp-1,4);
xx=1;                                           %% formation of bus data for TSS1 teaser winding %%
xx1=1;
xx11=2;
for ii=1:1:ss_pp-1
    if (ii<=length(pp))
        busdata_TSS_T(ii,1)=xx;
        busdata_TSS_T(ii,2)=tt(ii);
        busdata_TSS_T(ii,3)=pp(ii);
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
        busdata_TSS_T(ii,3)=pp2(xx11);
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


pp=pTSS_M(nt,:);
pp=pp(pp~=-100);
pp=transpose(pp);
tt=nonzeros(tTSS_M(nt,:));
tt=transpose(tt);
ss_pp= length(pp);
ss_tt= length(tt);
busdata_TSS_M=zeros(ss_pp,4);
xx=1;                                           %% formation of bus data for TSS1 main winding %%
tt_emp=isempty(tt);
if (tt_emp~=1)
    for ii=1:1:ss_pp
        busdata_TSS_M(ii,1)=xx;
        busdata_TSS_M(ii,2)=tt(ii);
        busdata_TSS_M(ii,3)=pp(ii);
        if tt(ii)==2
            busdata_TSS_M(ii,4)=1;
        else
            busdata_TSS_M(ii,4)=0;
        end
        xx=xx+1;

    end
    busdataM=busdata_TSS_M;
end