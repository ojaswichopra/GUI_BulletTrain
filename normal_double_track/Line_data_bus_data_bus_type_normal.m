
% initialization;
initialization_user;

% l_a=2*N_TSS;
i_A=-10*ones(l_a,10);
i_B=zeros(l_a,10);
i_h=zeros(l_a,10);

%line data matrix initialization for up-track (line length in meter)
dTSS_up=zeros((l_a)*y,15);

%bus data matrix initialization for up-track (bus power in kW)
pTSS_up=-100*ones((l_a)*y,15);

%bus type matrix initialization for up-track (TSS:Type 1; Train:Type 2; AT:Type 3)
tTSS_up=zeros((l_a)*y,15);

for i_j=1:(l_a)
    b=[d(i_j),AT(AT>d(i_j) & AT<d(i_j+1)),d(i_j+1)];   %distance of TSS,ATs and SP of each winding
    i_A(i_j,1:length(b))=b;
end

for i_k=1:(l_a)
    i_l=i_A(i_k,:);
    i_l=i_l(i_l>=0);
    l_b(i_k)=length(i_l);
end

for i_m=1:2:(l_a)
    i_B(i_m,1:(l_b(i_m)-2))=linspace(l_b(i_m),3,l_b(i_m)-2);
end

for i_n=2:2:(l_a)
    i_B(i_n,1:(l_b(i_n)-2))=linspace(2,l_b(i_n)-1,l_b(i_n)-2);
end

for i_s=1:(l_a)
    i_t=i_B(i_s,:);
    i_t=i_t(i_t>0);
    l_c(i_s)=length(i_t);
end

%Line data matrix initialization
i_C=zeros((l_a)*y,10);

%bus data matrix initialization
i_D=zeros((l_a)*y,10);

%bus type matrix initialization
%TSS= bus type 1
%AT= bus type 3
%Train= bus type 2
i_E=[ones((l_a)*y,1),3*ones((l_a)*y,9)];

