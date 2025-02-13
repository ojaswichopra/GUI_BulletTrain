function send_email_notification()
    % Prepare the command
    cmd = sprintf('python send_email.py');

    % Execute the command
    status = system(cmd);
    if status == 0
        fprintf('Email sent successfully.');
    else
        fprintf('Failed to send email.');
    end
end
