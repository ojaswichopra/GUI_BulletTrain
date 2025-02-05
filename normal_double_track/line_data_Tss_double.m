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
for ii=1:1:ss
    if ii<=length(ZZ_up)
        linedata_dTSS_M(ii,1)=xx;
        linedata_dTSS_M(ii,2)=yy;
        linedata_dTSS_M(ii,3)=1;
        linedata_dTSS_M(ii,4)=ZZ_up(xx)/1000;%/1000;
        xx=xx+1;
    else
        linedata_dTSS_M(ii,1)=xx1;
        linedata_dTSS_M(ii,2)=yy;
        linedata_dTSS_M(ii,3)=1;
        linedata_dTSS_M(ii,4)=ZZ_down(XX11)/1000;%/1000;
        XX11=XX11+1;
        xx1=yy;
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
for ii=1:1:qq
    if ii<=length(YY_up)
        linedata_dTSS_T(ii,1)=ff;
        linedata_dTSS_T(ii,2)=ee;
        linedata_dTSS_T(ii,3)=1;
        linedata_dTSS_T(ii,4)=YY_up(ff)/1000;%/1000;
        ff=ff+1;
    else
        linedata_dTSS_T(ii,1)=ff1;
        linedata_dTSS_T(ii,2)=ee;
        linedata_dTSS_T(ii,3)=1;
        linedata_dTSS_T(ii,4)=YY_down(ff11)/1000;%/1000;
        ff11=ff11+1;
        ff1=ee;
    end
    ee=ee+1;
end
linedata= linedata_dTSS_T;