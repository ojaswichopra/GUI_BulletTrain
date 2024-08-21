clear;
clc;
close all;
tic
initialization;

i_A=-10*ones(l_a-3,10);
i_B=zeros(l_a-3,10);
i_h=zeros(l_a-3,10);

%line data matrix initialization
dTSS=zeros((l_a-3)*y,15);

%bus data matrix initialization
pTSS=-100*ones((l_a-3)*y,15);

%bus type matrix initialization
tTSS=zeros((l_a-3)*y,15);

%Line data matrix initialization
i_C=zeros((l_a-3)*y,10);

%bus data matrix initialization
i_D=zeros((l_a-3)*y,10);

%bus type matrix initialization
 %TSS= bus type 1
 %AT= bus type 3
 %Train= bus type 2
i_E=[ones((l_a-3)*y,1),3*ones((l_a-3)*y,9)];

N_TSS_O=input('enter the TSS number which is out of service = ');

j_a=2*N_TSS_O-1;
j_b=2*N_TSS_O;        %the corresponding out of service windings

if N_TSS_O > N_TSS

    disp('Invalid TSS number entered')

elseif N_TSS_O==1     %1st TSS outage

    %distance of TSS,ATs and SP of each winding
    b=[d(j_a),AT(AT>d(j_a) & AT<d(j_b+2)),d(j_b+2)];
    i_A(j_a,1:length(b))=b;

    for i_j=(j_b+2):(l_a-1)
    b=[d(i_j),AT(AT>d(i_j) & AT<d(i_j+1)),d(i_j+1)];
    i_A(i_j-2,1:length(b))=b;
    end

for i_k=1:(l_a-3)
    i_l=i_A(i_k,:);
    i_l=i_l(i_l>=0);
    l_b(i_k)=length(i_l);
end

for i_m=1:2:(l_a-3)
    i_B(i_m,1:(l_b(i_m)-2))=linspace(l_b(i_m),3,l_b(i_m)-2);
end

for i_n=2:2:(l_a-3)
    i_B(i_n,1:(l_b(i_n)-2))=linspace(2,l_b(i_n)-1,l_b(i_n)-2);
end

for i_s=1:(l_a-3)
    i_t=i_B(i_s,:);
    i_t=i_t(i_t>0);
    l_c(i_s)=length(i_t);
end

for i_d=1:y
    i_e=distance(i_d,2:end);
    i_e=i_e(i_e>0);
    i_f=power(i_d,2:end);
    i_f=i_f(i_f~=-100);
    c_a=ones(1,l_a-3);
    c_b=ones(1,l_a-3);

for i_q=0:(l_a-4)
    pTSS(i_q*y+i_d,1:(l_b(i_q+1)-1))=zeros(1,(l_b(i_q+1)-1));
end

for i_r=0:(l_a-4)
    tTSS(i_r*y+i_d,1:(l_b(i_r+1)-1))=[1,3*ones(1,(l_b(i_r+1)-2))];
end

