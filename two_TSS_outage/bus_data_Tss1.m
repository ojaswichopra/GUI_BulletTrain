pp=pTSS_T(nt,:);
    pp=pp(pp~=-100);
    pp=transpose(pp);
    tt=nonzeros(tTSS_T(nt,:));
    tt=transpose(tt);
    ss_pp= length(pp);
    ss_tt= length(tt);
    busdata_TSS_T=zeros(ss_pp,4);
    xx=1;                                           %% formation of bus data for TSS1 teaser winding %%
    
    for ii=1:1:ss_pp
        busdata_TSS_T(ii,1)=xx;
        busdata_TSS_T(ii,2)=tt(ii);
        busdata_TSS_T(ii,3)=pp(ii)/1000;
        if (tt(ii)==2)
            busdata_TSS_T(ii,4)=1;
        else
            busdata_TSS_T(ii,4)=0;
        end
        xx=xx+1;
       
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
    
    for ii=1:1:ss_pp
        busdata_TSS_M(ii,1)=xx;
        busdata_TSS_M(ii,2)=tt(ii);
        busdata_TSS_M(ii,3)=pp(ii)/1000;
        if (tt(ii)==2)
            busdata_TSS_M(ii,4)=1;
        else
            busdata_TSS_M(ii,4)=0;
        end
        xx=xx+1;
       
    end
    busdataM=busdata_TSS_M;