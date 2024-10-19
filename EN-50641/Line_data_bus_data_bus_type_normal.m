% clear;
% clc;
% close all
% tic

initialization;

% i_A=-10*ones(l_a-1,10);
i_A=-10*ones(1,10);
i_A_F_A=-10*ones(1,10);
% i_B=zeros(l_a-1,10);
i_B=zeros(1,10);
i_B_F_A=zeros(1,10);
% i_h=zeros(l_a-1,10);
i_h=zeros(1,10);
i_h_F_A=zeros(1,10);

%line data matrix initialization
% dTSS=zeros((l_a-1)*y,15);
dTSS=zeros(y_whole,15);   % distance (km) between the buses (or) line length (km)
dTSS_F_A=zeros(y_whole,15);

%bus data matrix initialization
% pTSS=-100*ones((l_a-1)*y,15);
pTSS=-100*ones(y_whole,15);  % power (MW) of buses
pTSS_F_A=-100*ones(y_whole,15);

%bus type matrix initialization
 %TSS= bus type 1,  Train= bus type 2, AT= bus type 3
% tTSS=zeros((l_a-1)*y,15);
tTSS=zeros(y_whole,15);
tTSS_F_A=zeros(y_whole,15);

% for i_j=1:(l_a-1)
%     b=[d(i_j),AT(AT>d(i_j) & AT<d(i_j+1)),d(i_j+1)];   %distance of TSS,ATs and SP of each winding
%     i_A(i_j,1:length(b))=b;
% end
b=[d(1),AT(AT>d(1) & AT<d(2)),d(2)];   %distance of TSS,ATs and SP of each winding
i_A(1,1:length(b))=b;

b_F_A=[d(1),AT(AT>d(1) & AT<d(2)),d(2)];   %distance of TSS,ATs and SP of each winding
i_A_F_A(1,1:length(b_F_A))=b_F_A;

% for i_k=1:(l_a-1)
%     i_l=i_A(i_k,:);
%     i_l=i_l(i_l>=0);
%     l_b(i_k)=length(i_l);
% end
i_l=i_A(1,:);
i_l=i_l(i_l>=0);
l_b=length(i_l);

i_l=i_A_F_A(1,:);
i_l=i_l(i_l>=0);
l_b_F_A=length(i_l);
% for i_m=1:2:(l_a-1)
% i_B(i_m,1:(l_b(i_m)-2))=linspace(l_b(i_m),3,l_b(i_m)-2);  % left side windings
% end

% for i_n=2:2:(l_a-1)
% i_B(i_n,1:(l_b(i_n)-2))=linspace(2,l_b(i_n)-1,l_b(i_n)-2);  % right side windings
% end
i_B(1,1:(l_b-2))=linspace(2,l_b-1,l_b-2);  % right side windings
i_B_F_A(1,1:(l_b_F_A-2))=linspace(2,l_b_F_A-1,l_b_F_A-2);

% for i_s=1:(l_a-1)
%     i_t=i_B(i_s,:);
%     i_t=i_t(i_t>0);
%     l_c(i_s)=length(i_t);
% end
i_t=i_B(1,:);
i_t=i_t(i_t>0);
l_c=length(i_t);

i_t=i_B_F_A(1,:);
i_t=i_t(i_t>0);
l_c_F_A=length(i_t);

%Line data matrix initialization
 % i_C=zeros((l_a-1)*y,10); 
 i_C=zeros(y_whole,10);
 i_C_F_A=zeros(y_whole,10);

%bus data matrix initialization
 % i_D=zeros((l_a-1)*y,10);
 i_D=zeros(y_whole,10);
 i_D_F_A=zeros(y_whole,10);

 %bus type matrix initialization
 %TSS= bus type 1
 %AT= bus type 3
 %Train= bus type 2
 % i_E=[ones((l_a-1)*y,1),3*ones((l_a-1)*y,9)];
 i_E=[ones(y_whole,1),3*ones(y_whole,9)];
 i_E_F_A=[ones(y_whole,1),3*ones(y_whole,9)];

for i_d=1:y_whole 
    i_e=distance(i_d,2:end);
    i_e=i_e(i_e>0); 
    i_f=power(i_d,2:end);
    i_f=i_f(i_f~=-100);
    % c_a=ones(1,l_a-1);
    c_a=ones(1,1);
    % c_b=ones(1,l_a-1);
    c_b=ones(1,1);

% for i_q=0:(l_a-2)
%     pTSS(i_q*y+i_d,1:(l_b(i_q+1)-1))=zeros(1,(l_b(i_q+1)-1));
% end
pTSS(i_d,1:(l_b-1))=zeros(1,(l_b-1));