for i_u=0:2:(l_a-4)
      for i_v=1:l_c(i_u+1)
          dTSS(i_u*y+i_d,c_a(i_u+1))=i_A(i_u+1,i_B(i_u+1,i_v))-i_A(i_u+1,i_B(i_u+1,i_v)-1);
          c_a(i_u+1)=c_a(i_u+1)+1;
      end
 end

 for i_w=1:2:(l_a-4)
      for i_x=1:l_c(i_w+1)
          dTSS(i_w*y+i_d,c_a(i_w+1))=i_A(i_w+1,i_B(i_w+1,i_x))-i_A(i_w+1,i_B(i_w+1,i_x)-1);
          c_a(i_w+1)=c_a(i_w+1)+1;
      end
 end

 for i_o=0:(l_a-4)
    i_p=i_A(i_o+1,:);
    i_p=i_p(i_p>=0);
    i_C(i_o*y+i_d,1:l_b(i_o+1))=i_p;
 end

 l_b_tmp=l_b;

 for i_b=1:length(i_e)
     if (i_e(i_b)>d(j_a) && i_e(i_b)<=d(j_b+2))
        i_C((j_a-1)*y+i_d,1:(l_b_tmp(j_a)+1))=[i_C((j_a-1)*y+i_d,1:l_b_tmp(j_a)),i_e(i_b)];
        i_C((j_a-1)*y+i_d,1:(l_b_tmp(j_a)+1))=sort(i_C((j_a-1)*y+i_d,1:(l_b_tmp(j_a)+1)));
        f=find(sort(i_C((j_a-1)*y+i_d,1:(l_b_tmp(j_a)+1)),'descend')==i_e(i_b));
        temp_1=i_D((j_a-1)*y+i_d,f:l_b_tmp(j_a)-1);
        i_D((j_a-1)*y+i_d,f)=i_f(i_b);
        i_D((j_a-1)*y+i_d,1:l_b_tmp(j_a))=[i_D((j_a-1)*y+i_d,1:f),temp_1];
        pTSS((j_a-1)*y+i_d,1:l_b_tmp(j_a))=i_D((j_a-1)*y+i_d,1:l_b_tmp(j_a));
        temp_2=i_E((j_a-1)*y+i_d,f:l_b_tmp(j_a)-1);
        i_E((j_a-1)*y+i_d,f)=2;
        i_E((j_a-1)*y+i_d,1:l_b_tmp(j_a))=[i_E((j_a-1)*y+i_d,1:f),temp_2];
        tTSS((j_a-1)*y+i_d,1:l_b_tmp(j_a))=i_E((j_a-1)*y+i_d,1:l_b_tmp(j_a));
        i_h(j_a,1:l_b_tmp(j_a)-1)=linspace(l_b_tmp(j_a)+1,3,l_b_tmp(j_a)-1);
        for i_i=1:l_b_tmp(j_a)-1
           dTSS((j_a-1)*y+i_d,c_b(j_a))=i_C((j_a-1)*y+i_d,i_h(j_a,i_i))-i_C((j_a-1)*y+i_d,i_h(j_a,i_i)-1);
           c_b(j_a)=c_b(j_a)+1;
        end
        c_b(j_a)=1;
        l_b_tmp(j_a)=l_b_tmp(j_a)+1;
     end

     for i_y=(j_b+2):2:(l_a-1)
        if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
           i_C((i_y-3)*y+i_d,1:(l_b_tmp(i_y-2)+1))=[i_C((i_y-3)*y+i_d,1:l_b_tmp(i_y-2)),i_e(i_b)];
           i_C((i_y-3)*y+i_d,1:(l_b_tmp(i_y-2)+1))=sort(i_C((i_y-3)*y+i_d,1:(l_b_tmp(i_y-2)+1)));
           f=find(i_C((i_y-3)*y+i_d,1:(l_b_tmp(i_y-2)+1))==i_e(i_b));
           temp_1=i_D((i_y-3)*y+i_d,f:l_b_tmp(i_y-2)-1);
           i_D((i_y-3)*y+i_d,f)=i_f(i_b);
           i_D((i_y-3)*y+i_d,1:l_b_tmp(i_y-2))=[i_D((i_y-3)*y+i_d,1:f),temp_1];
           pTSS((i_y-3)*y+i_d,1:l_b_tmp(i_y-2))=i_D((i_y-3)*y+i_d,1:l_b_tmp(i_y-2));
           temp_2=i_E((i_y-3)*y+i_d,f:l_b_tmp(i_y-2)-1);
           i_E((i_y-3)*y+i_d,f)=2;
           i_E((i_y-3)*y+i_d,1:l_b_tmp(i_y-2))=[i_E((i_y-3)*y+i_d,1:f),temp_2];
           tTSS((i_y-3)*y+i_d,1:l_b_tmp(i_y-2))=i_E((i_y-3)*y+i_d,1:l_b_tmp(i_y-2));
           i_h(i_y-2,1:l_b_tmp(i_y-2)-1)=linspace(2,l_b_tmp(i_y-2),l_b_tmp(i_y-2)-1);
           for i_i=1:l_b_tmp(i_y-2)-1
               dTSS((i_y-3)*y+i_d,c_b(i_y-2))=i_C((i_y-3)*y+i_d,i_h(i_y-2,i_i))-i_C((i_y-3)*y+i_d,i_h(i_y-2,i_i)-1);
               c_b(i_y-2)=c_b(i_y-2)+1;
           end
           c_b(i_y-2)=1;
           l_b_tmp(i_y-2)=l_b_tmp(i_y-2)+1;
        end
     end

     for i_y=(j_b+3):2:(l_a-1)
       if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
           i_C((i_y-3)*y+i_d,1:(l_b_tmp(i_y-2)+1))=[i_C((i_y-3)*y+i_d,1:l_b_tmp(i_y-2)),i_e(i_b)];
           i_C((i_y-3)*y+i_d,1:(l_b_tmp(i_y-2)+1))=sort(i_C((i_y-3)*y+i_d,1:(l_b_tmp(i_y-2)+1)));
           f=find(sort(i_C((i_y-3)*y+i_d,1:(l_b_tmp(i_y-2)+1)),'descend')==i_e(i_b));
           temp_1=i_D((i_y-3)*y+i_d,f:l_b_tmp(i_y-2)-1);
           i_D((i_y-3)*y+i_d,f)=i_f(i_b);
           i_D((i_y-3)*y+i_d,1:l_b_tmp(i_y-2))=[i_D((i_y-3)*y+i_d,1:f),temp_1];
           pTSS((i_y-3)*y+i_d,1:l_b_tmp(i_y-2))=i_D((i_y-3)*y+i_d,1:l_b_tmp(i_y-2));
           temp_2=i_E((i_y-3)*y+i_d,f:l_b_tmp(i_y-2)-1);
           i_E((i_y-3)*y+i_d,f)=2;
           i_E((i_y-3)*y+i_d,1:l_b_tmp(i_y-2))=[i_E((i_y-3)*y+i_d,1:f),temp_2];
           tTSS((i_y-3)*y+i_d,1:l_b_tmp(i_y-2))=i_E((i_y-3)*y+i_d,1:l_b_tmp(i_y-2));
           i_h(i_y-2,1:l_b_tmp(i_y-2)-1)=linspace(l_b_tmp(i_y-2)+1,3,l_b_tmp(i_y-2)-1);
           for i_i=1:l_b_tmp(i_y-2)-1
               dTSS((i_y-3)*y+i_d,c_b(i_y-2))=i_C((i_y-3)*y+i_d,i_h(i_y-2,i_i))-i_C((i_y-3)*y+i_d,i_h(i_y-2,i_i)-1);
               c_b(i_y-2)=c_b(i_y-2)+1;
           end
           c_b(i_y-2)=1;
           l_b_tmp(i_y-2)=l_b_tmp(i_y-2)+1;
       end
     end
 end
