
ZZ=nonzeros(dTSS_M(nt,:));
ZZ2=nonzeros(dTSS_M_F_A(nt,:));
ZZ=transpose(ZZ);
ZZ2=transpose(ZZ2);
%ZZ2=fliplr(ZZ2);
ss= length(ZZ)+length(ZZ2);

linedata_dTSS_M=zeros(ss,3);
xx=1;                                           %% formation of line data for TSS2 main winding %%
xx1=1;
XX11=1;
yy=2;
for ii=1:1:ss
    if (ii<=length(ZZ))
        linedata_dTSS_M(ii,1)=xx;
        linedata_dTSS_M(ii,2)=yy;
        linedata_dTSS_M(ii,3)=1;
        linedata_dTSS_M(ii,4)=ZZ(xx);%/1000;
        xx=xx+1;
    else
        linedata_dTSS_M(ii,1)=xx1;
        linedata_dTSS_M(ii,2)=yy;
        linedata_dTSS_M(ii,3)=1;
        linedata_dTSS_M(ii,4)=ZZ2(XX11);%/1000;
        XX11=XX11+1;
        xx1=yy;
    end
    yy=yy+1;
end
linedataM= linedata_dTSS_M;
line_data_M_emp=isempty(linedataM);

YY=nonzeros(dTSS_T(nt,:));
YY2=nonzeros(dTSS_T_F_A(nt,:));
YY=transpose(YY);
YY2=transpose(YY2);
%YY2=fliplr(YY2);
qq= length(YY)+length(YY2);
linedata_dTSS_T=zeros(qq,3);
ff=1;                                           %% formation of line data for TSS2 teaser winding %%
ff1=1;
ff11=1;
ee=2;
for ii=1:1:qq
    if (ii<=length(YY))
        linedata_dTSS_T(ii,1)=ff;
        linedata_dTSS_T(ii,2)=ee;
        linedata_dTSS_T(ii,3)=1;
        linedata_dTSS_T(ii,4)=YY(ff);%/1000;
        ff=ff+1;
    else
        linedata_dTSS_T(ii,1)=ff1;
        linedata_dTSS_T(ii,2)=ee;
        linedata_dTSS_T(ii,3)=1;
        linedata_dTSS_T(ii,4)=YY2(ff11);%/1000;
        ff11=ff11+1;
        ff1=ee;
    end
    ee=ee+1;
end
linedata= linedata_dTSS_T;
line_data_T_emp=isempty(linedata);