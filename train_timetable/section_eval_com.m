
% Population evaluation Mumbai_thane

% initialise
train_prof = zeros(dura+1,5);
t0(1) = 0;                % initial time
v0(1) = 0;                % initial velocity
s0(1) = station_distances(i_section)*1000;                % initial position
init_count = 1;
train_prof(init_count,1) = t0(1);
train_prof(init_count,2) = v0(1);
train_prof(init_count,3) = s0(1)/1000;
train_prof(init_count,4) = 0;    % power
train_prof(init_count,5) = 0;    % accln/decln

% evaluate
for st_i=1:time_var+1
    if st_i==1
        st_t(st_i)=t0(st_i);
    else
        st_t(st_i)= st_t(st_i-1) +tt(st_i-1);
    end
end

for st_i=1:time_var
    if mode_matrix(st_i) == 1
        % Code for when mode_matrix(st_i) == 1 acceleration
        [s0(st_i+1),v0(st_i+1)] = accelerate(v0(st_i),s0(st_i),st_t(st_i),tt(st_i),a,b,c,M,g,delt,init_count,eff,start_km,end_km,gradients);
        init_count = init_count + tt(st_i);
        
    elseif mode_matrix(st_i) == 2
        % Code for when mode_matrix(st_i) == 2 crusing
        [s0(st_i+1),v0(st_i+1)] = const_speed(v0(st_i),s0(st_i),st_t(st_i),tt(st_i),a,b,c,M,g,delt,init_count,eff,start_km,end_km,gradients);
        init_count = init_count + tt(st_i);
        
    elseif mode_matrix(st_i) == 3
        % Code for when mode_matrix(st_i) == 3 costing
        [s0(st_i+1),v0(st_i+1)] = coasting(v0(st_i),s0(st_i),st_t(st_i),tt(st_i),a,b,c,M,g,delt,init_count,m_decl,start_km,end_km,gradients);
        init_count = init_count + tt(st_i);
        
    elseif mode_matrix(st_i) == 4
        % Code for when mode_matrix(st_i) == 4 braking
        index_brak= find(braking_index==st_i);
        [s0(st_i+1),v0(st_i+1)] = decelerate(v0(st_i),s0(st_i),st_t(st_i),tt(st_i),a,b,c,M,g,delt,init_count,f_bk(index_brak),m_decl,eff,start_km,end_km,gradients);
        init_count = init_count + tt(st_i);
       
    end

end
% st_t
% 
% st_t1 = t0;
% [s1,v1] = accelerate(v0,s0,st_t1,t1,a,b,c,M,g,delt,init_count,eff);
% init_count = init_count + t1;
% 
% st_t2 = st_t1+t1;
% [s2,v2] = const_speed(v1,s1,st_t2,t2,a,b,c,M,g,delt,init_count,eff);
% init_count = init_count + t2;
% 
% st_t3 = st_t2+t2;
% [s3,v3] = coasting(v2,s2,st_t3,t3,a,b,c,M,g,delt,init_count,m_decl);
% init_count = init_count + t3;
% 
% st_t4 = st_t3+t3;
% [s4,v4] = decelerate(v3,s3,st_t4,t4,a,b,c,M,g,delt,init_count,F4,m_decl,eff);
% init_count = init_count + t4;
% 
% st_t5 = st_t4+t4;
% [s5,v5] = decelerate(v4,s4,st_t5,t5,a,b,c,M,g,delt,init_count,F5,m_decl,eff);
% init_count = init_count + t5;
% 
% st_t6 = st_t5+t5;
% [s6,v6] = decelerate(v5,s5,st_t6,t6,a,b,c,M,g,delt,init_count,F6,m_decl,eff);
% init_count = init_count + t6;