tic

% initialization;
initialization_user;

% N_TSS_O_str=input('Enter the TSS numbers (in ascending order) which are out of service (separated by comma or space): ','s');

N_TSS_O=str2num(N_TSS_O_str);   % Outage TSS numbers (2 TSS outage)

%the corresponding out of service windings (4 winding outage)
j_a=2*N_TSS_O(1)-1;
j_b=2*N_TSS_O(1);
j_c=2*N_TSS_O(2)-1;
j_d=2*N_TSS_O(2);

i_A=-10*ones(l_a-4,20);
i_B=zeros(l_a-4,20);
i_h=zeros(l_a-4,20);

%line data matrix initialization (line length in meter)
dTSS_up=zeros((l_a-4)*y,20);

%bus data matrix initialization (bus power in KW)
pTSS_up=-100*ones((l_a-4)*y,20);

%bus type matrix initialization (TSS:Type 1; Train:Type 2; AT:Type 3)
tTSS_up=zeros((l_a-4)*y,20);

%Line data matrix initialization
i_C=zeros((l_a-4)*y,20);

%bus data matrix initialization
i_D=zeros((l_a-4)*y,20);

%bus type matrix initialization
%TSS= bus type 1
%AT= bus type 3
%Train= bus type 2
i_E=[ones((l_a-4)*y,1),3*ones((l_a-4)*y,19)];

if (N_TSS_O(1) > N_TSS || N_TSS_O(2) > N_TSS)

    disp('Invalid TSS number entered')

