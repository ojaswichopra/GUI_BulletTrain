%%Initialization of I_bus%%
%%initialization of teaser winding%%
IcrfT=[((2*Va)-Vb-Vc)/(4*(sqrt(3))*a1*Z1); 0; (-1*((2*Va)-Vb-Vc))/(4*(sqrt(3))*a1*Z1)];
I_busT=zeros(3*N,1);
for j=1:1:N
       if (bus_type(j)==1)
           for k=1:1:3
            I_busT((3*(j-1)+k),1)=IcrfT(k);
           end
       else
           if (bus_type(j)==2)
%                f=tan(acos(bus_pf(j)))
%                I_bus((3*(j-1)+1),1)=conj(-bus_power(j)*(1+(i*(f))))/conj(Vs)
                I_busT((3*(j-1)+1),1)=conj(-(bus_power(j))*(1+(i*tan(acos(bus_pf(j))))))/Vs;
                I_busT((3*(j-1)+2),1)=-conj(-bus_power(j)*(1+(i*tan(acos(bus_pf(j))))))/Vs;
                 I_busT((3*(j-1)+3),1)=0;
            else
                if (bus_type(j)==3)
                    for k=1:1:3
                        I_busT((3*(j-1)+k),1)=0;
                    end
                end
            end
       end
end
I_checkT=I_busT; %% for checking the initial I_bus current%%
I_busT;
VcrfT=(inv(YbusT))*I_busT;
itrT=0;
error=1;
while (error>1e-12)
    for j=1:1:N
      if (bus_type(j)==2)
          
            I_busT((3*(j-1)+1),1)=conj((-(bus_power(j))*(1+i*tan(acos(bus_pf(j))))))/conj(VcrfT((3*(j-1)+1)));
            I_busT((3*(j-1)+2),1)=-conj((-(bus_power(j))*(1+i*tan(acos(bus_pf(j))))))/conj(VcrfT((3*(j-1)+1)));
           I_busT((3*(j-1)+3),1)=0;
      end
               
    end
    VcrfT_pre=VcrfT;
    VcrfT=(inv(YbusT))*I_busT;
    error_mag=abs(VcrfT-VcrfT_pre);
    %error_ang=angle(Vcrf-Vcrf_pre);
    error= (max(error_mag));
    
      itrT=itrT+1;
% display("itr I_bus")
I_busT;
VcrfT;
itrT;
end
node_voltageT=VcrfT;
voltage_magnitudeT=abs(VcrfT);
voltage_angleT=(angle(VcrfT))*180/pi;
I_bus_magnitudeT=abs(I_busT);
I_bus_angleT=angle(I_busT)*180/pi;