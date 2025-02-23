if (n_trac == track_TSS_no)
    if (check_winding==1)
        if track_up_down==1
            YY_up=nonzeros(dTSS_T_up(nt,:));
            YY_up=transpose(YY_up);
            YY_down=nonzeros(dTSS_T_down(nt,:));
            YY_down=transpose(YY_down);
            qq= length(YY_up)+length(YY_down);
            %     linedata_dTSS_T=zeros(qq,3);
            Total_track_till_train_length= sum(YY_up);


            if (distance_from_TSS>Total_track_till_train_length)
                qq_up= length(YY_up);
                raise_flag=0;
                fault_bus_index=qq_up+2;
                linedata_dTSS_T=zeros(qq,3); %%%doing
                ff=1;                                           %% formation of line data for TSS2 Teaser winding %%
                ff1=1;
                ff11=1;
                ee=2;
                xx_up=1;
                xx_down=1;
                for ii=1:1:qq+1
                    if ii<=length(YY_up)+1
                        linedata_dTSS_T(ii,1)=ff;
                        linedata_dTSS_T(ii,2)=ee;
                        linedata_dTSS_T(ii,3)=1;
                        if (ii>qq_up)
                            linedata_dTSS_T(ii,4)=(distance_from_TSS-Total_track_till_train_length)/1000;
                        else
                            linedata_dTSS_T(ii,4)=YY_up(ff)/1000;
                        end
                        %%ppppp
                        ff=ff+1;
                        linedata_dTSS_T_up(n_trac,xx_up)=linedata_dTSS_T(ii,4);
                        xx_up=xx_up+1;
                        %                         ff1=ff;

                    else
                        linedata_dTSS_T(ii,1)=ff1;
                        linedata_dTSS_T(ii,2)=ee;
                        linedata_dTSS_T(ii,3)=1;
                        linedata_dTSS_T(ii,4)=YY_down(ff11)/1000;%/1000;
                        ff11=ff11+1;
                        ff1=ee;
                        linedata_dTSS_T_down(n_trac,xx_down)=linedata_dTSS_T(ii,4);
                        xx_down=xx_down+1;
                    end
                    ee=ee+1;

                end
                linedata= linedata_dTSS_T;
            else
                %% check of existing nodes or not at user input location
                YY_length=length(YY_up);
                sum_yy=0;
                raise_flag=0; %% denotes that the fault is at pre exixting bus or not
                if (distance_from_TSS==0)
                    raise_flag=raise_flag+1;    % fault at bus 1
                    fault_bus_index=1;
                end
                for i_ddd=1:1:YY_length
                    sum_yy=sum_yy+YY_up(i_ddd);
                    if (distance_from_TSS==sum_yy)  % fault at any other pre-esisting bus than bus 1
                        raise_flag=raise_flag+1;
                        fault_bus_index=i_ddd+1;
                        break;
                    end
                end
                if (raise_flag==0)           %fault at any position  other than pre-esisting buses
                    sum_yy=0;
                    for i_ddd=1:1:YY_length
                        sum_yy=sum_yy+YY_up(i_ddd);
                        if (distance_from_TSS<sum_yy)
                            fault_distance_next_bus=sum_yy-distance_from_TSS;
                            fault_distance_before_bus=YY_up(i_ddd)-fault_distance_next_bus;
                            fault_bus_index=i_ddd+1;
                            break;
                        end
                    end
                    qq= length(YY_up)+length(YY_down)+1;
                    qq_up= length(YY_up)+1;
                    linedata_dTSS_T=zeros(qq,3);
                    ff=1;
                    ff1=1;
                    ff11=1;
                    ee=2;
                    ii=1;
                    fff=1;
                    xx_up=1;
                    xx_down=1;
                    %             for ii=1:1:qq
                    while (ii<=qq)
                        if ii<=length(YY_up)+1
                            linedata_dTSS_T(ii,1)=ff;
                            linedata_dTSS_T(ii,2)=ee;
                            linedata_dTSS_T(ii,3)=1;
                            if (ii==fault_bus_index-1)
                                linedata_dTSS_T(ii,4)=fault_distance_before_bus/1000;
                                linedata_dTSS_T_up(n_trac,xx_up)=linedata_dTSS_T(ii,4);
                                xx_up=xx_up+1;
                                ff=ff+1;
                                ee=ee+1;
                                ii=ii+1;
                                linedata_dTSS_T(ii,1)=ff;
                                linedata_dTSS_T(ii,2)=ee;
                                linedata_dTSS_T(ii,3)=1;
                                linedata_dTSS_T(ii,4)=fault_distance_next_bus/1000;
                                linedata_dTSS_T_up(n_trac,xx_up)=linedata_dTSS_T(ii,4);
                                xx_up=xx_up+1;
                            else
                                linedata_dTSS_T(ii,4)=YY_up(fff)/1000; % check
                                linedata_dTSS_T_up(n_trac,xx_up)=linedata_dTSS_T(ii,4);
                                xx_up=xx_up+1;
                            end
                            ff=ff+1;
                            fff=fff+1;

                        else
                            linedata_dTSS_T(ii,1)=ff1;
                            linedata_dTSS_T(ii,2)=ee;
                            linedata_dTSS_T(ii,3)=1;
                            linedata_dTSS_T(ii,4)=YY_down(ff11)/1000;%/1000;
                            ff11=ff11+1;
                            ff1=ee;
                            linedata_dTSS_T_down(n_trac,xx_down)=linedata_dTSS_T(ii,4);
                            xx_down=xx_down+1;
                        end
                        ee=ee+1;
                        ii=ii+1;

                    end
                else
                    qq= length(YY_up)+length(YY_down);
                    linedata_dTSS_T=zeros(qq,3);
                    ff=1;                                           %% formation of line data for TSS2 teaser winding %%
                    ff1=1;
                    ff11=1;
                    ee=2;
                    xx_up=1;
                    xx_down=1;
                    for ii=1:1:qq
                        if ii<=length(YY_up)
                            linedata_dTSS_T(ii,1)=ff;
                            linedata_dTSS_T(ii,2)=ee;
                            linedata_dTSS_T(ii,3)=1;
                            linedata_dTSS_T(ii,4)=YY_up(ff)/1000;
                            ff=ff+1;
                            linedata_dTSS_T_up(n_trac,xx_up)=linedata_dTSS_T(ii,4);
                            xx_up=xx_up+1;
                        else
                            linedata_dTSS_T(ii,1)=ff1;
                            linedata_dTSS_T(ii,2)=ee;
                            linedata_dTSS_T(ii,3)=1;
                            linedata_dTSS_T(ii,4)=YY_down(ff11)/1000;%/1000;
                            ff11=ff11+1;
                            ff1=ee;
                            linedata_dTSS_T_down(n_trac,xx_down)=linedata_dTSS_T(ii,4);
                            xx_down=xx_down+1;
                        end

                        ee=ee+1;
                    end
                end

                linedata= linedata_dTSS_T;
            end


        else  %down track

            YY_up=nonzeros(dTSS_T_up(nt,:));
            YY_up=transpose(YY_up);
            YY_down=nonzeros(dTSS_T_down(nt,:));
            YY_down=transpose(YY_down);
            qq= length(YY_up)+length(YY_down);
            %     linedata_dTSS_T=zeros(qq,3);
            Total_track_till_train_length= sum(YY_down);
            if (distance_from_TSS>Total_track_till_train_length)
                qq_down= length(YY_down);
                raise_flag=0;
                fault_bus_index=qq_down+2+length(YY_up);
                linedata_dTSS_T=zeros(qq,3); %%%doing
                ff=1;                                           %% formation of line data for TSS2 Teaser winding %%
                ff1=1;
                ff11=1;
                ee=2;
                xx_up=1;
                xx_down=1;
                for ii=1:1:qq+1
                    if ii<=length(YY_up)
                        linedata_dTSS_T(ii,1)=ff;
                        linedata_dTSS_T(ii,2)=ee;
                        linedata_dTSS_T(ii,3)=1;
                        linedata_dTSS_T(ii,4)=YY_up(ff)/1000;
                        ff=ff+1;
                        linedata_dTSS_T_up(n_trac,xx_up)=linedata_dTSS_T(ii,4);
                        xx_up=xx_up+1;

                    else
                        linedata_dTSS_T(ii,1)=ff1;
                        linedata_dTSS_T(ii,2)=ee;
                        linedata_dTSS_T(ii,3)=1;
                        %                         linedata_dTSS_T(ii,4)=YY_down(ff11)/1000;%/1000;
                        if (ii>qq_down+length(YY_up))
                            linedata_dTSS_T(ii,4)=(distance_from_TSS-Total_track_till_train_length)/1000;
                        else
                            linedata_dTSS_T(ii,4)=YY_up(ff11)/1000;
                        end
                        ff11=ff11+1;
                        ff1=ee;
                        linedata_dTSS_T_down(n_trac,xx_down)=linedata_dTSS_T(ii,4);
                        xx_down=xx_down+1;
                    end
                    ee=ee+1;

                end
                linedata= linedata_dTSS_T;
            else
                %%% check of existing nodes or not at user input location
                YY_length=length(YY_down);
                sum_yy=0;
                raise_flag=0; %% denotes that the fault is at pre exixting bus or not
                if (distance_from_TSS==0)
                    raise_flag=raise_flag+1;    % fault at bus 1
                    fault_bus_index=1;
                end
                for i_ddd=1:1:YY_length
                    sum_yy=sum_yy+YY_down(i_ddd);
                    if (distance_from_TSS==sum_yy)  % fault at any other pre-esisting bus than bus 1
                        raise_flag=raise_flag+1;
                        fault_bus_index=i_ddd+1+length(YY_up);
                        break;
                    end
                end
                if (raise_flag==0)           %fault at any position  other than pre-esisting buses
                    sum_yy=0;
                    for i_ddd=1:1:YY_length
                        sum_yy=sum_yy+YY_down(i_ddd);
                        if (distance_from_TSS<sum_yy)
                            fault_distance_next_bus=sum_yy-distance_from_TSS;
                            fault_distance_before_bus=YY_down(i_ddd)-fault_distance_next_bus;
                            fault_bus_index=i_ddd+1+length(YY_up);
                            break;
                        end
                    end
                    qq= length(YY_up)+length(YY_down)+1;
                    qq_down= length(YY_down)+1;
                    linedata_dTSS_T=zeros(qq,3);
                    ff=1;
                    ff1=1;
                    ff11=1;
                    ee=2;
                    ii=1;
                    fff=1;
                    xx_up=1;
                    xx_down=1;
                    %             for ii=1:1:qq
                    while (ii<=qq)
                        if ii<=length(YY_up)
                            linedata_dTSS_T(ii,1)=ff;
                            linedata_dTSS_T(ii,2)=ee;
                            linedata_dTSS_T(ii,3)=1;
                            linedata_dTSS_T(ii,4)=YY_up(ff)/1000;%/1000;

                            ff=ff+1;
                            linedata_dTSS_T_up(n_trac,xx_up)=linedata_dTSS_T(ii,4);
                            xx_up=xx_up+1;

                        else
                            linedata_dTSS_T(ii,1)=ff1;
                            linedata_dTSS_T(ii,2)=ee;
                            linedata_dTSS_T(ii,3)=1;
                            %                     linedata_dTSS_T(ii,4)=YY_down(ff11)/1000;%/1000;

                            if (ii==fault_bus_index-1)
                                linedata_dTSS_T(ii,4)=fault_distance_before_bus/1000;
                                linedata_dTSS_T_down(n_trac,xx_down)=linedata_dTSS_T(ii,4);
                                xx_down=xx_down+1;
                                ff1=ee;
                                ee=ee+1;
                                ii=ii+1;
                                linedata_dTSS_T(ii,1)=ff1;
                                linedata_dTSS_T(ii,2)=ee;
                                linedata_dTSS_T(ii,3)=1;
                                linedata_dTSS_T(ii,4)=fault_distance_next_bus/1000;
                                linedata_dTSS_T_down(n_trac,xx_down)=linedata_dTSS_T(ii,4);
                                xx_down=xx_down+1;
                            else
                                linedata_dTSS_T(ii,4)=YY_down(fff)/1000; % check
                                linedata_dTSS_T_down(n_trac,xx_down)=linedata_dTSS_T(ii,4);
                                xx_down=xx_down+1;
                            end
                            ff11=ff11+1;
                            fff=fff+1;
                            ff1=ee;

                        end
                        ee=ee+1;
                        ii=ii+1;

                    end
                else
                    qq= length(YY_up)+length(YY_down);
                    linedata_dTSS_T=zeros(qq,3);
                    ff=1;                                           %% formation of line data for TSS2 teaser winding %%
                    ff1=1;
                    ff11=1;
                    ee=2;
                    xx_up=1;
                    xx_down=1;
                    for ii=1:1:qq
                        if ii<=length(YY_up)
                            linedata_dTSS_T(ii,1)=ff;
                            linedata_dTSS_T(ii,2)=ee;
                            linedata_dTSS_T(ii,3)=1;
                            linedata_dTSS_T(ii,4)=YY_up(ff)/1000;
                            ff=ff+1;
                            linedata_dTSS_T_up(n_trac,xx_up)=linedata_dTSS_T(ii,4);
                            xx_up=xx_up+1;
                        else
                            linedata_dTSS_T(ii,1)=ff1;
                            linedata_dTSS_T(ii,2)=ee;
                            linedata_dTSS_T(ii,3)=1;
                            linedata_dTSS_T(ii,4)=YY_down(ff11)/1000;%/1000;
                            ff11=ff11+1;
                            ff1=ee;
                            linedata_dTSS_T_down(n_trac,xx_down)=linedata_dTSS_T(ii,4);
                            xx_down=xx_down+1;
                        end

                        ee=ee+1;
                    end
                end

                linedata= linedata_dTSS_T;

            end

        end

        ZZ_up=nonzeros(dTSS_M_up(nt,:));
        ZZ_up=transpose(ZZ_up);
        ZZ_down=nonzeros(dTSS_M_down(nt,:));
        ZZ_down=transpose(ZZ_down);
        ss= length(ZZ_up)+length(ZZ_down);
        linedata_dTSS_M=zeros(ss,3);
        xx=1;                                           %% formation of line data for TSS2 main winding %%
        xx1=1;
        XX11=1;
        yy=2;
        xx_up=1;
        xx_down=1;
        for ii=1:1:ss
            if ii<=length(ZZ_up)
                linedata_dTSS_M(ii,1)=xx;
                linedata_dTSS_M(ii,2)=yy;
                linedata_dTSS_M(ii,3)=1;
                linedata_dTSS_M(ii,4)=ZZ_up(xx)/1000;%/1000;
                xx=xx+1;
                linedata_dTSS_M_up(n_trac,xx_up)=linedata_dTSS_M(ii,4);
                xx_up=xx_up+1;
            else
                linedata_dTSS_M(ii,1)=xx1;
                linedata_dTSS_M(ii,2)=yy;
                linedata_dTSS_M(ii,3)=1;
                linedata_dTSS_M(ii,4)=ZZ_down(XX11)/1000;%/1000;
                XX11=XX11+1;
                xx1=yy;
                linedata_dTSS_M_down(n_trac,xx_down)=linedata_dTSS_M(ii,4);
                xx_down=xx_down+1;
            end
            yy=yy+1;
        end
        linedataM= linedata_dTSS_M;
    else % check_winding==2 main winding

        if track_up_down==1
            ZZ_up=nonzeros(dTSS_M_up(nt,:));
            ZZ_up=transpose(ZZ_up);
            ZZ_down=nonzeros(dTSS_M_down(nt,:));
            ZZ_down=transpose(ZZ_down);
            ss= length(ZZ_up)+length(ZZ_down);
            %     linedata_dTSS_T=zeros(qq,3);
            Total_track_till_train_length= sum(ZZ_up);


            if (distance_from_TSS>Total_track_till_train_length)
                ss_up= length(ZZ_up);
                raise_flag=0;
                fault_bus_index=ss_up+2;
                linedata_dTSS_M=zeros(ss,3); %%%doing
                xx=1;                                           %% formation of line data for TSS2 Teaser winding %%
                xx1=1;
                xx11=1;
                yy=2;
                xx_up=1;
                xx_down=1;
                for ii=1:1:ss+1
                    if ii<=length(ZZ_up)+1
                        linedata_dTSS_M(ii,1)=xx;
                        linedata_dTSS_M(ii,2)=yy;
                        linedata_dTSS_M(ii,3)=1;
                        if (ii>ss_up)
                            linedata_dTSS_M(ii,4)=(distance_from_TSS-Total_track_till_train_length)/1000;
                        else
                            linedata_dTSS_M(ii,4)=ZZ_up(xx)/1000;
                        end
                        %%ppppp
                        xx=xx+1;
                        linedata_dTSS_M_up(n_trac,xx_up)=linedata_dTSS_M(ii,4);
                        xx_up=xx_up+1;
                        %                         xx1=xx;

                    else
                        linedata_dTSS_M(ii,1)=xx1;
                        linedata_dTSS_M(ii,2)=yy;
                        linedata_dTSS_M(ii,3)=1;
                        linedata_dTSS_M(ii,4)=ZZ_down(xx11)/1000;%/1000;
                        xx11=xx11+1;
                        xx1=yy;
                        linedata_dTSS_M_down(n_trac,xx_down)=linedata_dTSS_M(ii,4);
                        xx_down=xx_down+1;
                    end
                    yy=yy+1;

                end
                linedataM= linedata_dTSS_M;
            else
                %% check of existing nodes or not at user input location
                ZZ_length=length(ZZ_up);
                sum_zz=0;
                raise_flag=0; %% denotes that the fault is at pre exixting bus or not
                if (distance_from_TSS==0)
                    raise_flag=raise_flag+1;    % fault at bus 1
                    fault_bus_index=1;
                end
                for i_ddd=1:1:ZZ_length
                    sum_zz=sum_zz+ZZ_up(i_ddd);
                    if (distance_from_TSS==sum_zz)  % fault at any other pre-esisting bus than bus 1
                        raise_flag=raise_flag+1;
                        fault_bus_index=i_ddd+1;
                        break;
                    end
                end
                if (raise_flag==0)           %fault at any position  other than pre-esisting buses
                    sum_zz=0;
                    for i_ddd=1:1:ZZ_length
                        sum_zz=sum_zz+ZZ_up(i_ddd);
                        if (distance_from_TSS<sum_zz)
                            fault_distance_next_bus=sum_zz-distance_from_TSS;
                            fault_distance_before_bus=ZZ_up(i_ddd)-fault_distance_next_bus;
                            fault_bus_index=i_ddd+1;
                            break;
                        end
                    end
                    ss= length(ZZ_up)+length(ZZ_down)+1;
                    ss_up= length(ZZ_up)+1;
                    linedata_dTSS_M=zeros(ss,3);
                    xx=1;
                    xx1=1;
                    xx11=1;
                    yy=2;
                    ii=1;
                    xxx=1;
                    xx_up=1;
                    xx_down=1;
                    %             for ii=1:1:qq
                    while (ii<=ss)
                        if ii<=length(ZZ_up)+1
                            linedata_dTSS_M(ii,1)=xx;
                            linedata_dTSS_M(ii,2)=yy;
                            linedata_dTSS_M(ii,3)=1;
                            if (ii==fault_bus_index-1)
                                linedata_dTSS_M(ii,4)=fault_distance_before_bus/1000;
                                linedata_dTSS_M_up(n_trac,xx_up)=linedata_dTSS_M(ii,4);
                                xx_up=xx_up+1;
                                xx=xx+1;
                                yy=yy+1;
                                ii=ii+1;
                                linedata_dTSS_M(ii,1)=xx;
                                linedata_dTSS_M(ii,2)=yy;
                                linedata_dTSS_M(ii,3)=1;
                                linedata_dTSS_M(ii,4)=fault_distance_next_bus/1000;
                                linedata_dTSS_M_up(n_trac,xx_up)=linedata_dTSS_M(ii,4);
                                xx_up=xx_up+1;
                            else
                                linedata_dTSS_M(ii,4)=ZZ_up(xxx)/1000; % check
                                linedata_dTSS_M_up(n_trac,xx_up)=linedata_dTSS_M(ii,4);
                                xx_up=xx_up+1;
                            end
                            xx=xx+1;
                            xxx=xxx+1;

                        else
                            linedata_dTSS_M(ii,1)=xx1;
                            linedata_dTSS_M(ii,2)=yy;
                            linedata_dTSS_M(ii,3)=1;
                            linedata_dTSS_M(ii,4)=ZZ_down(xx11)/1000;%/1000;
                            xx11=xx11+1;
                            xx1=yy;
                            linedata_dTSS_M_down(n_trac,xx_down)=linedata_dTSS_M(ii,4);
                            xx_down=xx_down+1;
                        end
                        yy=yy+1;
                        ii=ii+1;

                    end
                else
                    ss= length(ZZ_up)+length(ZZ_down);
                    linedata_dTSS_M=zeros(ss,3);
                    xx=1;                                           %% formation of line data for TSS2 teaser winding %%
                    xx1=1;
                    xx11=1;
                    yy=2;
                    xx_up=1;
                    xx_down=1;
                    for ii=1:1:ss
                        if ii<=length(ZZ_up)
                            linedata_dTSS_M(ii,1)=xx;
                            linedata_dTSS_M(ii,2)=yy;
                            linedata_dTSS_M(ii,3)=1;
                            linedata_dTSS_M(ii,4)=ZZ_up(xx)/1000;
                            xx=xx+1;
                            linedata_dTSS_M_up(n_trac,xx_up)=linedata_dTSS_M(ii,4);
                            xx_up=xx_up+1;
                        else
                            linedata_dTSS_M(ii,1)=xx1;
                            linedata_dTSS_M(ii,2)=yy;
                            linedata_dTSS_M(ii,3)=1;
                            linedata_dTSS_M(ii,4)=ZZ_down(xx11)/1000;%/1000;
                            xx11=xx11+1;
                            xx1=yy;
                            linedata_dTSS_M_down(n_trac,xx_down)=linedata_dTSS_M(ii,4);
                            xx_down=xx_down+1;
                        end

                        yy=yy+1;
                    end
                end

                linedataM= linedata_dTSS_M;
            end
        else  %down track

            ZZ_up=nonzeros(dTSS_M_up(nt,:));
            ZZ_up=transpose(ZZ_up);
            ZZ_down=nonzeros(dTSS_M_down(nt,:));
            ZZ_down=transpose(ZZ_down);
            ss= length(ZZ_up)+length(ZZ_down);
            %     linedata_dTSS_T=zeros(qq,3);
            Total_track_till_train_length= sum(ZZ_down);
            if (distance_from_TSS>Total_track_till_train_length)
                qq_down= length(ZZ_down);
                raise_flag=0;
                fault_bus_index=qq_down+2+length(ZZ_up);
                linedata_dTSS_M=zeros(ss,3); %%%doing
                xx=1;                                           %% formation of line data for TSS2 Teaser winding %%
                xx1=1;
                xx11=1;
                yy=2;
                xx_up=1;
                xx_down=1;
                for ii=1:1:ss+1
                    if ii<=length(ZZ_up)
                        linedata_dTSS_M(ii,1)=xx;
                        linedata_dTSS_M(ii,2)=yy;
                        linedata_dTSS_M(ii,3)=1;
                        linedata_dTSS_M(ii,4)=ZZ_up(xx)/1000;
                        xx=xx+1;
                        linedata_dTSS_M_up(n_trac,xx_up)=linedata_dTSS_M(ii,4);
                        xx_up=xx_up+1;

                    else
                        linedata_dTSS_M(ii,1)=xx1;
                        linedata_dTSS_M(ii,2)=yy;
                        linedata_dTSS_M(ii,3)=1;
                        %                         linedata_dTSS_M(ii,4)=ZZ_down(xx11)/1000;%/1000;
                        if (ii>qq_down+length(ZZ_up))
                            linedata_dTSS_M(ii,4)=(distance_from_TSS-Total_track_till_train_length)/1000;
                        else
                            linedata_dTSS_M(ii,4)=ZZ_up(xx11)/1000;
                        end
                        xx11=xx11+1;
                        xx1=yy;
                        linedata_dTSS_M_down(n_trac,xx_down)=linedata_dTSS_M(ii,4);
                        xx_down=xx_down+1;
                    end
                    yy=yy+1;

                end
                linedataM= linedata_dTSS_M;
            else
                %%% check of existing nodes or not at user input location
                ZZ_length=length(ZZ_down);
                sum_zz=0;
                raise_flag=0; %% denotes that the fault is at pre exixting bus or not
                if (distance_from_TSS==0)
                    raise_flag=raise_flag+1;    % fault at bus 1
                    fault_bus_index=1;
                end
                for i_ddd=1:1:ZZ_length
                    sum_zz=sum_zz+ZZ_down(i_ddd);
                    if (distance_from_TSS==sum_zz)  % fault at any other pre-esisting bus than bus 1
                        raise_flag=raise_flag+1;
                        fault_bus_index=i_ddd+1+length(ZZ_up);
                        break;
                    end
                end
                if (raise_flag==0)           %fault at any position  other than pre-esisting buses
                    sum_zz=0;
                    for i_ddd=1:1:ZZ_length
                        sum_zz=sum_zz+ZZ_down(i_ddd);
                        if (distance_from_TSS<sum_zz)
                            fault_distance_next_bus=sum_zz-distance_from_TSS;
                            fault_distance_before_bus=ZZ_down(i_ddd)-fault_distance_next_bus;
                            fault_bus_index=i_ddd+1+length(ZZ_up);
                            break;
                        end
                    end
                    ss= length(ZZ_up)+length(ZZ_down)+1;
                    qq_down= length(ZZ_down)+1;
                    linedata_dTSS_M=zeros(ss,3);
                    xx=1;
                    xx1=1;
                    xx11=1;
                    yy=2;
                    ii=1;
                    xxx=1;
                    xx_up=1;
                    xx_down=1;
                    %             for ii=1:1:qq
                    while (ii<=ss)
                        if ii<=length(ZZ_up)
                            linedata_dTSS_M(ii,1)=xx;
                            linedata_dTSS_M(ii,2)=yy;
                            linedata_dTSS_M(ii,3)=1;
                            linedata_dTSS_M(ii,4)=ZZ_up(xx)/1000;%/1000;

                            xx=xx+1;
                            linedata_dTSS_M_up(n_trac,xx_up)=linedata_dTSS_M(ii,4);
                            xx_up=xx_up+1;

                        else
                            linedata_dTSS_M(ii,1)=xx1;
                            linedata_dTSS_M(ii,2)=yy;
                            linedata_dTSS_M(ii,3)=1;
                            %                     linedata_dTSS_T(ii,4)=YY_down(ff11)/1000;%/1000;

                            if (ii==fault_bus_index-1)
                                linedata_dTSS_M(ii,4)=fault_distance_before_bus/1000;
                                linedata_dTSS_M_down(n_trac,xx_down)=linedata_dTSS_M(ii,4);
                                xx_down=xx_down+1;
                                %                                 xx1=xx1+1;
                                xx1=yy;
                                yy=yy+1;
                                ii=ii+1;
                                linedata_dTSS_M(ii,1)=xx1;
                                linedata_dTSS_M(ii,2)=yy;
                                linedata_dTSS_M(ii,3)=1;
                                linedata_dTSS_M(ii,4)=fault_distance_next_bus/1000;
                                linedata_dTSS_M_down(n_trac,xx_down)=linedata_dTSS_M(ii,4);
                                xx_down=xx_down+1;
                            else
                                linedata_dTSS_M(ii,4)=ZZ_down(xxx)/1000; % check
                                linedata_dTSS_M_down(n_trac,xx_down)=linedata_dTSS_M(ii,4);
                                xx_down=xx_down+1;
                            end
                            xx11=xx11+1;
                            xxx=xxx+1;
                            xx1=yy;

                        end
                        yy=yy+1;
                        ii=ii+1;

                    end
                else
                    ss= length(ZZ_up)+length(ZZ_down);
                    linedata_dTSS_M=zeros(ss,3);
                    xx=1;                                           %% formation of line data for TSS2 teaser winding %%
                    xx1=1;
                    xx11=1;
                    yy=2;
                    xx_up=1;
                    xx_down=1;
                    for ii=1:1:ss
                        if ii<=length(ZZ_up)
                            linedata_dTSS_M(ii,1)=xx;
                            linedata_dTSS_M(ii,2)=yy;
                            linedata_dTSS_M(ii,3)=1;
                            linedata_dTSS_M(ii,4)=ZZ_up(xx)/1000;
                            xx=xx+1;
                            linedata_dTSS_M_up(n_trac,xx_up)=linedata_dTSS_M(ii,4);
                            xx_up=xx_up+1;
                        else
                            linedata_dTSS_M(ii,1)=xx1;
                            linedata_dTSS_M(ii,2)=yy;
                            linedata_dTSS_M(ii,3)=1;
                            linedata_dTSS_M(ii,4)=ZZ_down(xx11)/1000;%/1000;
                            xx11=xx11+1;
                            xx1=yy;
                            linedata_dTSS_M_down(n_trac,xx_down)=linedata_dTSS_M(ii,4);
                            xx_down=xx_down+1;
                        end

                        yy=yy+1;
                    end
                end

                linedataM= linedata_dTSS_M;

            end

        end
        YY_up=nonzeros(dTSS_T_up(nt,:));
        YY_up=transpose(YY_up);
        YY_down=nonzeros(dTSS_T_down(nt,:));
        YY_down=transpose(YY_down);
        qq= length(YY_up)+length(YY_down);
        linedata_dTSS_T=zeros(qq,3);
        ff=1;                                           %% formation of line data for TSS2 Teaser winding %%
        ff1=1;
        ff11=1;
        ee=2;
        xx_up=1;
        xx_down=1;
        for ii=1:1:qq
            if ii<=length(YY_up)
                linedata_dTSS_T(ii,1)=ff;
                linedata_dTSS_T(ii,2)=ee;
                linedata_dTSS_T(ii,3)=1;
                linedata_dTSS_T(ii,4)=YY_up(ff)/1000;%/1000;
                ff=ff+1;
                linedata_dTSS_T_up(n_trac,xx_up)=linedata_dTSS_T(ii,4);
                xx_up=xx_up+1;
            else
                linedata_dTSS_T(ii,1)=ff1;
                linedata_dTSS_T(ii,2)=ee;
                linedata_dTSS_T(ii,3)=1;
                linedata_dTSS_T(ii,4)=YY_down(ff11)/1000;%/1000;
                ff11=ff11+1;
                ff1=ee;
                linedata_dTSS_T_down(n_trac,xx_down)=linedata_dTSS_T(ii,4);
                xx_down=xx_down+1;
            end
            ee=ee+1;
        end
        linedata= linedata_dTSS_T;
    end