elseif (N_TSS_O(1)==1 || N_TSS_O(2)==1)     % 2 adjacent TSS outage from the starting

    %distance of TSS,ATs and SP of each winding
    b=[d(j_a),AT(AT>d(j_a) & AT<d(j_d+2)),d(j_d+2)];
    i_A(j_a,1:length(b))=b;

    for i_j=(j_d+2):l_a
        b=[d(i_j),AT(AT>d(i_j) & AT<d(i_j+1)),d(i_j+1)];
        i_A(i_j-4,1:length(b))=b;
    end

    for i_k=1:(l_a-4)
        i_l=i_A(i_k,:);
        i_l=i_l(i_l>=0);
        l_b(i_k)=length(i_l);
    end

    for i_m=1:2:(l_a-4)
        i_B(i_m,1:(l_b(i_m)-2))=linspace(l_b(i_m),3,l_b(i_m)-2);
    end

    for i_n=2:2:(l_a-4)
        i_B(i_n,1:(l_b(i_n)-2))=linspace(2,l_b(i_n)-1,l_b(i_n)-2);
    end

    for i_s=1:(l_a-4)
        i_t=i_B(i_s,:);
        i_t=i_t(i_t>0);
        l_c(i_s)=length(i_t);
    end

    for i_d=1:y
        i_e=distance_up(i_d,2:end);
        i_e=i_e(i_e>0);
        i_f=power_up(i_d,2:end);
        i_f=i_f(i_f~=-100);
        c_a=ones(1,l_a-4);
        c_b=ones(1,l_a-4);

        for i_q=0:(l_a-5)
            pTSS_up(i_q*y+i_d,1:(l_b(i_q+1)-1))=zeros(1,(l_b(i_q+1)-1));
        end

        for i_r=0:(l_a-5)
            tTSS_up(i_r*y+i_d,1:(l_b(i_r+1)-1))=[1,3*ones(1,(l_b(i_r+1)-2))];
        end

        for i_u=0:2:(l_a-5)
            for i_v=1:l_c(i_u+1)
                dTSS_up(i_u*y+i_d,c_a(i_u+1))=i_A(i_u+1,i_B(i_u+1,i_v))-i_A(i_u+1,i_B(i_u+1,i_v)-1);
                c_a(i_u+1)=c_a(i_u+1)+1;
            end
        end

        for i_w=1:2:(l_a-5)
            for i_x=1:l_c(i_w+1)
                dTSS_up(i_w*y+i_d,c_a(i_w+1))=i_A(i_w+1,i_B(i_w+1,i_x))-i_A(i_w+1,i_B(i_w+1,i_x)-1);
                c_a(i_w+1)=c_a(i_w+1)+1;
            end
        end

        for i_o=0:(l_a-5)
            i_p=i_A(i_o+1,:);
            i_p=i_p(i_p>=0);
            i_C(i_o*y+i_d,1:l_b(i_o+1))=i_p;
        end

        l_b_tmp=l_b;

        for i_b=1:length(i_e)
            if (i_e(i_b)>d(j_a) && i_e(i_b)<=d(j_d+2))
                i_C((j_a-1)*y+i_d,1:(l_b_tmp(j_a)+1))=[i_C((j_a-1)*y+i_d,1:l_b_tmp(j_a)),i_e(i_b)];
                i_C((j_a-1)*y+i_d,1:(l_b_tmp(j_a)+1))=sort(i_C((j_a-1)*y+i_d,1:(l_b_tmp(j_a)+1)));
                ff=find(sort(i_C((j_a-1)*y+i_d,1:(l_b_tmp(j_a)+1)),'descend')==i_e(i_b));
                temp_1=i_D((j_a-1)*y+i_d,ff:l_b_tmp(j_a)-1);
                i_D((j_a-1)*y+i_d,ff)=i_f(i_b);
                i_D((j_a-1)*y+i_d,1:l_b_tmp(j_a))=[i_D((j_a-1)*y+i_d,1:ff),temp_1];
                pTSS_up((j_a-1)*y+i_d,1:l_b_tmp(j_a))=i_D((j_a-1)*y+i_d,1:l_b_tmp(j_a));
                temp_2=i_E((j_a-1)*y+i_d,ff:l_b_tmp(j_a)-1);
                i_E((j_a-1)*y+i_d,ff)=2;
                i_E((j_a-1)*y+i_d,1:l_b_tmp(j_a))=[i_E((j_a-1)*y+i_d,1:ff),temp_2];
                tTSS_up((j_a-1)*y+i_d,1:l_b_tmp(j_a))=i_E((j_a-1)*y+i_d,1:l_b_tmp(j_a));
                i_h(j_a,1:l_b_tmp(j_a)-1)=linspace(l_b_tmp(j_a)+1,3,l_b_tmp(j_a)-1);
                for i_i=1:l_b_tmp(j_a)-1
                    dTSS_up((j_a-1)*y+i_d,c_b(j_a))=i_C((j_a-1)*y+i_d,i_h(j_a,i_i))-i_C((j_a-1)*y+i_d,i_h(j_a,i_i)-1);
                    c_b(j_a)=c_b(j_a)+1;
                end
                c_b(j_a)=1;
                l_b_tmp(j_a)=l_b_tmp(j_a)+1;
            end

            for i_y=(j_d+2):2:l_a
                if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
                    i_C((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))=[i_C((i_y-5)*y+i_d,1:l_b_tmp(i_y-4)),i_e(i_b)];
                    i_C((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))=sort(i_C((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1)));
                    ff=find(i_C((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))==i_e(i_b));
                    temp_1=i_D((i_y-5)*y+i_d,ff:l_b_tmp(i_y-4)-1);
                    i_D((i_y-5)*y+i_d,ff)=i_f(i_b);
                    i_D((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=[i_D((i_y-5)*y+i_d,1:ff),temp_1];
                    pTSS_up((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=i_D((i_y-5)*y+i_d,1:l_b_tmp(i_y-4));
                    temp_2=i_E((i_y-5)*y+i_d,ff:l_b_tmp(i_y-4)-1);
                    i_E((i_y-5)*y+i_d,ff)=2;
                    i_E((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=[i_E((i_y-5)*y+i_d,1:ff),temp_2];
                    tTSS_up((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=i_E((i_y-5)*y+i_d,1:l_b_tmp(i_y-4));
                    i_h(i_y-4,1:l_b_tmp(i_y-4)-1)=linspace(2,l_b_tmp(i_y-4),l_b_tmp(i_y-4)-1);
                    for i_i=1:l_b_tmp(i_y-4)-1
                        dTSS_up((i_y-5)*y+i_d,c_b(i_y-4))=i_C((i_y-5)*y+i_d,i_h(i_y-4,i_i))-i_C((i_y-5)*y+i_d,i_h(i_y-4,i_i)-1);
                        c_b(i_y-4)=c_b(i_y-4)+1;
                    end
                    c_b(i_y-4)=1;
                    l_b_tmp(i_y-4)=l_b_tmp(i_y-4)+1;
                end
            end

            for i_y=(j_d+3):2:l_a
                if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
                    i_C((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))=[i_C((i_y-5)*y+i_d,1:l_b_tmp(i_y-4)),i_e(i_b)];
                    i_C((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))=sort(i_C((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1)));
                    ff=find(sort(i_C((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1)),'descend')==i_e(i_b));
                    temp_1=i_D((i_y-5)*y+i_d,ff:l_b_tmp(i_y-4)-1);
                    i_D((i_y-5)*y+i_d,ff)=i_f(i_b);
                    i_D((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=[i_D((i_y-5)*y+i_d,1:ff),temp_1];
                    pTSS_up((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=i_D((i_y-5)*y+i_d,1:l_b_tmp(i_y-4));
                    temp_2=i_E((i_y-5)*y+i_d,ff:l_b_tmp(i_y-4)-1);
                    i_E((i_y-5)*y+i_d,ff)=2;
                    i_E((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=[i_E((i_y-5)*y+i_d,1:ff),temp_2];
                    tTSS_up((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=i_E((i_y-5)*y+i_d,1:l_b_tmp(i_y-4));
                    i_h(i_y-4,1:l_b_tmp(i_y-4)-1)=linspace(l_b_tmp(i_y-4)+1,3,l_b_tmp(i_y-4)-1);
                    for i_i=1:l_b_tmp(i_y-4)-1
                        dTSS_up((i_y-5)*y+i_d,c_b(i_y-4))=i_C((i_y-5)*y+i_d,i_h(i_y-4,i_i))-i_C((i_y-5)*y+i_d,i_h(i_y-4,i_i)-1);
                        c_b(i_y-4)=c_b(i_y-4)+1;
                    end
                    c_b(i_y-4)=1;
                    l_b_tmp(i_y-4)=l_b_tmp(i_y-4)+1;
                end
            end
        end
    end

elseif (N_TSS_O(1)==N_TSS || N_TSS_O(2)==N_TSS)     % 2 adjacent TSS outage from the end

    %distance of TSS,ATs and SP of each winding
    for i_j=1:(j_a-2)
        b=[d(i_j),AT(AT>d(i_j) & AT<d(i_j+1)),d(i_j+1)];
        i_A(i_j,1:length(b))=b;
    end

    b=[d(j_a-1),AT(AT>d(j_a-1) & AT<d(j_d+1)),d(j_d+1)];
    i_A(j_a-1,1:length(b))=b;

    for i_k=1:(l_a-4)
        i_l=i_A(i_k,:);
        i_l=i_l(i_l>=0);
        l_b(i_k)=length(i_l);
    end

    for i_m=1:2:(l_a-4)
        i_B(i_m,1:(l_b(i_m)-2))=linspace(l_b(i_m),3,l_b(i_m)-2);
    end

    for i_n=2:2:(l_a-4)
        i_B(i_n,1:(l_b(i_n)-2))=linspace(2,l_b(i_n)-1,l_b(i_n)-2);
    end

    for i_s=1:(l_a-4)
        i_t=i_B(i_s,:);
        i_t=i_t(i_t>0);
        l_c(i_s)=length(i_t);
    end

    for i_d=1:y
        i_e=distance_up(i_d,2:end);
        i_e=i_e(i_e>0);
        i_f=power_up(i_d,2:end);
        i_f=i_f(i_f~=-100);
        c_a=ones(1,l_a-4);
        c_b=ones(1,l_a-4);

        for i_q=0:(l_a-5)
            pTSS_up(i_q*y+i_d,1:(l_b(i_q+1)-1))=zeros(1,(l_b(i_q+1)-1));
        end

        for i_r=0:(l_a-5)
            tTSS_up(i_r*y+i_d,1:(l_b(i_r+1)-1))=[1,3*ones(1,(l_b(i_r+1)-2))];
        end

        for i_u=0:2:(l_a-5)
            for i_v=1:l_c(i_u+1)
                dTSS_up(i_u*y+i_d,c_a(i_u+1))=i_A(i_u+1,i_B(i_u+1,i_v))-i_A(i_u+1,i_B(i_u+1,i_v)-1);
                c_a(i_u+1)=c_a(i_u+1)+1;
            end
        end

        for i_w=1:2:(l_a-5)
            for i_x=1:l_c(i_w+1)
                dTSS_up(i_w*y+i_d,c_a(i_w+1))=i_A(i_w+1,i_B(i_w+1,i_x))-i_A(i_w+1,i_B(i_w+1,i_x)-1);
                c_a(i_w+1)=c_a(i_w+1)+1;
            end
        end

        for i_o=0:(l_a-5)
            i_p=i_A(i_o+1,:);
            i_p=i_p(i_p>=0);
            i_C(i_o*y+i_d,1:l_b(i_o+1))=i_p;
        end

        l_b_tmp=l_b;

        for i_b=1:length(i_e)
            for i_y=1:2:(j_a-2)
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
                    for i_i=1:l_b_tmp(i_y)-1
                        dTSS_up((i_y-1)*y+i_d,c_b(i_y))=i_C((i_y-1)*y+i_d,i_h(i_y,i_i))-i_C((i_y-1)*y+i_d,i_h(i_y,i_i)-1);
                        c_b(i_y)=c_b(i_y)+1;
                    end
                    c_b(i_y)=1;
                    l_b_tmp(i_y)=l_b_tmp(i_y)+1;
                end
            end
            for i_y=2:2:(j_a-2)
                if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
                    i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))=[i_C((i_y-1)*y+i_d,1:l_b_tmp(i_y)),i_e(i_b)];
                    i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))=sort(i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1)));
                    ff=find(i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))==i_e(i_b));
                    temp_1=i_D((i_y-1)*y+i_d,ff:l_b_tmp(i_y)-1);
                    i_D((i_y-1)*y+i_d,ff)=i_f(i_b);
                    i_D((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_D((i_y-1)*y+i_d,1:ff),temp_1];
                    pTSS_up((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_D((i_y-1)*y+i_d,1:l_b_tmp(i_y));
                    temp_2=i_E((i_y-1)*y+i_d,ff:l_b_tmp(i_y)-1);
                    i_E((i_y-1)*y+i_d,ff)=2;
                    i_E((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_E((i_y-1)*y+i_d,1:ff),temp_2];
                    tTSS_up((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_E((i_y-1)*y+i_d,1:l_b_tmp(i_y));
                    i_h(i_y,1:l_b_tmp(i_y)-1)=linspace(2,l_b_tmp(i_y),l_b_tmp(i_y)-1);
                    for i_i=1:l_b_tmp(i_y)-1
                        dTSS_up((i_y-1)*y+i_d,c_b(i_y))=i_C((i_y-1)*y+i_d,i_h(i_y,i_i))-i_C((i_y-1)*y+i_d,i_h(i_y,i_i)-1);
                        c_b(i_y)=c_b(i_y)+1;
                    end
                    c_b(i_y)=1;
                    l_b_tmp(i_y)=l_b_tmp(i_y)+1;
                end
            end
            if (i_e(i_b)>d(j_a-1) && i_e(i_b)<=d(j_d+1))
                i_C((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1))=[i_C((j_a-2)*y+i_d,1:l_b_tmp(j_a-1)),i_e(i_b)];
                i_C((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1))=sort(i_C((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1)));
                ff=find(i_C((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1))==i_e(i_b));
                temp_1=i_D((j_a-2)*y+i_d,ff:l_b_tmp(j_a-1)-1);
                i_D((j_a-2)*y+i_d,ff)=i_f(i_b);
                i_D((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=[i_D((j_a-2)*y+i_d,1:ff),temp_1];
                pTSS_up((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=i_D((j_a-2)*y+i_d,1:l_b_tmp(j_a-1));
                temp_2=i_E((j_a-2)*y+i_d,ff:l_b_tmp(j_a-1)-1);
                i_E((j_a-2)*y+i_d,ff)=2;
                i_E((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=[i_E((j_a-2)*y+i_d,1:ff),temp_2];
                tTSS_up((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=i_E((j_a-2)*y+i_d,1:l_b_tmp(j_a-1));
                i_h(j_a-1,1:l_b_tmp(j_a-1)-1)=linspace(2,l_b_tmp(j_a-1),l_b_tmp(j_a-1)-1);
                for i_i=1:l_b_tmp(j_a-1)-1
                    dTSS_up((j_a-2)*y+i_d,c_b(j_a-1))=i_C((j_a-2)*y+i_d,i_h(j_a-1,i_i))-i_C((j_a-2)*y+i_d,i_h(j_a-1,i_i)-1);
                    c_b(j_a-1)=c_b(j_a-1)+1;
                end
                c_b(j_a-1)=1;
                l_b_tmp(j_a-1)=l_b_tmp(j_a-1)+1;
            end
        end
    end

else    % 2 intermediate adjacent TSS outage 

    %distance of TSS,ATs and SP of each winding
    for i_j=1:(j_a-2)
        b=[d(i_j),AT(AT>d(i_j) & AT<d(i_j+1)),d(i_j+1)];
        i_A(i_j,1:length(b))=b;
    end

    b=[d(j_a-1),AT(AT>d(j_a-1) & AT<d(j_a+2)),d(j_a+2)];
    i_A(j_a-1,1:length(b))=b;

    b=[d(j_c),AT(AT>d(j_c) & AT<d(j_d+2)),d(j_d+2)];
    i_A(j_a,1:length(b))=b;

    for i_j=(j_d+2):l_a
        b=[d(i_j),AT(AT>d(i_j) & AT<d(i_j+1)),d(i_j+1)];
        i_A(i_j-4,1:length(b))=b;
    end

    for i_k=1:(l_a-4)
        i_l=i_A(i_k,:);
        i_l=i_l(i_l>=0);
        l_b(i_k)=length(i_l);
    end

    for i_m=1:2:(l_a-4)
        i_B(i_m,1:(l_b(i_m)-2))=linspace(l_b(i_m),3,l_b(i_m)-2);
    end

    for i_n=2:2:(l_a-4)
        i_B(i_n,1:(l_b(i_n)-2))=linspace(2,l_b(i_n)-1,l_b(i_n)-2);
    end

    for i_s=1:(l_a-4)
        i_t=i_B(i_s,:);
        i_t=i_t(i_t>0);
        l_c(i_s)=length(i_t);
    end

    for i_d=1:y
        i_e=distance_up(i_d,2:end);
        i_e=i_e(i_e>0);
        i_f=power_up(i_d,2:end);
        i_f=i_f(i_f~=-100);
        c_a=ones(1,l_a-4);
        c_b=ones(1,l_a-4);

        for i_q=0:(l_a-5)
            pTSS_up(i_q*y+i_d,1:(l_b(i_q+1)-1))=zeros(1,(l_b(i_q+1)-1));
        end

        for i_r=0:(l_a-5)
            tTSS_up(i_r*y+i_d,1:(l_b(i_r+1)-1))=[1,3*ones(1,(l_b(i_r+1)-2))];
        end

        for i_u=0:2:(l_a-5)
            for i_v=1:l_c(i_u+1)
                dTSS_up(i_u*y+i_d,c_a(i_u+1))=i_A(i_u+1,i_B(i_u+1,i_v))-i_A(i_u+1,i_B(i_u+1,i_v)-1);
                c_a(i_u+1)=c_a(i_u+1)+1;
            end
        end

        for i_w=1:2:(l_a-5)
            for i_x=1:l_c(i_w+1)
                dTSS_up(i_w*y+i_d,c_a(i_w+1))=i_A(i_w+1,i_B(i_w+1,i_x))-i_A(i_w+1,i_B(i_w+1,i_x)-1);
                c_a(i_w+1)=c_a(i_w+1)+1;
            end
        end

        for i_o=0:(l_a-5)
            i_p=i_A(i_o+1,:);
            i_p=i_p(i_p>=0);
            i_C(i_o*y+i_d,1:l_b(i_o+1))=i_p;
        end

        l_b_tmp=l_b;

        for i_b=1:length(i_e)
            for i_y=1:2:(j_a-2)
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
                    for i_i=1:l_b_tmp(i_y)-1
                        dTSS_up((i_y-1)*y+i_d,c_b(i_y))=i_C((i_y-1)*y+i_d,i_h(i_y,i_i))-i_C((i_y-1)*y+i_d,i_h(i_y,i_i)-1);
                        c_b(i_y)=c_b(i_y)+1;
                    end
                    c_b(i_y)=1;
                    l_b_tmp(i_y)=l_b_tmp(i_y)+1;
                end
            end
            for i_y=2:2:(j_a-2)
                if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
                    i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))=[i_C((i_y-1)*y+i_d,1:l_b_tmp(i_y)),i_e(i_b)];
                    i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))=sort(i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1)));
                    ff=find(i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))==i_e(i_b));
                    temp_1=i_D((i_y-1)*y+i_d,ff:l_b_tmp(i_y)-1);
                    i_D((i_y-1)*y+i_d,ff)=i_f(i_b);
                    i_D((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_D((i_y-1)*y+i_d,1:ff),temp_1];
                    pTSS_up((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_D((i_y-1)*y+i_d,1:l_b_tmp(i_y));
                    temp_2=i_E((i_y-1)*y+i_d,ff:l_b_tmp(i_y)-1);
                    i_E((i_y-1)*y+i_d,ff)=2;
                    i_E((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_E((i_y-1)*y+i_d,1:ff),temp_2];
                    tTSS_up((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_E((i_y-1)*y+i_d,1:l_b_tmp(i_y));
                    i_h(i_y,1:l_b_tmp(i_y)-1)=linspace(2,l_b_tmp(i_y),l_b_tmp(i_y)-1);
                    for i_i=1:l_b_tmp(i_y)-1
                        dTSS_up((i_y-1)*y+i_d,c_b(i_y))=i_C((i_y-1)*y+i_d,i_h(i_y,i_i))-i_C((i_y-1)*y+i_d,i_h(i_y,i_i)-1);
                        c_b(i_y)=c_b(i_y)+1;
                    end
                    c_b(i_y)=1;
                    l_b_tmp(i_y)=l_b_tmp(i_y)+1;
                end
            end
            if (i_e(i_b)>d(j_a-1) && i_e(i_b)<=d(j_a+2))
                i_C((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1))=[i_C((j_a-2)*y+i_d,1:l_b_tmp(j_a-1)),i_e(i_b)];
                i_C((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1))=sort(i_C((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1)));
                ff=find(i_C((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1))==i_e(i_b));
                temp_1=i_D((j_a-2)*y+i_d,ff:l_b_tmp(j_a-1)-1);
                i_D((j_a-2)*y+i_d,ff)=i_f(i_b);
                i_D((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=[i_D((j_a-2)*y+i_d,1:ff),temp_1];
                pTSS_up((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=i_D((j_a-2)*y+i_d,1:l_b_tmp(j_a-1));
                temp_2=i_E((j_a-2)*y+i_d,ff:l_b_tmp(j_a-1)-1);
                i_E((j_a-2)*y+i_d,ff)=2;
                i_E((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=[i_E((j_a-2)*y+i_d,1:ff),temp_2];
                tTSS_up((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=i_E((j_a-2)*y+i_d,1:l_b_tmp(j_a-1));
                i_h(j_a-1,1:l_b_tmp(j_a-1)-1)=linspace(2,l_b_tmp(j_a-1),l_b_tmp(j_a-1)-1);
                for i_i=1:l_b_tmp(j_a-1)-1
                    dTSS_up((j_a-2)*y+i_d,c_b(j_a-1))=i_C((j_a-2)*y+i_d,i_h(j_a-1,i_i))-i_C((j_a-2)*y+i_d,i_h(j_a-1,i_i)-1);
                    c_b(j_a-1)=c_b(j_a-1)+1;
                end
                c_b(j_a-1)=1;
                l_b_tmp(j_a-1)=l_b_tmp(j_a-1)+1;
            end
            if (i_e(i_b)>d(j_c) && i_e(i_b)<=d(j_d+2))
                i_C((j_b-2)*y+i_d,1:(l_b_tmp(j_b-1)+1))=[i_C((j_b-2)*y+i_d,1:l_b_tmp(j_b-1)),i_e(i_b)];
                i_C((j_b-2)*y+i_d,1:(l_b_tmp(j_b-1)+1))=sort(i_C((j_b-2)*y+i_d,1:(l_b_tmp(j_b-1)+1)));
                ff=find(sort(i_C((j_b-2)*y+i_d,1:(l_b_tmp(j_b-1)+1)),'descend')==i_e(i_b));
                temp_1=i_D((j_b-2)*y+i_d,ff:l_b_tmp(j_b-1)-1);
                i_D((j_b-2)*y+i_d,ff)=i_f(i_b);
                i_D((j_b-2)*y+i_d,1:l_b_tmp(j_b-1))=[i_D((j_b-2)*y+i_d,1:ff),temp_1];
                pTSS_up((j_b-2)*y+i_d,1:l_b_tmp(j_b-1))=i_D((j_b-2)*y+i_d,1:l_b_tmp(j_b-1));
                temp_2=i_E((j_b-2)*y+i_d,ff:l_b_tmp(j_b-1)-1);
                i_E((j_b-2)*y+i_d,ff)=2;
                i_E((j_b-2)*y+i_d,1:l_b_tmp(j_b-1))=[i_E((j_b-2)*y+i_d,1:ff),temp_2];
                tTSS_up((j_b-2)*y+i_d,1:l_b_tmp(j_b-1))=i_E((j_b-2)*y+i_d,1:l_b_tmp(j_b-1));
                i_h(j_b-1,1:l_b_tmp(j_b-1)-1)=linspace(l_b_tmp(j_b-1)+1,3,l_b_tmp(j_b-1)-1);
                for i_i=1:l_b_tmp(j_b-1)-1
                    dTSS_up((j_b-2)*y+i_d,c_b(j_b-1))=i_C((j_b-2)*y+i_d,i_h(j_b-1,i_i))-i_C((j_b-2)*y+i_d,i_h(j_b-1,i_i)-1);
                    c_b(j_b-1)=c_b(j_b-1)+1;
                end
                c_b(j_b-1)=1;
                l_b_tmp(j_b-1)=l_b_tmp(j_b-1)+1;
            end
            for i_y=(j_d+2):2:l_a
                if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
                    i_C((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))=[i_C((i_y-5)*y+i_d,1:l_b_tmp(i_y-4)),i_e(i_b)];
                    i_C((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))=sort(i_C((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1)));
                    ff=find(i_C((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))==i_e(i_b));
                    temp_1=i_D((i_y-5)*y+i_d,ff:l_b_tmp(i_y-4)-1);
                    i_D((i_y-5)*y+i_d,ff)=i_f(i_b);
                    i_D((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=[i_D((i_y-5)*y+i_d,1:ff),temp_1];
                    pTSS_up((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=i_D((i_y-5)*y+i_d,1:l_b_tmp(i_y-4));
                    temp_2=i_E((i_y-5)*y+i_d,ff:l_b_tmp(i_y-4)-1);
                    i_E((i_y-5)*y+i_d,ff)=2;
                    i_E((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=[i_E((i_y-5)*y+i_d,1:ff),temp_2];
                    tTSS_up((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=i_E((i_y-5)*y+i_d,1:l_b_tmp(i_y-4));
                    i_h(i_y-4,1:l_b_tmp(i_y-4)-1)=linspace(2,l_b_tmp(i_y-4),l_b_tmp(i_y-4)-1);
                    for i_i=1:l_b_tmp(i_y-4)-1
                        dTSS_up((i_y-5)*y+i_d,c_b(i_y-4))=i_C((i_y-5)*y+i_d,i_h(i_y-4,i_i))-i_C((i_y-5)*y+i_d,i_h(i_y-4,i_i)-1);
                        c_b(i_y-4)=c_b(i_y-4)+1;
                    end
                    c_b(i_y-4)=1;
                    l_b_tmp(i_y-4)=l_b_tmp(i_y-4)+1;
                end
            end
            for i_y=(j_d+3):2:l_a
                if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
                    i_C((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))=[i_C((i_y-5)*y+i_d,1:l_b_tmp(i_y-4)),i_e(i_b)];
                    i_C((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))=sort(i_C((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1)));
                    ff=find(sort(i_C((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1)),'descend')==i_e(i_b));
                    temp_1=i_D((i_y-5)*y+i_d,ff:l_b_tmp(i_y-4)-1);
                    i_D((i_y-5)*y+i_d,ff)=i_f(i_b);
                    i_D((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=[i_D((i_y-5)*y+i_d,1:ff),temp_1];
                    pTSS_up((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=i_D((i_y-5)*y+i_d,1:l_b_tmp(i_y-4));
                    temp_2=i_E((i_y-5)*y+i_d,ff:l_b_tmp(i_y-4)-1);
                    i_E((i_y-5)*y+i_d,ff)=2;
                    i_E((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=[i_E((i_y-5)*y+i_d,1:ff),temp_2];
                    tTSS_up((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=i_E((i_y-5)*y+i_d,1:l_b_tmp(i_y-4));
                    i_h(i_y-4,1:l_b_tmp(i_y-4)-1)=linspace(l_b_tmp(i_y-4)+1,3,l_b_tmp(i_y-4)-1);
                    for i_i=1:l_b_tmp(i_y-4)-1
                        dTSS_up((i_y-5)*y+i_d,c_b(i_y-4))=i_C((i_y-5)*y+i_d,i_h(i_y-4,i_i))-i_C((i_y-5)*y+i_d,i_h(i_y-4,i_i)-1);
                        c_b(i_y-4)=c_b(i_y-4)+1;
                    end
                    c_b(i_y-4)=1;
                    l_b_tmp(i_y-4)=l_b_tmp(i_y-4)+1;
                end
            end
        end     
    end
end

i_A_down=-10*ones(l_a-4,20);
i_B_down=zeros(l_a-4,20);
i_h_down=zeros(l_a-4,20);

%line data matrix initialization (line length in meter)
dTSS_down=zeros((l_a-4)*y,20);

%bus data matrix initialization (bus power in KW)
pTSS_down=-100*ones((l_a-4)*y,20);

%bus type matrix initialization (TSS:Type 1; Train:Type 2; AT:Type 3)
tTSS_down=zeros((l_a-4)*y,20);

%Line data matrix initialization
i_C_down=zeros((l_a-4)*y,20);

%bus data matrix initialization
i_D_down=zeros((l_a-4)*y,20);

%bus type matrix initialization
%TSS= bus type 1
%AT= bus type 3
%Train= bus type 2
i_E_down=[ones((l_a-4)*y,1),3*ones((l_a-4)*y,19)];

if (N_TSS_O(1) > N_TSS || N_TSS_O(2) > N_TSS)

    disp('Invalid TSS number entered')

elseif (N_TSS_O(1)==1 || N_TSS_O(2)==1)     % 2 adjacent TSS outage from the starting

    %distance of TSS,ATs and SP of each winding
    b=[d(j_a),AT(AT>d(j_a) & AT<d(j_d+2)),d(j_d+2)];
    i_A_down(j_a,1:length(b))=b;

    for i_j=(j_d+2):l_a
        b=[d(i_j),AT(AT>d(i_j) & AT<d(i_j+1)),d(i_j+1)];
        i_A_down(i_j-4,1:length(b))=b;
    end

    for i_k=1:(l_a-4)
        i_l=i_A_down(i_k,:);
        i_l=i_l(i_l>=0);
        l_b_down(i_k)=length(i_l);
    end

    for i_m=1:2:(l_a-4)
        i_B_down(i_m,1:(l_b_down(i_m)-2))=linspace(l_b_down(i_m),3,l_b_down(i_m)-2);
    end

    for i_n=2:2:(l_a-4)
        i_B_down(i_n,1:(l_b_down(i_n)-2))=linspace(2,l_b_down(i_n)-1,l_b_down(i_n)-2);
    end

    for i_s=1:(l_a-4)
        i_t=i_B_down(i_s,:);
        i_t=i_t(i_t>0);
        l_c_down(i_s)=length(i_t);
    end

    for i_d=1:y
        i_e=distance_down(i_d,2:end);
        i_e=i_e(i_e>0);
        i_f=power_down(i_d,2:end);
        i_f=i_f(i_f~=-100);
        c_a_down=ones(1,l_a-4);
        c_b_down=ones(1,l_a-4);

        for i_q=0:(l_a-5)
            pTSS_down(i_q*y+i_d,1:(l_b_down(i_q+1)-1))=zeros(1,(l_b_down(i_q+1)-1));
        end

        for i_r=0:(l_a-5)
            tTSS_down(i_r*y+i_d,1:(l_b_down(i_r+1)-1))=[1,3*ones(1,(l_b_down(i_r+1)-2))];
        end

        for i_u=0:2:(l_a-5)
            for i_v=1:l_c_down(i_u+1)
                dTSS_down(i_u*y+i_d,c_a_down(i_u+1))=i_A_down(i_u+1,i_B_down(i_u+1,i_v))-i_A_down(i_u+1,i_B_down(i_u+1,i_v)-1);
                c_a_down(i_u+1)=c_a_down(i_u+1)+1;
            end
        end

        for i_w=1:2:(l_a-5)
            for i_x=1:l_c_down(i_w+1)
                dTSS_down(i_w*y+i_d,c_a_down(i_w+1))=i_A_down(i_w+1,i_B_down(i_w+1,i_x))-i_A_down(i_w+1,i_B_down(i_w+1,i_x)-1);
                c_a_down(i_w+1)=c_a_down(i_w+1)+1;
            end
        end

        for i_o=0:(l_a-5)
            i_p=i_A_down(i_o+1,:);
            i_p=i_p(i_p>=0);
            i_C_down(i_o*y+i_d,1:l_b_down(i_o+1))=i_p;
        end

        l_b_tmp=l_b_down;

        for i_b=1:length(i_e)
            if (i_e(i_b)>d(j_a) && i_e(i_b)<=d(j_d+2))
                i_C_down((j_a-1)*y+i_d,1:(l_b_tmp(j_a)+1))=[i_C_down((j_a-1)*y+i_d,1:l_b_tmp(j_a)),i_e(i_b)];
                i_C_down((j_a-1)*y+i_d,1:(l_b_tmp(j_a)+1))=sort(i_C_down((j_a-1)*y+i_d,1:(l_b_tmp(j_a)+1)));
                ff=find(sort(i_C_down((j_a-1)*y+i_d,1:(l_b_tmp(j_a)+1)),'descend')==i_e(i_b));
                temp_1=i_D_down((j_a-1)*y+i_d,ff:l_b_tmp(j_a)-1);
                i_D_down((j_a-1)*y+i_d,ff)=i_f(i_b);
                i_D_down((j_a-1)*y+i_d,1:l_b_tmp(j_a))=[i_D_down((j_a-1)*y+i_d,1:ff),temp_1];
                pTSS_down((j_a-1)*y+i_d,1:l_b_tmp(j_a))=i_D_down((j_a-1)*y+i_d,1:l_b_tmp(j_a));
                temp_2=i_E_down((j_a-1)*y+i_d,ff:l_b_tmp(j_a)-1);
                i_E_down((j_a-1)*y+i_d,ff)=2;
                i_E_down((j_a-1)*y+i_d,1:l_b_tmp(j_a))=[i_E_down((j_a-1)*y+i_d,1:ff),temp_2];
                tTSS_down((j_a-1)*y+i_d,1:l_b_tmp(j_a))=i_E_down((j_a-1)*y+i_d,1:l_b_tmp(j_a));
                i_h_down(j_a,1:l_b_tmp(j_a)-1)=linspace(l_b_tmp(j_a)+1,3,l_b_tmp(j_a)-1);
                for i_i=1:l_b_tmp(j_a)-1
                    dTSS_down((j_a-1)*y+i_d,c_b_down(j_a))=i_C_down((j_a-1)*y+i_d,i_h_down(j_a,i_i))-i_C_down((j_a-1)*y+i_d,i_h_down(j_a,i_i)-1);
                    c_b_down(j_a)=c_b_down(j_a)+1;
                end
                c_b_down(j_a)=1;
                l_b_tmp(j_a)=l_b_tmp(j_a)+1;
            end

            for i_y=(j_d+2):2:l_a
                if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
                    i_C_down((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))=[i_C_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4)),i_e(i_b)];
                    i_C_down((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))=sort(i_C_down((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1)));
                    ff=find(i_C_down((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))==i_e(i_b));
                    temp_1=i_D_down((i_y-5)*y+i_d,ff:l_b_tmp(i_y-4)-1);
                    i_D_down((i_y-5)*y+i_d,ff)=i_f(i_b);
                    i_D_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=[i_D_down((i_y-5)*y+i_d,1:ff),temp_1];
                    pTSS_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=i_D_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4));
                    temp_2=i_E_down((i_y-5)*y+i_d,ff:l_b_tmp(i_y-4)-1);
                    i_E_down((i_y-5)*y+i_d,ff)=2;
                    i_E_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=[i_E_down((i_y-5)*y+i_d,1:ff),temp_2];
                    tTSS_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=i_E_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4));
                    i_h_down(i_y-4,1:l_b_tmp(i_y-4)-1)=linspace(2,l_b_tmp(i_y-4),l_b_tmp(i_y-4)-1);
                    for i_i=1:l_b_tmp(i_y-4)-1
                        dTSS_down((i_y-5)*y+i_d,c_b_down(i_y-4))=i_C_down((i_y-5)*y+i_d,i_h_down(i_y-4,i_i))-i_C_down((i_y-5)*y+i_d,i_h_down(i_y-4,i_i)-1);
                        c_b_down(i_y-4)=c_b_down(i_y-4)+1;
                    end
                    c_b_down(i_y-4)=1;
                    l_b_tmp(i_y-4)=l_b_tmp(i_y-4)+1;
                end
            end

            for i_y=(j_d+3):2:l_a
                if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
                    i_C_down((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))=[i_C_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4)),i_e(i_b)];
                    i_C_down((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))=sort(i_C_down((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1)));
                    ff=find(sort(i_C_down((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1)),'descend')==i_e(i_b));
                    temp_1=i_D_down((i_y-5)*y+i_d,ff:l_b_tmp(i_y-4)-1);
                    i_D_down((i_y-5)*y+i_d,ff)=i_f(i_b);
                    i_D_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=[i_D_down((i_y-5)*y+i_d,1:ff),temp_1];
                    pTSS_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=i_D_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4));
                    temp_2=i_E_down((i_y-5)*y+i_d,ff:l_b_tmp(i_y-4)-1);
                    i_E_down((i_y-5)*y+i_d,ff)=2;
                    i_E_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=[i_E_down((i_y-5)*y+i_d,1:ff),temp_2];
                    tTSS_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=i_E_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4));
                    i_h_down(i_y-4,1:l_b_tmp(i_y-4)-1)=linspace(l_b_tmp(i_y-4)+1,3,l_b_tmp(i_y-4)-1);
                    for i_i=1:l_b_tmp(i_y-4)-1
                        dTSS_down((i_y-5)*y+i_d,c_b_down(i_y-4))=i_C_down((i_y-5)*y+i_d,i_h_down(i_y-4,i_i))-i_C_down((i_y-5)*y+i_d,i_h_down(i_y-4,i_i)-1);
                        c_b_down(i_y-4)=c_b_down(i_y-4)+1;
                    end
                    c_b_down(i_y-4)=1;
                    l_b_tmp(i_y-4)=l_b_tmp(i_y-4)+1;
                end
            end
        end
    end

elseif (N_TSS_O(1)==N_TSS || N_TSS_O(2)==N_TSS)     % 2 adjacent TSS outage from the end

    %distance of TSS,ATs and SP of each winding
    for i_j=1:(j_a-2)
        b=[d(i_j),AT(AT>d(i_j) & AT<d(i_j+1)),d(i_j+1)];
        i_A_down(i_j,1:length(b))=b;
    end

    b=[d(j_a-1),AT(AT>d(j_a-1) & AT<d(j_d+1)),d(j_d+1)];
    i_A_down(j_a-1,1:length(b))=b;

    for i_k=1:(l_a-4)
        i_l=i_A_down(i_k,:);
        i_l=i_l(i_l>=0);
        l_b_down(i_k)=length(i_l);
    end

    for i_m=1:2:(l_a-4)
        i_B_down(i_m,1:(l_b_down(i_m)-2))=linspace(l_b_down(i_m),3,l_b_down(i_m)-2);
    end

    for i_n=2:2:(l_a-4)
        i_B_down(i_n,1:(l_b_down(i_n)-2))=linspace(2,l_b_down(i_n)-1,l_b_down(i_n)-2);
    end

    for i_s=1:(l_a-4)
        i_t=i_B_down(i_s,:);
        i_t=i_t(i_t>0);
        l_c_down(i_s)=length(i_t);
    end

    for i_d=1:y
        i_e=distance_down(i_d,2:end);
        i_e=i_e(i_e>0);
        i_f=power_down(i_d,2:end);
        i_f=i_f(i_f~=-100);
        c_a_down=ones(1,l_a-4);
        c_b_down=ones(1,l_a-4);

        for i_q=0:(l_a-5)
            pTSS_down(i_q*y+i_d,1:(l_b_down(i_q+1)-1))=zeros(1,(l_b_down(i_q+1)-1));
        end

        for i_r=0:(l_a-5)
            tTSS_down(i_r*y+i_d,1:(l_b_down(i_r+1)-1))=[1,3*ones(1,(l_b_down(i_r+1)-2))];
        end

        for i_u=0:2:(l_a-5)
            for i_v=1:l_c_down(i_u+1)
                dTSS_down(i_u*y+i_d,c_a_down(i_u+1))=i_A_down(i_u+1,i_B_down(i_u+1,i_v))-i_A_down(i_u+1,i_B_down(i_u+1,i_v)-1);
                c_a_down(i_u+1)=c_a_down(i_u+1)+1;
            end
        end

        for i_w=1:2:(l_a-5)
            for i_x=1:l_c_down(i_w+1)
                dTSS_down(i_w*y+i_d,c_a_down(i_w+1))=i_A_down(i_w+1,i_B_down(i_w+1,i_x))-i_A_down(i_w+1,i_B_down(i_w+1,i_x)-1);
                c_a_down(i_w+1)=c_a_down(i_w+1)+1;
            end
        end

        for i_o=0:(l_a-5)
            i_p=i_A_down(i_o+1,:);
            i_p=i_p(i_p>=0);
            i_C_down(i_o*y+i_d,1:l_b_down(i_o+1))=i_p;
        end

        l_b_tmp=l_b_down;

        for i_b=1:length(i_e)
            for i_y=1:2:(j_a-2)
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
                    for i_i=1:l_b_tmp(i_y)-1
                        dTSS_down((i_y-1)*y+i_d,c_b_down(i_y))=i_C_down((i_y-1)*y+i_d,i_h_down(i_y,i_i))-i_C_down((i_y-1)*y+i_d,i_h_down(i_y,i_i)-1);
                        c_b_down(i_y)=c_b_down(i_y)+1;
                    end
                    c_b_down(i_y)=1;
                    l_b_tmp(i_y)=l_b_tmp(i_y)+1;
                end
            end
            for i_y=2:2:(j_a-2)
                if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
                    i_C_down((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))=[i_C_down((i_y-1)*y+i_d,1:l_b_tmp(i_y)),i_e(i_b)];
                    i_C_down((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))=sort(i_C_down((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1)));
                    ff=find(i_C_down((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))==i_e(i_b));
                    temp_1=i_D_down((i_y-1)*y+i_d,ff:l_b_tmp(i_y)-1);
                    i_D_down((i_y-1)*y+i_d,ff)=i_f(i_b);
                    i_D_down((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_D_down((i_y-1)*y+i_d,1:ff),temp_1];
                    pTSS_down((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_D_down((i_y-1)*y+i_d,1:l_b_tmp(i_y));
                    temp_2=i_E_down((i_y-1)*y+i_d,ff:l_b_tmp(i_y)-1);
                    i_E_down((i_y-1)*y+i_d,ff)=2;
                    i_E_down((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_E_down((i_y-1)*y+i_d,1:ff),temp_2];
                    tTSS_down((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_E_down((i_y-1)*y+i_d,1:l_b_tmp(i_y));
                    i_h_down(i_y,1:l_b_tmp(i_y)-1)=linspace(2,l_b_tmp(i_y),l_b_tmp(i_y)-1);
                    for i_i=1:l_b_tmp(i_y)-1
                        dTSS_down((i_y-1)*y+i_d,c_b_down(i_y))=i_C_down((i_y-1)*y+i_d,i_h_down(i_y,i_i))-i_C_down((i_y-1)*y+i_d,i_h_down(i_y,i_i)-1);
                        c_b_down(i_y)=c_b_down(i_y)+1;
                    end
                    c_b_down(i_y)=1;
                    l_b_tmp(i_y)=l_b_tmp(i_y)+1;
                end
            end
            if (i_e(i_b)>d(j_a-1) && i_e(i_b)<=d(j_d+1))
                i_C_down((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1))=[i_C_down((j_a-2)*y+i_d,1:l_b_tmp(j_a-1)),i_e(i_b)];
                i_C_down((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1))=sort(i_C_down((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1)));
                ff=find(i_C_down((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1))==i_e(i_b));
                temp_1=i_D_down((j_a-2)*y+i_d,ff:l_b_tmp(j_a-1)-1);
                i_D_down((j_a-2)*y+i_d,ff)=i_f(i_b);
                i_D_down((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=[i_D_down((j_a-2)*y+i_d,1:ff),temp_1];
                pTSS_down((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=i_D_down((j_a-2)*y+i_d,1:l_b_tmp(j_a-1));
                temp_2=i_E_down((j_a-2)*y+i_d,ff:l_b_tmp(j_a-1)-1);
                i_E_down((j_a-2)*y+i_d,ff)=2;
                i_E_down((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=[i_E_down((j_a-2)*y+i_d,1:ff),temp_2];
                tTSS_down((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=i_E_down((j_a-2)*y+i_d,1:l_b_tmp(j_a-1));
                i_h_down(j_a-1,1:l_b_tmp(j_a-1)-1)=linspace(2,l_b_tmp(j_a-1),l_b_tmp(j_a-1)-1);
                for i_i=1:l_b_tmp(j_a-1)-1
                    dTSS_down((j_a-2)*y+i_d,c_b_down(j_a-1))=i_C_down((j_a-2)*y+i_d,i_h_down(j_a-1,i_i))-i_C_down((j_a-2)*y+i_d,i_h_down(j_a-1,i_i)-1);
                    c_b_down(j_a-1)=c_b_down(j_a-1)+1;
                end
                c_b_down(j_a-1)=1;
                l_b_tmp(j_a-1)=l_b_tmp(j_a-1)+1;
            end
        end
    end

else    % 2 intermediate adjacent TSS outage 

    %distance of TSS,ATs and SP of each winding
    for i_j=1:(j_a-2)
        b=[d(i_j),AT(AT>d(i_j) & AT<d(i_j+1)),d(i_j+1)];
        i_A_down(i_j,1:length(b))=b;
    end

    b=[d(j_a-1),AT(AT>d(j_a-1) & AT<d(j_a+2)),d(j_a+2)];
    i_A_down(j_a-1,1:length(b))=b;

    b=[d(j_c),AT(AT>d(j_c) & AT<d(j_d+2)),d(j_d+2)];
    i_A_down(j_a,1:length(b))=b;

    for i_j=(j_d+2):l_a
        b=[d(i_j),AT(AT>d(i_j) & AT<d(i_j+1)),d(i_j+1)];
        i_A_down(i_j-4,1:length(b))=b;
    end

    for i_k=1:(l_a-4)
        i_l=i_A_down(i_k,:);
        i_l=i_l(i_l>=0);
        l_b_down(i_k)=length(i_l);
    end

    for i_m=1:2:(l_a-4)
        i_B_down(i_m,1:(l_b_down(i_m)-2))=linspace(l_b_down(i_m),3,l_b_down(i_m)-2);
    end

    for i_n=2:2:(l_a-4)
        i_B_down(i_n,1:(l_b_down(i_n)-2))=linspace(2,l_b_down(i_n)-1,l_b_down(i_n)-2);
    end

    for i_s=1:(l_a-4)
        i_t=i_B_down(i_s,:);
        i_t=i_t(i_t>0);
        l_c_down(i_s)=length(i_t);
    end

    for i_d=1:y
        i_e=distance_down(i_d,2:end);
        i_e=i_e(i_e>0);
        i_f=power_down(i_d,2:end);
        i_f=i_f(i_f~=-100);
        c_a_down=ones(1,l_a-4);
        c_b_down=ones(1,l_a-4);

        for i_q=0:(l_a-5)
            pTSS_down(i_q*y+i_d,1:(l_b_down(i_q+1)-1))=zeros(1,(l_b_down(i_q+1)-1));
        end

        for i_r=0:(l_a-5)
            tTSS_down(i_r*y+i_d,1:(l_b_down(i_r+1)-1))=[1,3*ones(1,(l_b_down(i_r+1)-2))];
        end

        for i_u=0:2:(l_a-5)
            for i_v=1:l_c_down(i_u+1)
                dTSS_down(i_u*y+i_d,c_a_down(i_u+1))=i_A_down(i_u+1,i_B_down(i_u+1,i_v))-i_A_down(i_u+1,i_B_down(i_u+1,i_v)-1);
                c_a_down(i_u+1)=c_a_down(i_u+1)+1;
            end
        end

        for i_w=1:2:(l_a-5)
            for i_x=1:l_c_down(i_w+1)
                dTSS_down(i_w*y+i_d,c_a_down(i_w+1))=i_A_down(i_w+1,i_B_down(i_w+1,i_x))-i_A_down(i_w+1,i_B_down(i_w+1,i_x)-1);
                c_a_down(i_w+1)=c_a_down(i_w+1)+1;
            end
        end

        for i_o=0:(l_a-5)
            i_p=i_A_down(i_o+1,:);
            i_p=i_p(i_p>=0);
            i_C_down(i_o*y+i_d,1:l_b_down(i_o+1))=i_p;
        end

        l_b_tmp=l_b_down;

        for i_b=1:length(i_e)
            for i_y=1:2:(j_a-2)
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
                    for i_i=1:l_b_tmp(i_y)-1
                        dTSS_down((i_y-1)*y+i_d,c_b_down(i_y))=i_C_down((i_y-1)*y+i_d,i_h_down(i_y,i_i))-i_C_down((i_y-1)*y+i_d,i_h_down(i_y,i_i)-1);
                        c_b_down(i_y)=c_b_down(i_y)+1;
                    end
                    c_b_down(i_y)=1;
                    l_b_tmp(i_y)=l_b_tmp(i_y)+1;
                end
            end
            for i_y=2:2:(j_a-2)
                if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
                    i_C_down((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))=[i_C_down((i_y-1)*y+i_d,1:l_b_tmp(i_y)),i_e(i_b)];
                    i_C_down((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))=sort(i_C_down((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1)));
                    ff=find(i_C_down((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))==i_e(i_b));
                    temp_1=i_D_down((i_y-1)*y+i_d,ff:l_b_tmp(i_y)-1);
                    i_D_down((i_y-1)*y+i_d,ff)=i_f(i_b);
                    i_D_down((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_D_down((i_y-1)*y+i_d,1:ff),temp_1];
                    pTSS_down((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_D_down((i_y-1)*y+i_d,1:l_b_tmp(i_y));
                    temp_2=i_E_down((i_y-1)*y+i_d,ff:l_b_tmp(i_y)-1);
                    i_E_down((i_y-1)*y+i_d,ff)=2;
                    i_E_down((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_E_down((i_y-1)*y+i_d,1:ff),temp_2];
                    tTSS_down((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_E_down((i_y-1)*y+i_d,1:l_b_tmp(i_y));
                    i_h_down(i_y,1:l_b_tmp(i_y)-1)=linspace(2,l_b_tmp(i_y),l_b_tmp(i_y)-1);
                    for i_i=1:l_b_tmp(i_y)-1
                        dTSS_down((i_y-1)*y+i_d,c_b_down(i_y))=i_C_down((i_y-1)*y+i_d,i_h_down(i_y,i_i))-i_C_down((i_y-1)*y+i_d,i_h_down(i_y,i_i)-1);
                        c_b_down(i_y)=c_b_down(i_y)+1;
                    end
                    c_b_down(i_y)=1;
                    l_b_tmp(i_y)=l_b_tmp(i_y)+1;
                end
            end
            if (i_e(i_b)>d(j_a-1) && i_e(i_b)<=d(j_a+2))
                i_C_down((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1))=[i_C_down((j_a-2)*y+i_d,1:l_b_tmp(j_a-1)),i_e(i_b)];
                i_C_down((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1))=sort(i_C_down((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1)));
                ff=find(i_C_down((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1))==i_e(i_b));
                temp_1=i_D_down((j_a-2)*y+i_d,ff:l_b_tmp(j_a-1)-1);
                i_D_down((j_a-2)*y+i_d,ff)=i_f(i_b);
                i_D_down((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=[i_D_down((j_a-2)*y+i_d,1:ff),temp_1];
                pTSS_down((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=i_D_down((j_a-2)*y+i_d,1:l_b_tmp(j_a-1));
                temp_2=i_E_down((j_a-2)*y+i_d,ff:l_b_tmp(j_a-1)-1);
                i_E_down((j_a-2)*y+i_d,ff)=2;
                i_E_down((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=[i_E_down((j_a-2)*y+i_d,1:ff),temp_2];
                tTSS_down((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=i_E_down((j_a-2)*y+i_d,1:l_b_tmp(j_a-1));
                i_h_down(j_a-1,1:l_b_tmp(j_a-1)-1)=linspace(2,l_b_tmp(j_a-1),l_b_tmp(j_a-1)-1);
                for i_i=1:l_b_tmp(j_a-1)-1
                    dTSS_down((j_a-2)*y+i_d,c_b_down(j_a-1))=i_C_down((j_a-2)*y+i_d,i_h_down(j_a-1,i_i))-i_C_down((j_a-2)*y+i_d,i_h_down(j_a-1,i_i)-1);
                    c_b_down(j_a-1)=c_b_down(j_a-1)+1;
                end
                c_b_down(j_a-1)=1;
                l_b_tmp(j_a-1)=l_b_tmp(j_a-1)+1;
            end
            if (i_e(i_b)>d(j_c) && i_e(i_b)<=d(j_d+2))
                i_C_down((j_b-2)*y+i_d,1:(l_b_tmp(j_b-1)+1))=[i_C_down((j_b-2)*y+i_d,1:l_b_tmp(j_b-1)),i_e(i_b)];
                i_C_down((j_b-2)*y+i_d,1:(l_b_tmp(j_b-1)+1))=sort(i_C_down((j_b-2)*y+i_d,1:(l_b_tmp(j_b-1)+1)));
                ff=find(sort(i_C_down((j_b-2)*y+i_d,1:(l_b_tmp(j_b-1)+1)),'descend')==i_e(i_b));
                temp_1=i_D_down((j_b-2)*y+i_d,ff:l_b_tmp(j_b-1)-1);
                i_D_down((j_b-2)*y+i_d,ff)=i_f(i_b);
                i_D_down((j_b-2)*y+i_d,1:l_b_tmp(j_b-1))=[i_D_down((j_b-2)*y+i_d,1:ff),temp_1];
                pTSS_down((j_b-2)*y+i_d,1:l_b_tmp(j_b-1))=i_D_down((j_b-2)*y+i_d,1:l_b_tmp(j_b-1));
                temp_2=i_E_down((j_b-2)*y+i_d,ff:l_b_tmp(j_b-1)-1);
                i_E_down((j_b-2)*y+i_d,ff)=2;
                i_E_down((j_b-2)*y+i_d,1:l_b_tmp(j_b-1))=[i_E_down((j_b-2)*y+i_d,1:ff),temp_2];
                tTSS_down((j_b-2)*y+i_d,1:l_b_tmp(j_b-1))=i_E_down((j_b-2)*y+i_d,1:l_b_tmp(j_b-1));
                i_h_down(j_b-1,1:l_b_tmp(j_b-1)-1)=linspace(l_b_tmp(j_b-1)+1,3,l_b_tmp(j_b-1)-1);
                for i_i=1:l_b_tmp(j_b-1)-1
                    dTSS_down((j_b-2)*y+i_d,c_b_down(j_b-1))=i_C_down((j_b-2)*y+i_d,i_h_down(j_b-1,i_i))-i_C_down((j_b-2)*y+i_d,i_h_down(j_b-1,i_i)-1);
                    c_b_down(j_b-1)=c_b_down(j_b-1)+1;
                end
                c_b_down(j_b-1)=1;
                l_b_tmp(j_b-1)=l_b_tmp(j_b-1)+1;
            end
            for i_y=(j_d+2):2:l_a
                if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
                    i_C_down((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))=[i_C_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4)),i_e(i_b)];
                    i_C_down((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))=sort(i_C_down((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1)));
                    ff=find(i_C_down((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))==i_e(i_b));
                    temp_1=i_D_down((i_y-5)*y+i_d,ff:l_b_tmp(i_y-4)-1);
                    i_D_down((i_y-5)*y+i_d,ff)=i_f(i_b);
                    i_D_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=[i_D_down((i_y-5)*y+i_d,1:ff),temp_1];
                    pTSS_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=i_D_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4));
                    temp_2=i_E_down((i_y-5)*y+i_d,ff:l_b_tmp(i_y-4)-1);
                    i_E_down((i_y-5)*y+i_d,ff)=2;
                    i_E_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=[i_E_down((i_y-5)*y+i_d,1:ff),temp_2];
                    tTSS_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=i_E_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4));
                    i_h_down(i_y-4,1:l_b_tmp(i_y-4)-1)=linspace(2,l_b_tmp(i_y-4),l_b_tmp(i_y-4)-1);
                    for i_i=1:l_b_tmp(i_y-4)-1
                        dTSS_down((i_y-5)*y+i_d,c_b_down(i_y-4))=i_C_down((i_y-5)*y+i_d,i_h_down(i_y-4,i_i))-i_C_down((i_y-5)*y+i_d,i_h_down(i_y-4,i_i)-1);
                        c_b_down(i_y-4)=c_b_down(i_y-4)+1;
                    end
                    c_b_down(i_y-4)=1;
                    l_b_tmp(i_y-4)=l_b_tmp(i_y-4)+1;
                end
            end
            for i_y=(j_d+3):2:l_a
                if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
                    i_C_down((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))=[i_C_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4)),i_e(i_b)];
                    i_C_down((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1))=sort(i_C_down((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1)));
                    ff=find(sort(i_C_down((i_y-5)*y+i_d,1:(l_b_tmp(i_y-4)+1)),'descend')==i_e(i_b));
                    temp_1=i_D_down((i_y-5)*y+i_d,ff:l_b_tmp(i_y-4)-1);
                    i_D_down((i_y-5)*y+i_d,ff)=i_f(i_b);
                    i_D_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=[i_D_down((i_y-5)*y+i_d,1:ff),temp_1];
                    pTSS_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=i_D_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4));
                    temp_2=i_E_down((i_y-5)*y+i_d,ff:l_b_tmp(i_y-4)-1);
                    i_E_down((i_y-5)*y+i_d,ff)=2;
                    i_E_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=[i_E_down((i_y-5)*y+i_d,1:ff),temp_2];
                    tTSS_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4))=i_E_down((i_y-5)*y+i_d,1:l_b_tmp(i_y-4));
                    i_h_down(i_y-4,1:l_b_tmp(i_y-4)-1)=linspace(l_b_tmp(i_y-4)+1,3,l_b_tmp(i_y-4)-1);
                    for i_i=1:l_b_tmp(i_y-4)-1
                        dTSS_down((i_y-5)*y+i_d,c_b_down(i_y-4))=i_C_down((i_y-5)*y+i_d,i_h_down(i_y-4,i_i))-i_C_down((i_y-5)*y+i_d,i_h_down(i_y-4,i_i)-1);
                        c_b_down(i_y-4)=c_b_down(i_y-4)+1;
                    end
                    c_b_down(i_y-4)=1;
                    l_b_tmp(i_y-4)=l_b_tmp(i_y-4)+1;
                end
            end
        end     
    end
end
toc
