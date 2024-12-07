if (n_trac == track_TSS_no)
    if (check_winding==1)
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
        %%% write for T winding for fault winding teaser
        if (raise_flag==0)
            %%change
            pp=pTSS_T(nt,:);
            pp=pp(pp~=-100);
            pp=transpose(pp);
            tt=nonzeros(tTSS_T(nt,:));
            tt=transpose(tt);
            ss_pp= length(pp);
            ss_tt= length(tt);
            busdata_TSS_T=zeros(ss_pp,4);
            xx=1;                             %%current position              %% formation of bus data for TSS1 teaser winding %%
            ii=1;
            iii=1;
            while ii<=ss_pp+1
                if (ii==fault_bus_index)
                    busdata_TSS_T(ii,1)=xx; %%check program current position
                    busdata_TSS_T(ii,2)=2;
                    busdata_TSS_T(ii,3)=0;
                    busdata_TSS_T(ii,4)=1;

                    xx=xx+1;

                else
                    busdata_TSS_T(ii,1)=xx;
                    busdata_TSS_T(ii,2)=tt(iii);
                    busdata_TSS_T(ii,3)=pp(iii)/1000;
                    if (tt(iii)==2)
                        busdata_TSS_T(ii,4)=1;
                    else
                        busdata_TSS_T(ii,4)=0;
                    end
                    xx=xx+1;
                    iii=iii+1;
                end
                ii=ii+1;

            end
            busdata=  busdata_TSS_T;

        else % raise_flag ~=0
            %% no change the fault is in pre exixting bus so no requirenent of change
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
            busdata =  busdata_TSS_T;
        end




        %%%
    else %check_winding==2
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
        %%% write for main for check winding 2
        if (raise_flag==0)
            %%change
            pp=pTSS_M(nt,:);
            pp=pp(pp~=-100);
            pp=transpose(pp);
            tt=nonzeros(tTSS_M(nt,:));
            tt=transpose(tt);
            ss_pp= length(pp);
            ss_tt= length(tt);
            busdata_TSS_M=zeros(ss_pp,4);
            xx=1;                             %%current position              %% formation of bus data for TSS1 teaser winding %%
            ii=1;
            iii=1;
            while ii<=ss_pp+1
                if (ii==fault_bus_index)
                    busdata_TSS_M(ii,1)=xx; %%check program current position
                    busdata_TSS_M(ii,2)=2;
                    busdata_TSS_M(ii,3)=0;
                    busdata_TSS_M(ii,4)=1;

                    xx=xx+1;

                else
                    busdata_TSS_M(ii,1)=xx;
                    busdata_TSS_M(ii,2)=tt(iii);
                    busdata_TSS_M(ii,3)=pp(iii)/1000;
                    if (tt(iii)==2)
                        busdata_TSS_M(ii,4)=1;
                    else
                        busdata_TSS_M(ii,4)=0;
                    end
                    xx=xx+1;
                    iii=iii+1;
                end
                ii=ii+1;

            end
            busdataM=  busdata_TSS_M;

        else % raise_flag ~=0
            %% no change the fault is in pre exixting bus so no requirenent of change
            pp=pTSS_M(nt,:);
            pp=pp(pp~=-100);
            pp=transpose(pp);
            tt=nonzeros(tTSS_M(nt,:));
            tt=transpose(tt);
            ss_pp= length(pp);
            ss_tt= length(tt);
            busdata_TSS_M=zeros(ss_pp,4);
            xx=1;                                           %% formation of bus data for TSS1 teaser winding %%

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
            busdataM =  busdata_TSS_M;
        end
       %%%
    end

else %% the tss track is not for  fault tss.
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
end