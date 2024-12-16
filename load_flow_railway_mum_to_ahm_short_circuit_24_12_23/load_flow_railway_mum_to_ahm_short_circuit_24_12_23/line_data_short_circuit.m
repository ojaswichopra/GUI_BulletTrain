if (n_trac == track_TSS_no)
    if (check_winding==1)
        ZZ=nonzeros(dTSS_M(nt,:));
        ZZ=transpose(ZZ);
        ss= length(ZZ);
        linedata_dTSS_M=zeros(ss,3);
        xx=1;                                           %% formation of line data for TSS2 main winding %%
        yy=2;
        for ii=1:1:ss
            linedata_dTSS_M(ii,1)=xx;
            linedata_dTSS_M(ii,2)=yy;
            linedata_dTSS_M(ii,3)=1;
            linedata_dTSS_M(ii,4)=ZZ(xx)/1000;
            xx=xx+1;
            yy=yy+1;
        end
        linedataM= linedata_dTSS_M;

        YY=nonzeros(dTSS_T(nt,:));
        YY=transpose(YY);
        Total_track_till_train_length= sum(YY);
        if (distance_from_TSS>Total_track_till_train_length)
             qq= length(YY);
            raise_flag=0;
            fault_bus_index=qq+2;
            linedata_dTSS_T=zeros(qq,3); %%%doing
            ff=1;                                           %% formation of line data for TSS2 teaser winding %%
            ee=2;
            for ii=1:1:qq+1
                linedata_dTSS_T(ii,1)=ff;
                linedata_dTSS_T(ii,2)=ee;
                linedata_dTSS_T(ii,3)=1;
                if (ii>qq)
                    linedata_dTSS_T(ii,4)=(distance_from_TSS-Total_track_till_train_length)/1000;
                else
                    linedata_dTSS_T(ii,4)=YY(ff)/1000;
                end
                %%ppppp
                ff=ff+1;
                ee=ee+1;
            end
            linedata= linedata_dTSS_T;
        else
            %% check of existing nodes or not at user input location
            YY_length=length(YY);
            sum_yy=0;
            raise_flag=0; %% denotes that the fault is at pre exixting bus or not
            if (distance_from_TSS==0)
                raise_flag=raise_flag+1;    % fault at bus 1
                fault_bus_index=1;
            end
            for i_ddd=1:1:YY_length
                sum_yy=sum_yy+YY(i_ddd);
                if (distance_from_TSS==sum_yy)  % fault at any other pre-esisting bus than bus 1
                    raise_flag=raise_flag+1;
                    fault_bus_index=i_ddd+1;
                    break;
                end
            end
            if (raise_flag==0)           %fault at any position  other than pre-esisting buses
                sum_yy=0;
                for i_ddd=1:1:YY_length
                    sum_yy=sum_yy+YY(i_ddd);
                    if (distance_from_TSS<sum_yy)
                        fault_distance_next_bus=sum_yy-distance_from_TSS;
                        fault_distance_before_bus=YY(i_ddd)-fault_distance_next_bus;
                        fault_bus_index=i_ddd+1;
                        break;
                    end
                end
                qq= length(YY)+1;
                linedata_dTSS_T=zeros(qq,3);
                ff=1;
                ee=2;
                ii=1;
                fff=1;
                %             for ii=1:1:qq
                while (ii<=qq)
                    linedata_dTSS_T(ii,1)=ff;
                    linedata_dTSS_T(ii,2)=ee;
                    linedata_dTSS_T(ii,3)=1;
                    if (ii==fault_bus_index-1)
                        linedata_dTSS_T(ii,4)=fault_distance_before_bus/1000;
                        ff=ff+1;
                        ee=ee+1;
                        ii=ii+1;
                        linedata_dTSS_T(ii,1)=ff;
                        linedata_dTSS_T(ii,2)=ee;
                        linedata_dTSS_T(ii,3)=1;
                        linedata_dTSS_T(ii,4)=fault_distance_next_bus/1000;
                    else
                        linedata_dTSS_T(ii,4)=YY(fff)/1000; % check
                    end

                    ff=ff+1;
                    ee=ee+1;
                    ii=ii+1;
                    fff=fff+1;
                end
            else
                qq= length(YY);
                linedata_dTSS_T=zeros(qq,3);
                ff=1;                                           %% formation of line data for TSS2 teaser winding %%
                ee=2;
                for ii=1:1:qq
                    linedata_dTSS_T(ii,1)=ff;
                    linedata_dTSS_T(ii,2)=ee;
                    linedata_dTSS_T(ii,3)=1;
                    linedata_dTSS_T(ii,4)=YY(ff)/1000;
                    ff=ff+1;
                    ee=ee+1;
                end
            end
            %         qq= length(YY);
            %         linedata_dTSS_T=zeros(qq,3);
            %         ff=1;                                           %% formation of line data for TSS2 teaser winding %%
            %         ee=2;
            %         for ii=1:1:qq
            %             linedata_dTSS_T(ii,1)=ff;
            %             linedata_dTSS_T(ii,2)=ee;
            %             linedata_dTSS_T(ii,3)=1;
            %             linedata_dTSS_T(ii,4)=YY(ff)/1000;
            %             ff=ff+1;
            %             ee=ee+1;
            %         end
            linedata= linedata_dTSS_T;
        end



    else %checkwinding==2
        YY=nonzeros(dTSS_T(nt,:));
        YY=transpose(YY);
        qq= length(YY);
        linedata_dTSS_T=zeros(qq,3);
        ff=1;                                           %% formation of line data for TSS2 teaser winding %%
        ee=2;
        for ii=1:1:qq
            linedata_dTSS_T(ii,1)=ff;
            linedata_dTSS_T(ii,2)=ee;
            linedata_dTSS_T(ii,3)=1;
            linedata_dTSS_T(ii,4)=YY(ff)/1000;
            ff=ff+1;
            ee=ee+1;
        end
        linedata= linedata_dTSS_T;
        %%%%% start of main

        ZZ=nonzeros(dTSS_M(nt,:));
        ZZ=transpose(ZZ);
        Total_track_till_train_length= sum(ZZ);
        if (distance_from_TSS>Total_track_till_train_length)
            ss= length(ZZ);
            raise_flag=0;
            fault_bus_index=ss+2;
            linedata_dTSS_M=zeros(ss,3);
            xx=1;                                           %% formation of line data for TSS2 teaser winding %%
            yy=2;
            for ii=1:1:ss+1
                linedata_dTSS_M(ii,1)=xx;
                linedata_dTSS_M(ii,2)=yy;
                linedata_dTSS_M(ii,3)=1;
                if (ii>ss)
                    linedata_dTSS_M(ii,4)=(distance_from_TSS-Total_track_till_train_length)/1000;
                else
                    linedata_dTSS_M(ii,4)=ZZ(xx)/1000;
                end
                %%ppppp
                xx=xx+1;
                yy=yy+1;
            end
            linedataM= linedata_dTSS_M;

        else
            %% check of existing nodes or not at user input location
            ZZ_length=length(ZZ);
            sum_zz=0;
            raise_flag=0; %% denotes that the fault is at pre exixting bus or not
            if (distance_from_TSS==0)
                raise_flag=raise_flag+1;    % fault at bus 1
                fault_bus_index=1;
            end
            for i_ddd=1:1:ZZ_length
                sum_zz=sum_zz+ZZ(i_ddd);
                if (distance_from_TSS==sum_zz)  % fault at any other pre-esisting bus than bus 1
                    raise_flag=raise_flag+1;
                    fault_bus_index=i_ddd+1;
                    break;
                end
            end
            if (raise_flag==0)            %fault at any position  other than pre-esisting buses
                sum_zz=0;
                for i_ddd=1:1:ZZ_length
                    sum_zz=sum_zz+ZZ(i_ddd);
                    if (distance_from_TSS<sum_zz)
                        fault_distance_next_bus=sum_zz-distance_from_TSS;
                        fault_distance_before_bus=ZZ(i_ddd)-fault_distance_next_bus;
                        fault_bus_index=i_ddd+1;
                        break;
                    end
                end
                ss= length(ZZ)+1; %%current positionn of work
                linedata_dTSS_M=zeros(ss,3);
                xx=1;
                yy=2;
                ii=1;
                xxx=1;
                %             for ii=1:1:ss
                while (ii<=ss)
                    linedata_dTSS_M(ii,1)=xx;
                    linedata_dTSS_M(ii,2)=yy;
                    linedata_dTSS_M(ii,3)=1;
                    if (ii==fault_bus_index-1)
                        linedata_dTSS_M(ii,4)=fault_distance_before_bus/1000;
                        xx=xx+1;
                        yy=yy+1;
                        ii=ii+1;
                        linedata_dTSS_M(ii,1)=xx;
                        linedata_dTSS_M(ii,2)=yy;
                        linedata_dTSS_M(ii,3)=1;
                        linedata_dTSS_M(ii,4)=fault_distance_next_bus/1000;
                    else
                        linedata_dTSS_M(ii,4)=ZZ(xxx)/1000; % check
                    end

                    xx=xx+1;
                    yy=yy+1; %% current position of work
                    ii=ii+1;
                    xxx=xxx+1;
                end
            else
                ss= length(ZZ);
                linedata_dTSS_M=zeros(ss,3);
                xx=1;                                           %% formation of line data for TSS2 teaser winding %%
                yy=2;
                for ii=1:1:ss
                    linedata_dTSS_M(ii,1)=xx;
                    linedata_dTSS_M(ii,2)=yy;
                    linedata_dTSS_M(ii,3)=1;
                    linedata_dTSS_M(ii,4)=ZZ(xx)/1000;
                    xx=xx+1;
                    yy=yy+1;
                end
            end
            %         qq= length(YY);
            %         linedata_dTSS_T=zeros(qq,3);
            %         ff=1;                                           %% formation of line data for TSS2 teaser winding %%
            %         ee=2;
            %         for ii=1:1:qq
            %             linedata_dTSS_T(ii,1)=ff;
            %             linedata_dTSS_T(ii,2)=ee;
            %             linedata_dTSS_T(ii,3)=1;
            %             linedata_dTSS_T(ii,4)=YY(ff)/1000;
            %             ff=ff+1;
            %             ee=ee+1;
            %         end
            linedataM= linedata_dTSS_M;
        end



        %%%%% end of main

    end