end

elseif N_TSS_O==N_TSS      %Last TSS outage

    %distance of TSS,ATs and SP of each winding
    for i_j=1:(j_a-2)
    b=[d(i_j),AT(AT>d(i_j) & AT<d(i_j+1)),d(i_j+1)];
    i_A(i_j,1:length(b))=b;
    end

    b=[d(j_a-1),AT(AT>d(j_a-1) & AT<d(j_b+1)),d(j_b+1)];
    i_A(j_a-1,1:length(b))=b;

for i_k=1:(l_a-3)
    i_l=i_A(i_k,:);
    i_l=i_l(i_l>=0);
    l_b(i_k)=length(i_l);
end

for i_m=1:2:(l_a-3)
    i_B(i_m,1:(l_b(i_m)-2))=linspace(l_b(i_m),3,l_b(i_m)-2);
end

for i_n=2:2:(l_a-3)
    i_B(i_n,1:(l_b(i_n)-2))=linspace(2,l_b(i_n)-1,l_b(i_n)-2);
end

for i_s=1:(l_a-3)
    i_t=i_B(i_s,:);
    i_t=i_t(i_t>0);
    l_c(i_s)=length(i_t);
end

for i_d=1:y
    i_e=distance(i_d,2:end);
    i_e=i_e(i_e>0);
    i_f=power(i_d,2:end);
    i_f=i_f(i_f~=-100);
    c_a=ones(1,l_a-3);
    c_b=ones(1,l_a-3);

