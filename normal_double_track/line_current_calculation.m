format long 
Nb=NBranch;
Nb_M=NBranch_M;
VD=zeros(3,1);
 I_line_currentT=zeros(3*Nb,1);
 I_line_currentM=zeros(3*Nb_M,1);
 %I_line=zeros(1,6);
for j=1:1:Nb
    
    f=2;
    for k=1:1:3
        VD(k)=VcrfT(3*line_start_bus(j)-f)-VcrfT(3*line_end_bus(j)-f);
        f=f-1;
    end
    l=line_length(j);
    I_line= inv(l*z1)*VD;
    s=1;
    for g=3*j-2:1:3*j
%         h=I_line(s)
        I_line_currentT(g)=I_line(s);
        s=s+1;
    end
end
I_line_current_magT=abs(I_line_currentT);
I_line_current_angT= angle(I_line_currentT)*180/pi;
%I_line=zeros(1,6);
for j=1:1:Nb_M
    
    f=2;
    for k=1:1:3
        VD(k)=VcrfM(3*line_start_bus_M(j)-f)-VcrfM(3*line_end_bus_M(j)-f);
        f=f-1;
    end
    l=line_length_M(j);
    I_line= inv(l*z1)*VD;
    s=1;
    for g=3*j-2:1:3*j
%         h=I_line(s)
        I_line_currentM(g)=I_line(s);
        s=s+1;
    end
end
I_line_current_magM=abs(I_line_currentM);
I_line_current_angM= angle(I_line_currentM)*180/pi;
%    I_line_currentT
%    I_line_currentM