s_k= [4,5]; % enter the node numbers to be reduce
s=sort(s_k,'ascend');
n_r= length(s);
n2=length(Z);
M= Z(s,s);
k=1;
for j=1:1:n2
    if j~=s
        a(k)=j;
        k=k+1;
    end
end
L=Z(a,s);
K=Z(a,a);
Z=K-(L*(inv(M))*transpose(L));