else
    ZZ_up=nonzeros(dTSS_M_up(nt,:));
    ZZ_up=transpose(ZZ_up);
    ZZ_down=nonzeros(dTSS_M_down(nt,:));
    ZZ_down=transpose(ZZ_down);
    ss= length(ZZ_up)+length(ZZ_down);
    linedata_dTSS_M=zeros(ss,3);
    xx=1;                                           %% formation of line data for TSS2 main winding %%
    xx1=1;
    XX11=1;
    yy=2;
    xx_up=1;
    xx_down=1;

    for ii=1:1:ss
        if ii<=length(ZZ_up)
            linedata_dTSS_M(ii,1)=xx;
            linedata_dTSS_M(ii,2)=yy;
            linedata_dTSS_M(ii,3)=1;
            linedata_dTSS_M(ii,4)=ZZ_up(xx)/1000;%/1000;
            xx=xx+1;
            linedata_dTSS_M_up(n_trac,xx_up)=linedata_dTSS_M(ii,4);
            xx_up=xx_up+1;
        else
            linedata_dTSS_M(ii,1)=xx1;
            linedata_dTSS_M(ii,2)=yy;
            linedata_dTSS_M(ii,3)=1;
            linedata_dTSS_M(ii,4)=ZZ_down(XX11)/1000;%/1000;
            XX11=XX11+1;
            xx1=yy;
            linedata_dTSS_M_down(n_trac,xx_down)=linedata_dTSS_M(ii,4);
            xx_down=xx_down+1;
        end
        yy=yy+1;
    end
    linedataM= linedata_dTSS_M;

    YY_up=nonzeros(dTSS_T_up(nt,:));
    YY_up=transpose(YY_up);
    YY_down=nonzeros(dTSS_T_down(nt,:));
    YY_down=transpose(YY_down);
    qq= length(YY_up)+length(YY_down);
    linedata_dTSS_T=zeros(qq,3);
    ff=1;                                           %% formation of line data for TSS2 Teaser winding %%
    ff1=1;
    ff11=1;
    ee=2;
    xx_up=1;
    xx_down=1;

    for ii=1:1:qq
        if ii<=length(YY_up)
            linedata_dTSS_T(ii,1)=ff;
            linedata_dTSS_T(ii,2)=ee;
            linedata_dTSS_T(ii,3)=1;
            linedata_dTSS_T(ii,4)=YY_up(ff)/1000;%/1000;
            ff=ff+1;
            linedata_dTSS_T_up(n_trac,xx_up)=linedata_dTSS_T(ii,4);
            xx_up=xx_up+1;
        else
            linedata_dTSS_T(ii,1)=ff1;
            linedata_dTSS_T(ii,2)=ee;
            linedata_dTSS_T(ii,3)=1;
            linedata_dTSS_T(ii,4)=YY_down(ff11)/1000;%/1000;
            ff11=ff11+1;
            ff1=ee;
            linedata_dTSS_T_down(n_trac,xx_down)=linedata_dTSS_T(ii,4);
            xx_down=xx_down+1;
        end
        ee=ee+1;
    end
    linedata= linedata_dTSS_T;
end