else
    ZZ=nonzeros(dTSS_M(nt,:));
    ZZ=transpose(ZZ);
    ss= length(ZZ);
    linedata_dTSS_M=zeros(ss,3);
    xx=1;                                           %% formation of line data for TSS2 main winding %%
    yy=2;
    for ii=1:1:ss
        linedata_dTSS_M(ii,1)=xx;
        linedata_dTSS_M(ii,2)=yy;
        linedata_dTSS_M(ii,3)=1;
        linedata_dTSS_M(ii,4)=ZZ(xx)/1000;
        xx=xx+1;
        yy=yy+1;
    end
    linedataM= linedata_dTSS_M;


    YY=nonzeros(dTSS_T(nt,:));
    YY=transpose(YY);
    qq= length(YY);
    linedata_dTSS_T=zeros(qq,3);
    ff=1;                                           %% formation of line data for TSS2 teaser winding %%
    ee=2;
    for ii=1:1:qq
        linedata_dTSS_T(ii,1)=ff;
        linedata_dTSS_T(ii,2)=ee;
        linedata_dTSS_T(ii,3)=1;
        linedata_dTSS_T(ii,4)=YY(ff)/1000;
        ff=ff+1;
        ee=ee+1;
    end
    linedata= linedata_dTSS_T;
end
