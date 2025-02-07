function gra = track_grad_forward(s,start_km,end_km,gradients)
    % % Persistent data to load the Excel file only once
    % % persistent gradientData;
    % % 
    % % Check if data is already loaded
    % % if isempty(gradientData)
    % %     Load the Excel file once
    % %     gradientData = readtable('gradient_data.xlsx'); % Ensure the file is in the same directory
    % % end
    
    % Convert distance to kilometers
    s = s / 1000;
    start_km=start_km;
    end_km=end_km;
    gradients=gradients;
    % Extract start, end, and gradient values
    % start_km = gradientData.start_distance;
    % end_km = gradientData.end_distance;
    % gradients = gradientData.gradient;
    
    % Initialize the gradient
    gra = 0;
    
    % Determine the gradient for the given distance
    for i = 1:length(gradients)
        if s >= start_km(i) && s < end_km(i)
            gra = gradients(i) / 1000; % Convert to per meter
            return; % Exit once the gradient is found
        end
    end
end
