%% in general format calculation of distance between the contacts %%
for h=1:1:n1
    for k=1:1:n1
        D(h,k)=0;
    end
end
for h=1:1:n1
    for k=1:1:n1
        if (h~=k)
        D(h,k)=sqrt(((para(h,1)-para(k,1))^2)+((para(h,2)-para(k,2))^2));       % calulation of Distance between the conductor%
        else
           D(h,h)= para(h,3);                                                   % caculation of self resistance %
        end

    end
end
for h=1:1:n1
    R(h)= para(h,4);                                                            % calculation of self Resistance    %
end
