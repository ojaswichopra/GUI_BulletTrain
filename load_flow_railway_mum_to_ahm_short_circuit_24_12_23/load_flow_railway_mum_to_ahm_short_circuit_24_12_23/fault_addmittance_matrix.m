%Z_fault=1;
Y_fault=1/Z_fault;

if type_fault==1
    Y_fault_mat=(Y_fault/2)*[1 -1 0;-1 1 0;0 0 0]; %CR fault
else if type_fault==2
        Y_fault_mat=(Y_fault/2)*[0 0 0;0 1 -1;0 -1 1]; %RF fault
else if type_fault==3
        Y_fault_mat=(Y_fault/2)*[1 0 -1;0 0 0;-1 0 1]; %CF fault
else if type_fault==4
        Y_fault_mat=(Y_fault/3)*[2 -1 -1;-1 2 -1;-1 -1 2]; %CRF fault
end
end
end
end

