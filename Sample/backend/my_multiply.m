function my_multiply(a, b)
    my_add; % Call my_add function
    yy = evalin('base', 'yy'); 
    y = yy * b;         % Perform multiplication
    disp(y);           % Display result (optional for debugging)
end