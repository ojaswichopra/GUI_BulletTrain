%
g_print = 100;      % for printing the result during run-time
num_gen = 5000;        % number of generation
toler = 0.1;        % tolerance for convergence
toler_ga = 0.7;      % tolerance for GA convergence
no_of_pop = 50;         % population size

% used for mutation
global_err = 999.0;
r_count = 0;

gen_count = 0;
gen_count_temp = 0;
g_count = 0;
tot_err = 1.0;