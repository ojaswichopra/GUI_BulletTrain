%
% GA selection
num_choice = 5;
for ixx = 1:no_of_pop
    rnd = rand(num_choice,1);
    temp_pop = zeros(num_choice,pop_size_col);
    for ik = 1:num_choice
        rnd1 = round(1+(no_of_pop-1)*rnd(ik,1));
        temp_pop(ik,:) = pop(rnd1,:);
    end
    temp_vec = temp_pop(:,pop_size_col);       
    min_tmp = min(temp_vec);
    min_tmp_ind = find(temp_vec == min_tmp);
    par_pop(ixx,:) = temp_pop(min_tmp_ind(1),:);
end

% GA crossover
chi_pop = zeros(no_of_pop,num_of_var);
for ik = 1:no_of_pop/2
    r1 = round(1+(time_var-1)*rand(1));   % for time durations
    r2 = round((time_var+1)+(num_of_var-(time_var+1))*rand(1));   % for braking forces
    P1 = par_pop(2*ik-1,1:num_of_var);
    P2 = par_pop(2*ik,1:num_of_var);
    chi_pop(2*ik-1,1:r1) = P1(1:r1);                       chi_pop(2*ik-1,r1+1:time_var) = P2(r1+1:time_var);
    chi_pop(2*ik-1,time_var+1:r2) = P1((time_var+1):r2);   chi_pop(2*ik-1,r2+1:num_of_var) = P2(r2+1:num_of_var);
    chi_pop(2*ik,1:r1) = P2(1:r1);                         chi_pop(2*ik,r1+1:time_var) = P1(r1+1:time_var);
    chi_pop(2*ik,(time_var+1):r2) = P2((time_var+1):r2);   chi_pop(2*ik,r2+1:num_of_var) = P1(r2+1:num_of_var);
end

% GA mutation
mut_prob = 0.1;
if (r_count >= 5)       % mutation is triggered
    for ijj = 1:no_of_pop
        m_rnd_1 = rand(1);
        if (m_rnd_1 > mut_prob)
            m_rand_2 = round(1+(num_of_var-1)*rand(1));  
            m_rand_3 = rand(1);
            if (m_rand_3 > 0.5)
                chi_pop(ijj,m_rand_2) = chi_pop(ijj,m_rand_2)*(1+0.1*rand(1));
            else
                chi_pop(ijj,m_rand_2) = chi_pop(ijj,m_rand_2)*(1-0.1*rand(1));
            end
            if (m_rand_2 <= time_var) 
                chi_pop(ijj,m_rand_2) = round(chi_pop(ijj,m_rand_2));  % time periods should be integer
            end
        end
    end
end

% update population
pop_old = pop;
pop = zeros(no_of_pop,pop_size_col);
pop(:,1:num_of_var) = chi_pop(:,1:num_of_var);