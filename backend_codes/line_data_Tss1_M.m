<<<<<<< HEAD

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
=======

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
>>>>>>> a6b21b859934a8cd5093e7439821c631fce9c22b
   linedata= linedata_dTSS_T;