for i_d=1:y
    i_e=distance_up(i_d,2:end);
    i_e=i_e(i_e>0);
    i_f=power_up(i_d,2:end);
    i_f=i_f(i_f~=-100);
    c_a=ones(1,l_a);
    c_b=ones(1,l_a);

    for i_q=0:(l_a-1)
        pTSS_up(i_q*y+i_d,1:(l_b(i_q+1)-1))=zeros(1,(l_b(i_q+1)-1));
    end

    for i_r=0:(l_a-1)
        tTSS_up(i_r*y+i_d,1:(l_b(i_r+1)-1))=[1,3*ones(1,(l_b(i_r+1)-2))];
    end

    for i_u=0:2:(l_a-1)
        for i_v=1:l_c(i_u+1)
            dTSS_up(i_u*y+i_d,c_a(i_u+1))=i_A(i_u+1,i_B(i_u+1,i_v))-i_A(i_u+1,i_B(i_u+1,i_v)-1);
            c_a(i_u+1)=c_a(i_u+1)+1;
        end
    end

    for i_w=1:2:(l_a-1)
        for i_x=1:l_c(i_w+1)
            dTSS_up(i_w*y+i_d,c_a(i_w+1))=i_A(i_w+1,i_B(i_w+1,i_x))-i_A(i_w+1,i_B(i_w+1,i_x)-1);
            c_a(i_w+1)=c_a(i_w+1)+1;
        end
    end

    for i_o=0:(l_a-1)
        i_p=i_A(i_o+1,:);
        i_p=i_p(i_p>=0);
        i_C(i_o*y+i_d,1:l_b(i_o+1))=i_p;
    end

    l_b_tmp=l_b;

    for i_b=1:length(i_e)
        for i_y=1:2:(l_a)
            if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
                i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))=[i_C((i_y-1)*y+i_d,1:l_b_tmp(i_y)),i_e(i_b)];
                i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))=sort(i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1)));
                ff=find(sort(i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1)),'descend')==i_e(i_b));
                temp_1=i_D((i_y-1)*y+i_d,ff:l_b_tmp(i_y)-1);
                i_D((i_y-1)*y+i_d,ff)=i_f(i_b);
                i_D((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_D((i_y-1)*y+i_d,1:ff),temp_1];
                pTSS_up((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_D((i_y-1)*y+i_d,1:l_b_tmp(i_y));
                temp_2=i_E((i_y-1)*y+i_d,ff:l_b_tmp(i_y)-1);
                i_E((i_y-1)*y+i_d,ff)=2;
                i_E((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_E((i_y-1)*y+i_d,1:ff),temp_2];
                tTSS_up((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_E((i_y-1)*y+i_d,1:l_b_tmp(i_y));
                i_h(i_y,1:l_b_tmp(i_y)-1)=linspace(l_b_tmp(i_y)+1,3,l_b_tmp(i_y)-1);
                for i_i_1=1:l_b_tmp(i_y)-1
                    dTSS_up((i_y-1)*y+i_d,c_b(i_y))=i_C((i_y-1)*y+i_d,i_h(i_y,i_i_1))-i_C((i_y-1)*y+i_d,i_h(i_y,i_i_1)-1);
                    c_b(i_y)=c_b(i_y)+1;
                end
                c_b(i_y)=1;
                l_b_tmp(i_y)=l_b_tmp(i_y)+1;
            elseif (i_e(i_b)>d(i_y+1) && i_e(i_b)<=d(i_y+2))
                i_C(i_y*y+i_d,1:(l_b_tmp(i_y+1)+1))=[i_C(i_y*y+i_d,1:l_b_tmp(i_y+1)),i_e(i_b)];
                i_C(i_y*y+i_d,1:(l_b_tmp(i_y+1)+1))=sort(i_C(i_y*y+i_d,1:(l_b_tmp(i_y+1)+1)));
                ff=find(i_C(i_y*y+i_d,1:(l_b_tmp(i_y+1)+1))==i_e(i_b));
                temp_3=i_D(i_y*y+i_d,ff:l_b_tmp(i_y+1)-1);
                i_D(i_y*y+i_d,ff)=i_f(i_b);
                i_D(i_y*y+i_d,1:l_b_tmp(i_y+1))=[i_D(i_y*y+i_d,1:ff),temp_3];
                pTSS_up(i_y*y+i_d,1:l_b_tmp(i_y+1))=i_D(i_y*y+i_d,1:l_b_tmp(i_y+1));
                temp_4=i_E(i_y*y+i_d,ff:l_b_tmp(i_y+1)-1);
                i_E(i_y*y+i_d,ff)=2;
                i_E(i_y*y+i_d,1:l_b_tmp(i_y+1))=[i_E(i_y*y+i_d,1:ff),temp_4];
                tTSS_up(i_y*y+i_d,1:l_b_tmp(i_y+1))=i_E(i_y*y+i_d,1:l_b_tmp(i_y+1));
                i_h(i_y+1,1:l_b_tmp(i_y+1)-1)=linspace(2,l_b_tmp(i_y+1),l_b_tmp(i_y+1)-1);
                for i_i_2=1:l_b_tmp(i_y+1)-1
                    dTSS_up(i_y*y+i_d,c_b(i_y+1))=i_C(i_y*y+i_d,i_h(i_y+1,i_i_2))-i_C(i_y*y+i_d,i_h(i_y+1,i_i_2)-1);
                    c_b(i_y+1)=c_b(i_y+1)+1;
                end
                c_b(i_y+1)=1;
                l_b_tmp(i_y+1)=l_b_tmp(i_y+1)+1;
            end
        end
    end
    percentage_completion_1=(i_d/y)*100   %percentage of total computation completed
end

i_A_down=-10*ones(l_a,10);
i_B_down=zeros(l_a,10);
i_h_down=zeros(l_a,10);

%line data matrix initialization for down-track (line length in meter)
dTSS_down=zeros((l_a)*y,15);

%bus data matrix initialization for down-track (bus power in kW)
pTSS_down=-100*ones((l_a)*y,15);

%bus type matrix initialization for down-track (TSS:Type 1; Train:Type 2; AT:Type 3)
tTSS_down=zeros((l_a)*y,15);

for i_j=1:(l_a)
    b=[d(i_j),AT(AT>d(i_j) & AT<d(i_j+1)),d(i_j+1)];   %distance of TSS,ATs and SP of each winding
    i_A_down(i_j,1:length(b))=b;
end

for i_k=1:(l_a)
    i_l=i_A_down(i_k,:);
    i_l=i_l(i_l>=0);
    l_b_down(i_k)=length(i_l);
end

for i_m=1:2:(l_a)
    i_B_down(i_m,1:(l_b_down(i_m)-2))=linspace(l_b_down(i_m),3,l_b_down(i_m)-2);
end

for i_n=2:2:(l_a)
    i_B_down(i_n,1:(l_b_down(i_n)-2))=linspace(2,l_b_down(i_n)-1,l_b_down(i_n)-2);
end

for i_s=1:(l_a)
    i_t=i_B_down(i_s,:);
    i_t=i_t(i_t>0);
    l_c_down(i_s)=length(i_t);
end

%Line data matrix initialization
i_C_down=zeros((l_a)*y,10);

%bus data matrix initialization
i_D_down=zeros((l_a)*y,10);

%bus type matrix initialization
%TSS= bus type 1
%AT= bus type 3
%Train= bus type 2
i_E_down=[ones((l_a)*y,1),3*ones((l_a)*y,9)];

for i_d=1:y
    i_e=distance_down(i_d,2:end);
    i_e=i_e(i_e>0);
    i_f=power_down(i_d,2:end);
    i_f=i_f(i_f~=-100);
    c_a_down=ones(1,l_a);
    c_b_down=ones(1,l_a);

    for i_q=0:(l_a-1)
        pTSS_down(i_q*y+i_d,1:(l_b_down(i_q+1)-1))=zeros(1,(l_b_down(i_q+1)-1));
    end

    for i_r=0:(l_a-1)
        tTSS_down(i_r*y+i_d,1:(l_b_down(i_r+1)-1))=[1,3*ones(1,(l_b_down(i_r+1)-2))];
    end

    for i_u=0:2:(l_a-1)
        for i_v=1:l_c_down(i_u+1)
            dTSS_down(i_u*y+i_d,c_a_down(i_u+1))=i_A_down(i_u+1,i_B_down(i_u+1,i_v))-i_A_down(i_u+1,i_B_down(i_u+1,i_v)-1);
            c_a_down(i_u+1)=c_a_down(i_u+1)+1;
        end
    end

    for i_w=1:2:(l_a-1)
        for i_x=1:l_c_down(i_w+1)
            dTSS_down(i_w*y+i_d,c_a_down(i_w+1))=i_A_down(i_w+1,i_B_down(i_w+1,i_x))-i_A_down(i_w+1,i_B_down(i_w+1,i_x)-1);
            c_a_down(i_w+1)=c_a_down(i_w+1)+1;
        end
    end

    for i_o=0:(l_a-1)
        i_p=i_A_down(i_o+1,:);
        i_p=i_p(i_p>=0);
        i_C_down(i_o*y+i_d,1:l_b_down(i_o+1))=i_p;
    end

    l_b_tmp=l_b_down;

    for i_b=1:length(i_e)
        for i_y=1:2:(l_a)
            if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
                i_C_down((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))=[i_C_down((i_y-1)*y+i_d,1:l_b_tmp(i_y)),i_e(i_b)];
                i_C_down((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))=sort(i_C_down((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1)));
                ff=find(sort(i_C_down((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1)),'descend')==i_e(i_b));
                temp_1=i_D_down((i_y-1)*y+i_d,ff:l_b_tmp(i_y)-1);
                i_D_down((i_y-1)*y+i_d,ff)=i_f(i_b);
                i_D_down((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_D_down((i_y-1)*y+i_d,1:ff),temp_1];
                pTSS_down((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_D_down((i_y-1)*y+i_d,1:l_b_tmp(i_y));
                temp_2=i_E_down((i_y-1)*y+i_d,ff:l_b_tmp(i_y)-1);
                i_E_down((i_y-1)*y+i_d,ff)=2;
                i_E_down((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_E_down((i_y-1)*y+i_d,1:ff),temp_2];
                tTSS_down((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_E_down((i_y-1)*y+i_d,1:l_b_tmp(i_y));
                i_h_down(i_y,1:l_b_tmp(i_y)-1)=linspace(l_b_tmp(i_y)+1,3,l_b_tmp(i_y)-1);
                for i_i_1=1:l_b_tmp(i_y)-1
                    dTSS_down((i_y-1)*y+i_d,c_b_down(i_y))=i_C_down((i_y-1)*y+i_d,i_h_down(i_y,i_i_1))-i_C_down((i_y-1)*y+i_d,i_h_down(i_y,i_i_1)-1);
                    c_b_down(i_y)=c_b_down(i_y)+1;
                end
                c_b_down(i_y)=1;
                l_b_tmp(i_y)=l_b_tmp(i_y)+1;
            elseif (i_e(i_b)>d(i_y+1) && i_e(i_b)<=d(i_y+2))
                i_C_down(i_y*y+i_d,1:(l_b_tmp(i_y+1)+1))=[i_C_down(i_y*y+i_d,1:l_b_tmp(i_y+1)),i_e(i_b)];
                i_C_down(i_y*y+i_d,1:(l_b_tmp(i_y+1)+1))=sort(i_C_down(i_y*y+i_d,1:(l_b_tmp(i_y+1)+1)));
                ff=find(i_C_down(i_y*y+i_d,1:(l_b_tmp(i_y+1)+1))==i_e(i_b));
                temp_3=i_D_down(i_y*y+i_d,ff:l_b_tmp(i_y+1)-1);
                i_D_down(i_y*y+i_d,ff)=i_f(i_b);
                i_D_down(i_y*y+i_d,1:l_b_tmp(i_y+1))=[i_D_down(i_y*y+i_d,1:ff),temp_3];
                pTSS_down(i_y*y+i_d,1:l_b_tmp(i_y+1))=i_D_down(i_y*y+i_d,1:l_b_tmp(i_y+1));
                temp_4=i_E_down(i_y*y+i_d,ff:l_b_tmp(i_y+1)-1);
                i_E_down(i_y*y+i_d,ff)=2;
                i_E_down(i_y*y+i_d,1:l_b_tmp(i_y+1))=[i_E_down(i_y*y+i_d,1:ff),temp_4];
                tTSS_down(i_y*y+i_d,1:l_b_tmp(i_y+1))=i_E_down(i_y*y+i_d,1:l_b_tmp(i_y+1));
                i_h_down(i_y+1,1:l_b_tmp(i_y+1)-1)=linspace(2,l_b_tmp(i_y+1),l_b_tmp(i_y+1)-1);
                for i_i_2=1:l_b_tmp(i_y+1)-1
                    dTSS_down(i_y*y+i_d,c_b_down(i_y+1))=i_C_down(i_y*y+i_d,i_h_down(i_y+1,i_i_2))-i_C_down(i_y*y+i_d,i_h_down(i_y+1,i_i_2)-1);
                    c_b_down(i_y+1)=c_b_down(i_y+1)+1;
                end
                c_b_down(i_y+1)=1;
                l_b_tmp(i_y+1)=l_b_tmp(i_y+1)+1;
            end
        end
    end
    percentage_completion_2=(i_d/y)*100   %percentage of total computation completed
end