% for i_r=0:(l_a-2)
%     tTSS(i_r*y+i_d,1:(l_b(i_r+1)-1))=[1,3*ones(1,(l_b(i_r+1)-2))];
% end
tTSS(i_d,1:(l_b-1))=[1,3*ones(1,(l_b-2))];

  % for i_u=0:2:(l_a-2)
  %     for i_v=1:l_c(i_u+1)
  %         dTSS(i_u*y+i_d,c_a(i_u+1))=i_A(i_u+1,i_B(i_u+1,i_v))-i_A(i_u+1,i_B(i_u+1,i_v)-1);
  %         c_a(i_u+1)=c_a(i_u+1)+1;
  %     end
  % end

 % for i_w=1:2:(l_a-2)
 %      for i_x=1:l_c(i_w+1)
 %          dTSS(i_w*y+i_d,c_a(i_w+1))=i_A(i_w+1,i_B(i_w+1,i_x))-i_A(i_w+1,i_B(i_w+1,i_x)-1);
 %          c_a(i_w+1)=c_a(i_w+1)+1;
 %      end
 %  end
  for i_x=1:l_c
      dTSS(i_d,c_a)=i_A(1,i_B(1,i_x))-i_A(1,i_B(1,i_x)-1);
      c_a=c_a+1;
  end

% for i_o=0:(l_a-2)
%     i_p=i_A(i_o+1,:);
%     i_p=i_p(i_p>=0);
%     i_C(i_o*y+i_d,1:l_b(i_o+1))=i_p;
% end
i_p=i_A(1,:);
i_p=i_p(i_p>=0);
i_C(i_d,1:l_b)=i_p;

l_b_tmp=l_b;