for i_q=0:(l_a-4)
    pTSS(i_q*y+i_d,1:(l_b(i_q+1)-1))=zeros(1,(l_b(i_q+1)-1));
end

for i_r=0:(l_a-4)
    tTSS(i_r*y+i_d,1:(l_b(i_r+1)-1))=[1,3*ones(1,(l_b(i_r+1)-2))];
end

for i_u=0:2:(l_a-4)
      for i_v=1:l_c(i_u+1)
          dTSS(i_u*y+i_d,c_a(i_u+1))=i_A(i_u+1,i_B(i_u+1,i_v))-i_A(i_u+1,i_B(i_u+1,i_v)-1);
          c_a(i_u+1)=c_a(i_u+1)+1;
      end
 end

 for i_w=1:2:(l_a-4)
      for i_x=1:l_c(i_w+1)
          dTSS(i_w*y+i_d,c_a(i_w+1))=i_A(i_w+1,i_B(i_w+1,i_x))-i_A(i_w+1,i_B(i_w+1,i_x)-1);
          c_a(i_w+1)=c_a(i_w+1)+1;
      end
 end

 for i_o=0:(l_a-4)
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
           f=find(sort(i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1)),'descend')==i_e(i_b));
           temp_1=i_D((i_y-1)*y+i_d,f:l_b_tmp(i_y)-1);
           i_D((i_y-1)*y+i_d,f)=i_f(i_b);
           i_D((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_D((i_y-1)*y+i_d,1:f),temp_1];
           pTSS((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_D((i_y-1)*y+i_d,1:l_b_tmp(i_y));
           temp_2=i_E((i_y-1)*y+i_d,f:l_b_tmp(i_y)-1);
           i_E((i_y-1)*y+i_d,f)=2;
           i_E((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_E((i_y-1)*y+i_d,1:f),temp_2];
           tTSS((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_E((i_y-1)*y+i_d,1:l_b_tmp(i_y));
           i_h(i_y,1:l_b_tmp(i_y)-1)=linspace(l_b_tmp(i_y)+1,3,l_b_tmp(i_y)-1);
           for i_i=1:l_b_tmp(i_y)-1
               dTSS((i_y-1)*y+i_d,c_b(i_y))=i_C((i_y-1)*y+i_d,i_h(i_y,i_i))-i_C((i_y-1)*y+i_d,i_h(i_y,i_i)-1);
               c_b(i_y)=c_b(i_y)+1;
           end
           c_b(i_y)=1;
           l_b_tmp(i_y)=l_b_tmp(i_y)+1;
       end
    end
    for i_y=2:2:(j_a-3)
        if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
           i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))=[i_C((i_y-1)*y+i_d,1:l_b_tmp(i_y)),i_e(i_b)];
           i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))=sort(i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1)));
           f=find(i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))==i_e(i_b));
           temp_1=i_D((i_y-1)*y+i_d,f:l_b_tmp(i_y)-1);
           i_D((i_y-1)*y+i_d,f)=i_f(i_b);
           i_D((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_D((i_y-1)*y+i_d,1:f),temp_1];
           pTSS((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_D((i_y-1)*y+i_d,1:l_b_tmp(i_y));
           temp_2=i_E((i_y-1)*y+i_d,f:l_b_tmp(i_y)-1);
           i_E((i_y-1)*y+i_d,f)=2;
           i_E((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_E((i_y-1)*y+i_d,1:f),temp_2];
           tTSS((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_E((i_y-1)*y+i_d,1:l_b_tmp(i_y));
           i_h(i_y,1:l_b_tmp(i_y)-1)=linspace(2,l_b_tmp(i_y),l_b_tmp(i_y)-1);
           for i_i=1:l_b_tmp(i_y)-1
               dTSS((i_y-1)*y+i_d,c_b(i_y))=i_C((i_y-1)*y+i_d,i_h(i_y,i_i))-i_C((i_y-1)*y+i_d,i_h(i_y,i_i)-1);
               c_b(i_y)=c_b(i_y)+1;
           end
           c_b(i_y)=1;
           l_b_tmp(i_y)=l_b_tmp(i_y)+1;
       end
    end
    if (i_e(i_b)>d(j_a-1) && i_e(i_b)<=d(j_b+1))
        i_C((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1))=[i_C((j_a-2)*y+i_d,1:l_b_tmp(j_a-1)),i_e(i_b)];
        i_C((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1))=sort(i_C((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1)));
        f=find(i_C((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1))==i_e(i_b));
        temp_1=i_D((j_a-2)*y+i_d,f:l_b_tmp(j_a-1)-1);
        i_D((j_a-2)*y+i_d,f)=i_f(i_b);
        i_D((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=[i_D((j_a-2)*y+i_d,1:f),temp_1];
        pTSS((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=i_D((j_a-2)*y+i_d,1:l_b_tmp(j_a-1));
        temp_2=i_E((j_a-2)*y+i_d,f:l_b_tmp(j_a-1)-1);
        i_E((j_a-2)*y+i_d,f)=2;
        i_E((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=[i_E((j_a-2)*y+i_d,1:f),temp_2];
        tTSS((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=i_E((j_a-2)*y+i_d,1:l_b_tmp(j_a-1));
        i_h(j_a-1,1:l_b_tmp(j_a-1)-1)=linspace(2,l_b_tmp(j_a-1),l_b_tmp(j_a-1)-1);
        for i_i=1:l_b_tmp(j_a-1)-1
            dTSS((j_a-2)*y+i_d,c_b(j_a-1))=i_C((j_a-2)*y+i_d,i_h(j_a-1,i_i))-i_C((j_a-2)*y+i_d,i_h(j_a-1,i_i)-1);
            c_b(j_a-1)=c_b(j_a-1)+1;
        end
        c_b(j_a-1)=1;
        l_b_tmp(j_a-1)=l_b_tmp(j_a-1)+1;
    end
end
end

else     %intermediate TSS outage

    %distance of TSS,ATs and SP of each winding
    for i_j=1:(j_a-2)
    b=[d(i_j),AT(AT>d(i_j) & AT<d(i_j+1)),d(i_j+1)];
    i_A(i_j,1:length(b))=b;
    end

b=[d(j_a-1),AT(AT>d(j_a-1) & AT<d(j_a+1)),d(j_a+1)];
i_A(j_a-1,1:length(b))=b;

b=[d(j_b),AT(AT>d(j_b) & AT<d(j_b+2)),d(j_b+2)];
i_A(j_a,1:length(b))=b;

for i_j=(j_b+2):(l_a-1)
    b=[d(i_j),AT(AT>d(i_j) & AT<d(i_j+1)),d(i_j+1)];
    i_A(i_j-2,1:length(b))=b;
end

for i_k=1:(l_a-3)
    i_l=i_A(i_k,:);
    i_l=i_l(i_l>=0);
    l_b(i_k)=length(i_l);
end

for i_m=1:2:(l_a-3)
    i_B(i_m,1:(l_b(i_m)-2))=linspace(l_b(i_m),3,l_b(i_m)-2);
end

for i_n=2:2:(l_a-3)
    i_B(i_n,1:(l_b(i_n)-2))=linspace(2,l_b(i_n)-1,l_b(i_n)-2);
end

for i_s=1:(l_a-3)
    i_t=i_B(i_s,:);
    i_t=i_t(i_t>0);
    l_c(i_s)=length(i_t);
end

 for i_d=1:y
    i_e=distance(i_d,2:end);
    i_e=i_e(i_e>0);
    i_f=power(i_d,2:end);
    i_f=i_f(i_f~=-100);
    c_a=ones(1,l_a-3);
    c_b=ones(1,l_a-3);

for i_q=0:(l_a-4)
    pTSS(i_q*y+i_d,1:(l_b(i_q+1)-1))=zeros(1,(l_b(i_q+1)-1));
end

for i_r=0:(l_a-4)
    tTSS(i_r*y+i_d,1:(l_b(i_r+1)-1))=[1,3*ones(1,(l_b(i_r+1)-2))];
end

for i_u=0:2:(l_a-4)
      for i_v=1:l_c(i_u+1)
          dTSS(i_u*y+i_d,c_a(i_u+1))=i_A(i_u+1,i_B(i_u+1,i_v))-i_A(i_u+1,i_B(i_u+1,i_v)-1);
          c_a(i_u+1)=c_a(i_u+1)+1;
      end
 end

 for i_w=1:2:(l_a-4)
      for i_x=1:l_c(i_w+1)
          dTSS(i_w*y+i_d,c_a(i_w+1))=i_A(i_w+1,i_B(i_w+1,i_x))-i_A(i_w+1,i_B(i_w+1,i_x)-1);
          c_a(i_w+1)=c_a(i_w+1)+1;
      end
 end

 for i_o=0:(l_a-4)
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
           f=find(sort(i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1)),'descend')==i_e(i_b));
           temp_1=i_D((i_y-1)*y+i_d,f:l_b_tmp(i_y)-1);
           i_D((i_y-1)*y+i_d,f)=i_f(i_b);
           i_D((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_D((i_y-1)*y+i_d,1:f),temp_1];
           pTSS((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_D((i_y-1)*y+i_d,1:l_b_tmp(i_y));
           temp_2=i_E((i_y-1)*y+i_d,f:l_b_tmp(i_y)-1);
           i_E((i_y-1)*y+i_d,f)=2;
           i_E((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_E((i_y-1)*y+i_d,1:f),temp_2];
           tTSS((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_E((i_y-1)*y+i_d,1:l_b_tmp(i_y));
           i_h(i_y,1:l_b_tmp(i_y)-1)=linspace(l_b_tmp(i_y)+1,3,l_b_tmp(i_y)-1);
           for i_i=1:l_b_tmp(i_y)-1
               dTSS((i_y-1)*y+i_d,c_b(i_y))=i_C((i_y-1)*y+i_d,i_h(i_y,i_i))-i_C((i_y-1)*y+i_d,i_h(i_y,i_i)-1);
               c_b(i_y)=c_b(i_y)+1;
           end
           c_b(i_y)=1;
           l_b_tmp(i_y)=l_b_tmp(i_y)+1;
       end
    end
    for i_y=2:2:(j_a-3)
        if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
           i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))=[i_C((i_y-1)*y+i_d,1:l_b_tmp(i_y)),i_e(i_b)];
           i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))=sort(i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1)));
           f=find(i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))==i_e(i_b));
           temp_1=i_D((i_y-1)*y+i_d,f:l_b_tmp(i_y)-1);
           i_D((i_y-1)*y+i_d,f)=i_f(i_b);
           i_D((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_D((i_y-1)*y+i_d,1:f),temp_1];
           pTSS((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_D((i_y-1)*y+i_d,1:l_b_tmp(i_y));
           temp_2=i_E((i_y-1)*y+i_d,f:l_b_tmp(i_y)-1);
           i_E((i_y-1)*y+i_d,f)=2;
           i_E((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_E((i_y-1)*y+i_d,1:f),temp_2];
           tTSS((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_E((i_y-1)*y+i_d,1:l_b_tmp(i_y));
           i_h(i_y,1:l_b_tmp(i_y)-1)=linspace(2,l_b_tmp(i_y),l_b_tmp(i_y)-1);
           for i_i=1:l_b_tmp(i_y)-1
               dTSS((i_y-1)*y+i_d,c_b(i_y))=i_C((i_y-1)*y+i_d,i_h(i_y,i_i))-i_C((i_y-1)*y+i_d,i_h(i_y,i_i)-1);
               c_b(i_y)=c_b(i_y)+1;
           end
           c_b(i_y)=1;
           l_b_tmp(i_y)=l_b_tmp(i_y)+1;
       end
    end
    if (i_e(i_b)>d(j_a-1) && i_e(i_b)<=d(j_a+1))
        i_C((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1))=[i_C((j_a-2)*y+i_d,1:l_b_tmp(j_a-1)),i_e(i_b)];
        i_C((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1))=sort(i_C((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1)));
        f=find(i_C((j_a-2)*y+i_d,1:(l_b_tmp(j_a-1)+1))==i_e(i_b));
        temp_1=i_D((j_a-2)*y+i_d,f:l_b_tmp(j_a-1)-1);
        i_D((j_a-2)*y+i_d,f)=i_f(i_b);
        i_D((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=[i_D((j_a-2)*y+i_d,1:f),temp_1];
        pTSS((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=i_D((j_a-2)*y+i_d,1:l_b_tmp(j_a-1));
        temp_2=i_E((j_a-2)*y+i_d,f:l_b_tmp(j_a-1)-1);
        i_E((j_a-2)*y+i_d,f)=2;
        i_E((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=[i_E((j_a-2)*y+i_d,1:f),temp_2];
        tTSS((j_a-2)*y+i_d,1:l_b_tmp(j_a-1))=i_E((j_a-2)*y+i_d,1:l_b_tmp(j_a-1));
        i_h(j_a-1,1:l_b_tmp(j_a-1)-1)=linspace(2,l_b_tmp(j_a-1),l_b_tmp(j_a-1)-1);
        for i_i=1:l_b_tmp(j_a-1)-1
            dTSS((j_a-2)*y+i_d,c_b(j_a-1))=i_C((j_a-2)*y+i_d,i_h(j_a-1,i_i))-i_C((j_a-2)*y+i_d,i_h(j_a-1,i_i)-1);
            c_b(j_a-1)=c_b(j_a-1)+1;
        end
        c_b(j_a-1)=1;
        l_b_tmp(j_a-1)=l_b_tmp(j_a-1)+1;
    end
    if (i_e(i_b)>d(j_b) && i_e(i_b)<=d(j_b+2))
        i_C((j_b-2)*y+i_d,1:(l_b_tmp(j_b-1)+1))=[i_C((j_b-2)*y+i_d,1:l_b_tmp(j_b-1)),i_e(i_b)];
        i_C((j_b-2)*y+i_d,1:(l_b_tmp(j_b-1)+1))=sort(i_C((j_b-2)*y+i_d,1:(l_b_tmp(j_b-1)+1)));
        f=find(sort(i_C((j_b-2)*y+i_d,1:(l_b_tmp(j_b-1)+1)),'descend')==i_e(i_b));
        temp_1=i_D((j_b-2)*y+i_d,f:l_b_tmp(j_b-1)-1);
        i_D((j_b-2)*y+i_d,f)=i_f(i_b);
        i_D((j_b-2)*y+i_d,1:l_b_tmp(j_b-1))=[i_D((j_b-2)*y+i_d,1:f),temp_1];
        pTSS((j_b-2)*y+i_d,1:l_b_tmp(j_b-1))=i_D((j_b-2)*y+i_d,1:l_b_tmp(j_b-1));
        temp_2=i_E((j_b-2)*y+i_d,f:l_b_tmp(j_b-1)-1);
        i_E((j_b-2)*y+i_d,f)=2;
        i_E((j_b-2)*y+i_d,1:l_b_tmp(j_b-1))=[i_E((j_b-2)*y+i_d,1:f),temp_2];
        tTSS((j_b-2)*y+i_d,1:l_b_tmp(j_b-1))=i_E((j_b-2)*y+i_d,1:l_b_tmp(j_b-1));
        i_h(j_b-1,1:l_b_tmp(j_b-1)-1)=linspace(l_b_tmp(j_b-1)+1,3,l_b_tmp(j_b-1)-1);
        for i_i=1:l_b_tmp(j_b-1)-1
           dTSS((j_b-2)*y+i_d,c_b(j_b-1))=i_C((j_b-2)*y+i_d,i_h(j_b-1,i_i))-i_C((j_b-2)*y+i_d,i_h(j_b-1,i_i)-1);
           c_b(j_b-1)=c_b(j_b-1)+1;
        end
        c_b(j_b-1)=1;
        l_b_tmp(j_b-1)=l_b_tmp(j_b-1)+1;
    end
    for i_y=(j_b+2):2:(l_a-1)
        if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
           i_C((i_y-3)*y+i_d,1:(l_b_tmp(i_y-2)+1))=[i_C((i_y-3)*y+i_d,1:l_b_tmp(i_y-2)),i_e(i_b)];
           i_C((i_y-3)*y+i_d,1:(l_b_tmp(i_y-2)+1))=sort(i_C((i_y-3)*y+i_d,1:(l_b_tmp(i_y-2)+1)));
           f=find(i_C((i_y-3)*y+i_d,1:(l_b_tmp(i_y-2)+1))==i_e(i_b));
           temp_1=i_D((i_y-3)*y+i_d,f:l_b_tmp(i_y-2)-1);
           i_D((i_y-3)*y+i_d,f)=i_f(i_b);
           i_D((i_y-3)*y+i_d,1:l_b_tmp(i_y-2))=[i_D((i_y-3)*y+i_d,1:f),temp_1];
           pTSS((i_y-3)*y+i_d,1:l_b_tmp(i_y-2))=i_D((i_y-3)*y+i_d,1:l_b_tmp(i_y-2));
           temp_2=i_E((i_y-3)*y+i_d,f:l_b_tmp(i_y-2)-1);
           i_E((i_y-3)*y+i_d,f)=2;
           i_E((i_y-3)*y+i_d,1:l_b_tmp(i_y-2))=[i_E((i_y-3)*y+i_d,1:f),temp_2];
           tTSS((i_y-3)*y+i_d,1:l_b_tmp(i_y-2))=i_E((i_y-3)*y+i_d,1:l_b_tmp(i_y-2));
           i_h(i_y-2,1:l_b_tmp(i_y-2)-1)=linspace(2,l_b_tmp(i_y-2),l_b_tmp(i_y-2)-1);
           for i_i=1:l_b_tmp(i_y-2)-1
               dTSS((i_y-3)*y+i_d,c_b(i_y-2))=i_C((i_y-3)*y+i_d,i_h(i_y-2,i_i))-i_C((i_y-3)*y+i_d,i_h(i_y-2,i_i)-1);
               c_b(i_y-2)=c_b(i_y-2)+1;
           end
           c_b(i_y-2)=1;
           l_b_tmp(i_y-2)=l_b_tmp(i_y-2)+1;
        end
    end
    for i_y=(j_b+3):2:(l_a-1)
       if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
           i_C((i_y-3)*y+i_d,1:(l_b_tmp(i_y-2)+1))=[i_C((i_y-3)*y+i_d,1:l_b_tmp(i_y-2)),i_e(i_b)];
           i_C((i_y-3)*y+i_d,1:(l_b_tmp(i_y-2)+1))=sort(i_C((i_y-3)*y+i_d,1:(l_b_tmp(i_y-2)+1)));
           f=find(sort(i_C((i_y-3)*y+i_d,1:(l_b_tmp(i_y-2)+1)),'descend')==i_e(i_b));
           temp_1=i_D((i_y-3)*y+i_d,f:l_b_tmp(i_y-2)-1);
           i_D((i_y-3)*y+i_d,f)=i_f(i_b);
           i_D((i_y-3)*y+i_d,1:l_b_tmp(i_y-2))=[i_D((i_y-3)*y+i_d,1:f),temp_1];
           pTSS((i_y-3)*y+i_d,1:l_b_tmp(i_y-2))=i_D((i_y-3)*y+i_d,1:l_b_tmp(i_y-2));
           temp_2=i_E((i_y-3)*y+i_d,f:l_b_tmp(i_y-2)-1);
           i_E((i_y-3)*y+i_d,f)=2;
           i_E((i_y-3)*y+i_d,1:l_b_tmp(i_y-2))=[i_E((i_y-3)*y+i_d,1:f),temp_2];
           tTSS((i_y-3)*y+i_d,1:l_b_tmp(i_y-2))=i_E((i_y-3)*y+i_d,1:l_b_tmp(i_y-2));
           i_h(i_y-2,1:l_b_tmp(i_y-2)-1)=linspace(l_b_tmp(i_y-2)+1,3,l_b_tmp(i_y-2)-1);
           for i_i=1:l_b_tmp(i_y-2)-1
               dTSS((i_y-3)*y+i_d,c_b(i_y-2))=i_C((i_y-3)*y+i_d,i_h(i_y-2,i_i))-i_C((i_y-3)*y+i_d,i_h(i_y-2,i_i)-1);
               c_b(i_y-2)=c_b(i_y-2)+1;
           end
           c_b(i_y-2)=1;
           l_b_tmp(i_y-2)=l_b_tmp(i_y-2)+1;
       end
    end
 end
  end
end
toc
