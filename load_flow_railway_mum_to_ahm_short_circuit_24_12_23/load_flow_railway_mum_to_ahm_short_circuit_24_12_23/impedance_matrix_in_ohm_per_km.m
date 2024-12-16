 %% calulation of impedance  matrix  %%
for j=1:1:n1
    for k=1:1:n1
        if (j==k)
            Z(j,k)=R(j)+(9.869*(10^-4)*f)+ i*w*(2*10^-4)*(log(1/(0.7788*D1(j,j)))+log(658.87*sqrt(row/f)));
        end
        if (j~=k)
            Z(j,k)=(9.869*(10^-4)*f)+ i*w*(2*10^-4)*(log(1/D1(j,k))+log(658.87*sqrt(row/f)));
        end
    end
end


%% display of impedence matrix for single track%%
% display('Impedence of single track');
% display('C1                 R1                     R2                     F1                  M1                G1')
% display([Z(:,1)     Z(:,2)      Z(:,3)      Z(:,4)      Z(:,5)          Z(:,6)]);