for i_b=1:length(i_e)
    % for i_y=1:2:(l_a-1)
       % if (i_e(i_b)>d(i_y) && i_e(i_b)<=d(i_y+1))
       %     i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))=[i_C((i_y-1)*y+i_d,1:l_b_tmp(i_y)),i_e(i_b)];
       %     i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1))=sort(i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1)));
       %     f=find(sort(i_C((i_y-1)*y+i_d,1:(l_b_tmp(i_y)+1)),'descend')==i_e(i_b));
       %     temp_1=i_D((i_y-1)*y+i_d,f:l_b_tmp(i_y)-1);
       %     i_D((i_y-1)*y+i_d,f)=i_f(i_b);
       %     i_D((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_D((i_y-1)*y+i_d,1:f),temp_1];
       %     pTSS((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_D((i_y-1)*y+i_d,1:l_b_tmp(i_y));
       %     temp_2=i_E((i_y-1)*y+i_d,f:l_b_tmp(i_y)-1);
       %     i_E((i_y-1)*y+i_d,f)=2;
       %     i_E((i_y-1)*y+i_d,1:l_b_tmp(i_y))=[i_E((i_y-1)*y+i_d,1:f),temp_2];
       %     tTSS((i_y-1)*y+i_d,1:l_b_tmp(i_y))=i_E((i_y-1)*y+i_d,1:l_b_tmp(i_y));
       %     i_h(i_y,1:l_b_tmp(i_y)-1)=linspace(l_b_tmp(i_y)+1,3,l_b_tmp(i_y)-1);
       %     for i_i_1=1:l_b_tmp(i_y)-1
       %         dTSS((i_y-1)*y+i_d,c_b(i_y))=i_C((i_y-1)*y+i_d,i_h(i_y,i_i_1))-i_C((i_y-1)*y+i_d,i_h(i_y,i_i_1)-1);
       %         c_b(i_y)=c_b(i_y)+1;
       %     end
       %     c_b(i_y)=1;
       %     l_b_tmp(i_y)=l_b_tmp(i_y)+1;
       % elseif (i_e(i_b)>d(i_y+1) && i_e(i_b)<=d(i_y+2))
           i_C(i_d,1:(l_b_tmp+1))=[i_C(i_d,1:l_b_tmp),i_e(i_b)];
           i_C(i_d,1:(l_b_tmp+1))=sort(i_C(i_d,1:(l_b_tmp+1)));
           f=find(i_C(i_d,1:(l_b_tmp+1))==i_e(i_b));
           temp_3=i_D(i_d,f:l_b_tmp-1);
           i_D(i_d,f)=i_f(i_b);
           i_D(i_d,1:l_b_tmp)=[i_D(i_d,1:f),temp_3];
           pTSS(i_d,1:l_b_tmp)=i_D(i_d,1:l_b_tmp);
           temp_4=i_E(i_d,f:l_b_tmp-1);
           i_E(i_d,f)=2;
           i_E(i_d,1:l_b_tmp)=[i_E(i_d,1:f),temp_4];
           tTSS(i_d,1:l_b_tmp)=i_E(i_d,1:l_b_tmp);
           i_h(1,1:l_b_tmp-1)=linspace(2,l_b_tmp,l_b_tmp-1);
           for i_i_2=1:l_b_tmp-1
               dTSS(i_d,c_b)=i_C(i_d,i_h(1,i_i_2))-i_C(i_d,i_h(1,i_i_2)-1);
               c_b=c_b+1;
           end
           c_b=1;
           l_b_tmp=l_b_tmp+1;
       % end
    % end
end
end

for i_d=1:y_whole
    i_e=distance_F_A(i_d,2:end);
    i_e=i_e(i_e>0); 
    i_f=power_F_A(i_d,2:end);
    i_f=i_f(i_f~=-100);
    % c_a=ones(1,l_a-1);
    c_a=ones(1,1);
    % c_b=ones(1,l_a-1);
    c_b=ones(1,1);

% for i_q=0:(l_a-2)
%     pTSS(i_q*y+i_d,1:(l_b(i_q+1)-1))=zeros(1,(l_b(i_q+1)-1));
% end
pTSS_F_A(i_d,1:(l_b_F_A-1))=zeros(1,(l_b_F_A-1));

% for i_r=0:(l_a-2)
%     tTSS(i_r*y+i_d,1:(l_b(i_r+1)-1))=[1,3*ones(1,(l_b(i_r+1)-2))];
% end
tTSS_F_A(i_d,1:(l_b_F_A-1))=[1,3*ones(1,(l_b_F_A-2))];

  % for i_u=0:2:(l_a-2)
  %     for i_v=1:l_c(i_u+1)
  %         dTSS(i_u*y+i_d,c_a(i_u+1))=i_A(i_u+1,i_B(i_u+1,i_v))-i_A(i_u+1,i_B(i_u+1,i_v)-1);
  %         c_a(i_u+1)=c_a(i_u+1)+1;
  %     end
  % end

 % for i_w=1:2:(l_a-2)
 %      for i_x=1:l_c(i_w+1)
 %          dTSS(i_w*y+i_d,c_a(i_w+1))=i_A(i_w+1,i_B(i_w+1,i_x))-i_A(i_w+1,i_B(i_w+1,i_x)-1);
 %          c_a(i_w+1)=c_a(i_w+1)+1;
 %      end
 %  end
  for i_x=1:l_c_F_A
      dTSS_F_A(i_d,c_a)=i_A_F_A(1,i_B_F_A(1,i_x))-i_A_F_A(1,i_B_F_A(1,i_x)-1);
      c_a=c_a+1;
  end

% for i_o=0:(l_a-2)
%     i_p=i_A(i_o+1,:);
%     i_p=i_p(i_p>=0);
%     i_C(i_o*y+i_d,1:l_b(i_o+1))=i_p;
% end
i_p=i_A_F_A(1,:);
i_p=i_p(i_p>=0);
i_C_F_A(i_d,1:l_b_F_A)=i_p;

l_b_tmp=l_b_F_A;

for i_b=1:length(i_e)
           i_C_F_A(i_d,1:(l_b_tmp+1))=[i_C_F_A(i_d,1:l_b_tmp),i_e(i_b)];
           i_C_F_A(i_d,1:(l_b_tmp+1))=sort(i_C_F_A(i_d,1:(l_b_tmp+1)));
           f=find(i_C_F_A(i_d,1:(l_b_tmp+1))==i_e(i_b));
           temp_3=i_D_F_A(i_d,f:l_b_tmp-1);
           i_D_F_A(i_d,f)=i_f(i_b);
           i_D_F_A(i_d,1:l_b_tmp)=[i_D_F_A(i_d,1:f),temp_3];
           pTSS_F_A(i_d,1:l_b_tmp)=i_D_F_A(i_d,1:l_b_tmp);
           temp_4=i_E_F_A(i_d,f:l_b_tmp-1);
           i_E_F_A(i_d,f)=2;
           i_E_F_A(i_d,1:l_b_tmp)=[i_E_F_A(i_d,1:f),temp_4];
           tTSS_F_A(i_d,1:l_b_tmp)=i_E_F_A(i_d,1:l_b_tmp);
           i_h_F_A(1,1:l_b_tmp-1)=linspace(2,l_b_tmp,l_b_tmp-1);
           for i_i_2=1:l_b_tmp-1
               dTSS_F_A(i_d,c_b)=i_C_F_A(i_d,i_h_F_A(1,i_i_2))-i_C_F_A(i_d,i_h_F_A(1,i_i_2)-1);
               c_b=c_b+1;
           end
           c_b=1;
           l_b_tmp=l_b_tmp+1;
end
end
% toc




   
