function final_compile(number_of_sections)

    % Format specification and array size
    formatspec = '%g %g %g %g %g %g';
    sizeA = [6 Inf];

    % Initialize combined dataset
    all_stop = [];

    % Loop through all section pairs
    for i_section = 1:number_of_sections
        % Generate filenames dynamically
        filename = sprintf('train_timetable_%d.txt', i_section);
        disp(filename)
        % Open the file
        fid = fopen(filename, 'r');

        % Read data
        arr = fscanf(fid, formatspec, sizeA)';
        
        % Close the file
        fclose(fid);

        % Append data to the combined dataset
        if isempty(all_stop)
            % First file: directly append all data
            all_stop = arr;
        else
            % For subsequent files, append with time adjustment
            s1 = size(all_stop, 1);
            x1 = all_stop(s1, 1); % Last time value of previous file
            s2 = size(arr, 1);

            for kk = 2:s2
                all_stop(s1 + kk - 1, 1) = x1 + arr(kk, 1);
                all_stop(s1 + kk - 1, 2:6) = arr(kk, 2:6);
            end
        end
    end

    % Write the combined dataset to a file
    output_filename = 'All_Stop.txt';
    fid = fopen(output_filename, 'w');
    xx = size(all_stop, 1);

    for ii = 1:xx
        fprintf(fid, '%5d %10.5f %10.5f %10.5f %10.5f %10.5f\n', ...
            all_stop(ii, 1), all_stop(ii, 2), ...
            all_stop(ii, 3), all_stop(ii, 4), ...
            all_stop(ii, 5), all_stop(ii, 6));
    end

    % Close the output file
    fclose(fid);

    % Plotting (if required)
    % plot_all;
end