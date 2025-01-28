function send_email_notification(i_section)
    % Ensure that the section number is a string
    section_number = num2str(i_section);  % Convert the section number to a string
    
    % Verify section_number value
    disp(['Section number passed as string: ', section_number]);
    
    % Prepare the command with the section number
    cmd = sprintf('python send_email.py %s', section_number);
    
    % Print the command for debugging
    disp(['Running command: ', cmd]);

    % Execute the command
    status = system(cmd);
    
    if status == 0
        fprintf('Email sent successfully.\n');
    else
        fprintf('Failed to send email.\n');
    end
end
