%%Initialization of I_bus%%
%%initialization of Main winding%%
IcrfM=[((Vb-Vc)/(2*(sqrt(3))*a2*Z2)); 0; (-1*((Vb-Vc))/(2*(sqrt(3))*a2*Z2))];
I_busM=zeros(3*N_M,1);
for j=1:1:N_M
       if (bus_type_M(j)==1)
           for k=1:1:3
            I_busM((3*(j-1)+k),1)=IcrfM(k);
           end
       else
           if (bus_type_M(j)==2)
%                f=tan(acos(bus_pf_M(j)))
%                I_bus((3*(j-1)+1),1)=conj(-bus_power_M(j)*(1+(i*(f))))/conj(Vs)
                I_busM((3*(j-1)+1),1)=conj(-(bus_power_M(j))*(1+(i*tan(acos(bus_pf_M(j))))))/Vs;
                I_busM((3*(j-1)+2),1)=-conj(-bus_power_M(j)*(1+(i*tan(acos(bus_pf_M(j))))))/Vs;
                 I_busM((3*(j-1)+3),1)=0;
            else
                if (bus_type_M(j)==3)
                    for k=1:1:3
                        I_busM((3*(j-1)+k),1)=0;
                    end
                end
            end
       end
end
I_checkM=I_busM; %% for checking the initial I_bus current%%
I_busM;
VcrfM=(inv(YbusM))*I_busM;
itrM=0;
error=1;
while (error>1e-12)
    for j=1:1:N_M
      if (bus_type_M(j)==2)
          
            I_busM((3*(j-1)+1),1)=conj((-(bus_power_M(j))*(1+i*tan(acos(bus_pf_M(j))))))/conj(VcrfM((3*(j-1)+1)));
            I_busM((3*(j-1)+2),1)=-conj((-(bus_power_M(j))*(1+i*tan(acos(bus_pf_M(j))))))/conj(VcrfM((3*(j-1)+1)));
           I_busM((3*(j-1)+3),1)=0;
      end
               
    end
    Vcrf_pre=VcrfM;
    VcrfM=(inv(YbusM))*I_busM;
    error_mag=abs(VcrfM-Vcrf_pre);
    %error_ang=angle(Vcrf-Vcrf_pre);
    error= (max(error_mag));
    
      flag_itrM(nt)=0;
      itrM=itrM+1;
      if itrM>300
          flag_itrM(nt)=1;
          break;
      end
% display("itr I_bus")
I_busM;
VcrfM;
itrM;
end
node_voltageM=VcrfM;
voltage_magnitudeM=abs(VcrfM);
voltage_angleM=angle(VcrfM)*180/pi;
I_bus_magnitudeM=abs(I_busM);
I_bus_angleM=angle(I_busM)*180/pi;