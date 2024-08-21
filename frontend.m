function frontend()
  close all;
fig = figure('Name', 'Various Modules', 'Units', 'pixels', 'Position', centerFigurePosition(1500, 700));
set(gca, 'Visible', 'off');
button= cell(8, 1);
enter=cell(8,1);
a = {
    "Make system data",
    "Prepare train timetable",
    "Execute load flow",
    "Perform short circuit analysis",
    "Caculate induced voltage",
    "Calculate OHE temerature rise",
    "Perform harmonic analysis",
    "See output"
};
screenSize = get(0, 'ScreenSize');
buttonWidth = 300;
buttonHeight = 100;
buttonSpacing = 50;
totalButtons = 8;
figureHeight = (buttonHeight + buttonSpacing) * totalButtons - buttonSpacing;
startX1 = 90;
startX2 = 90;
startY1 = (screenSize(4) - 50) / 2;
startY2 = (screenSize(4) - 50) / 2;
for i = 1:totalButtons
  if i<=4  button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX1, startY1-50, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback(source, event, i),'BackgroundColor', [0.4, 0.56, 0.72],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX1=startX1+350;
  else
    button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX2, startY2-400, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback(source, event, i),'BackgroundColor', [0.4, 0.56, 0.72],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX2=startX2+350;
end
end
end

function buttonCallback(source, event, buttonIndex)

    switch buttonIndex
        case 1
            make_system_data(source, event);
        case 2
            prepare_train_timetable(source, event);
        case 3
            execute_load_flow(source, event);
        case 4
            Perform_short_circuit_analysis(source, event);
        case 5
            Caculate_induced_voltage(source, event);
        case 6
            Calculate_OHE_temerature_rise(source, event);
        case 7
            perform_harmonic_analysis(source, event);
        case 8
            see_output(source, event);

    end
end
function Perform_short_circuit_analysis(source,event)
fig = figure('Name', 'Choose track', 'Units', 'pixels', 'Position', centerFigurePosition(1500, 700));
set(gca, 'Visible', 'off');
button= cell(4, 1);
enter=cell(4,1);
a = {
    "Mumbai Sabarmati Track with Each Stop Train",
    "Mumbai Sabarmati Track with Rapid Train",
    "Sabarmati Mumbai Track with Each Stop Train",
    "Sabarmati Mumbai Track with Rapid Train",
};
screenSize = get(0, 'ScreenSize');
buttonWidth = 500;
buttonHeight = 100;
buttonSpacing = 50;
totalButtons = 4;
figureHeight = (buttonHeight + buttonSpacing) * totalButtons - buttonSpacing;
startX1 = 90;
startX2 = 90;
startY1 = (screenSize(4) - 50) / 2;
startY2 = (screenSize(4) - 50) / 2;
for i = 1:totalButtons
  if i<=2  button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX1, startY1-50, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback9(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX1=startX1+650;
  else
    button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX2, startY2-400, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback9(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX2=startX2+650;
end
end
end
function buttonCallback9(source, event, buttonIndex)

    switch buttonIndex
        case 1
           Perform_short_circuit_analysis_track1(source, event);
        case 2
            Perform_short_circuit_analysis_track2(source, event);
        case 3
           Perform_short_circuit_analysis_track3(source, event);
        case 4
            Perform_short_circuit_analysis_track4(source, event);

    end
end
function Caculate_induced_voltage(source,event)
fig = figure('Name', 'Choose track', 'Units', 'pixels', 'Position', centerFigurePosition(1500, 700));
set(gca, 'Visible', 'off');
button= cell(4, 1);
enter=cell(4,1);
a = {
    "Mumbai Sabarmati Track with Each Stop Train",
    "Mumbai Sabarmati Track with Rapid Train",
    "Sabarmati Mumbai Track with Each Stop Train",
    "Sabarmati Mumbai Track with Rapid Train",
};
screenSize = get(0, 'ScreenSize');
buttonWidth = 500;
buttonHeight = 100;
buttonSpacing = 50;
totalButtons = 4;
figureHeight = (buttonHeight + buttonSpacing) * totalButtons - buttonSpacing;
startX1 = 90;
startX2 = 90;
startY1 = (screenSize(4) - 50) / 2;
startY2 = (screenSize(4) - 50) / 2;
for i = 1:totalButtons
  if i<=2  button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX1, startY1-50, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback10(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX1=startX1+650;
  else
    button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX2, startY2-400, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback10(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX2=startX2+650;
end
end
end
function buttonCallback10(source, event, buttonIndex)

    switch buttonIndex
        case 1
           Caculate_induced_voltage_track1(source, event);
        case 2
            Caculate_induced_voltage_track2(source, event);
        case 3
           Caculate_induced_voltage_track3(source, event);
        case 4
            Caculate_induced_voltage_track4(source, event);

    end
end
function Calculate_OHE_temerature_rise(source,event)
fig = figure('Name', 'Choose track', 'Units', 'pixels', 'Position', centerFigurePosition(1500, 700));
set(gca, 'Visible', 'off');
button= cell(4, 1);
enter=cell(4,1);
a = {
    "Mumbai Sabarmati Track with Each Stop Train",
    "Mumbai Sabarmati Track with Rapid Train",
    "Sabarmati Mumbai Track with Each Stop Train",
    "Sabarmati Mumbai Track with Rapid Train",
};
screenSize = get(0, 'ScreenSize');
buttonWidth = 500;
buttonHeight = 100;
buttonSpacing = 50;
totalButtons = 4;
figureHeight = (buttonHeight + buttonSpacing) * totalButtons - buttonSpacing;
startX1 = 90;
startX2 = 90;
startY1 = (screenSize(4) - 50) / 2;
startY2 = (screenSize(4) - 50) / 2;
for i = 1:totalButtons
  if i<=2  button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX1, startY1-50, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback11(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX1=startX1+650;
  else
    button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX2, startY2-400, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback11(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX2=startX2+650;
end
end
end
function buttonCallback11(source, event, buttonIndex)

    switch buttonIndex
        case 1
           Calculate_OHE_temerature_rise_track1(source, event);
        case 2
            Calculate_OHE_temerature_rise_track2(source, event);
        case 3
           Calculate_OHE_temerature_rise_track3(source, event);
        case 4
            Calculate_OHE_temerature_rise_track4(source, event);

    end
end
function perform_harmonic_analysis(source,event)
fig = figure('Name', 'Choose track', 'Units', 'pixels', 'Position', centerFigurePosition(1500, 700));
set(gca, 'Visible', 'off');
button= cell(4, 1);
enter=cell(4,1);
a = {
    "Mumbai Sabarmati Track with Each Stop Train",
    "Mumbai Sabarmati Track with Rapid Train",
    "Sabarmati Mumbai Track with Each Stop Train",
    "Sabarmati Mumbai Track with Rapid Train",
};
screenSize = get(0, 'ScreenSize');
buttonWidth = 500;
buttonHeight = 100;
buttonSpacing = 50;
totalButtons = 4;
figureHeight = (buttonHeight + buttonSpacing) * totalButtons - buttonSpacing;
startX1 = 90;
startX2 = 90;
startY1 = (screenSize(4) - 50) / 2;
startY2 = (screenSize(4) - 50) / 2;
for i = 1:totalButtons
  if i<=2  button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX1, startY1-50, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback12(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX1=startX1+650;
  else
    button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX2, startY2-400, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback12(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX2=startX2+650;
end
end
end
function buttonCallback12(source, event, buttonIndex)

    switch buttonIndex
        case 1
           perform_harmonic_analysis_track1(source, event);
        case 2
            perform_harmonic_analysis_track2(source, event);
        case 3
           perform_harmonic_analysis_track3(source, event);
        case 4
            perform_harmonic_analysis_track4(source, event);

    end
end

function execute_load_flow(source,event)
fig = figure('Name', 'Choose track', 'Units', 'pixels', 'Position', centerFigurePosition(1500, 700));
set(gca, 'Visible', 'off');
button= cell(4, 1);
enter=cell(4,1);
a = {
    "Mumbai Sabarmati Track with Each Stop Train",
    "Mumbai Sabarmati Track with Rapid Train",
    "Sabarmati Mumbai Track with Each Stop Train",
    "Sabarmati Mumbai Track with Rapid Train",
    "EN-50641 Standard Test Case"
};
screenSize = get(0, 'ScreenSize');
buttonWidth = 500;
buttonHeight = 100;
buttonSpacing = 50;
totalButtons = 4;
figureHeight = (buttonHeight + buttonSpacing) * totalButtons - buttonSpacing;
startX1 = 90;
startX2 = 90;
startY1 = (screenSize(4) - 50) / 2;
startY2 = (screenSize(4) - 50) / 2;
for i = 1:totalButtons
  if i<=2  button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX1, startY1-50, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback3(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX1=startX1+650;
  else
    button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX2, startY2-400, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback3(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX2=startX2+650;
end
end
end
function buttonCallback3(source, event, buttonIndex)
    switch buttonIndex
        case 1
            track = 'track1';
        case 2
            track = 'track2';
        case 3
            track = 'track3';
        case 4
            track = 'track4';
        case 5
            track = 'track5';
    end

    execute_load_flow_track(source, event, track);
end

function execute_load_flow_track(source, event, track)
    fig2 = figure('Name', 'System data', 'Units', 'pixels', 'Position', centerFigurePosition(400, 200));
    set(gca, 'Visible', 'off');
    b2 = uicontrol(fig2, 'Style', 'pushbutton', 'String', 'Upload', 'Units', 'normalized', 'Position', [0.2, 0.4, 0.6, 0.2], 'Callback', {@systemdata, track}, 'BackgroundColor', 'black', 'ForegroundColor', 'white');
    text(0.5, 0.7, 'Upload system data file', 'HorizontalAlignment', 'center', 'FontSize', 16);
end

function systemdata(~, ~, track)
    close(gcf);
    % Open a file dialog to select a file
    [file, path] = uigetfile('.txt');

    % Check if a file was selected
    if ischar(file) && ischar(path)
        % File selection was successful
        fullFilePath = fullfile(path, file);
        systemdata = fileread(fullFilePath);
        fid = fopen(fullFilePath, 'r');
        if fid == -1
            disp('Error opening file');
        else
            lines = {};  % Create a cell array to store lines

            lineIndex = 1;
            while true
                line = fgets(fid);
                if line == -1  % Reached end of file
                    break;
                end

                lines{lineIndex} = line;  % Store line in cell array
                lineIndex = lineIndex + 1;
            end

            fclose(fid);

            % Access each line using the cell array
            j = 1;
            var = {};
            for i = 1:length(lines)
                if ~isnan(str2num(lines{i}))
                    if j == 2 || j == 4
                        var{j} = str2num(lines{i});  % Convert string of numbers to array of integers
                    else
                        var{j} = str2double(lines{i});
                    end
                    j = j + 1;
                end
            end

            % Display the variables and save them
            for k = 1:length(var)
                save('user_input.m', 'var');
            end
        end
    else
        % No file was selected
        disp("No file selected.");
    end
save('user_input.m', 'track','-append');
    fig3 = figure('Name', 'Train timetable data', 'Units', 'pixels', 'Position', centerFigurePosition(400, 200));
    set(gca, 'Visible', 'off');  % Hide the axes
    b3 = uicontrol(fig3, 'Style', 'pushbutton', 'String', 'Upload', 'Units', 'normalized', 'Position', [0.2, 0.4, 0.6, 0.2], 'Callback', {@traindata, track}, 'BackgroundColor', 'black', 'ForegroundColor', 'white');
    text(0.5, 0.7, 'Upload train timetable data file', 'HorizontalAlignment', 'center', 'FontSize', 16);
end
function traindata(~, ~, track)
    close(gcf);
    % Open a file dialog to select a file
    [file, path] = uigetfile('.txt');

    % Check if a file was selected
    if ischar(file) && ischar(path)
        % File selection was successful
        fullFilePath = fullfile(path, file);
        systemdata = fileread(fullFilePath);

        % Specify the destination file path
        destinationFile = ['user_input_train_timetable.txt'];

        % Copy the contents of the uploaded file to the destination file
        copyfile(fullFilePath, destinationFile);
    else
        % No file was selected
        disp("No file selected.");
    end
    prompt = {'Enter the number of trains running per hour','Enter the number of hours of train scheduling per day','Enter the time (in sec) taken by one train to complete the route'};
    dlgtitle = 'Train scheduling information';
    numlines = 1;
    defaultans = {'','',''};
    input_data = inputdlg(prompt, dlgtitle, numlines, defaultans);
    num_trains_str = input_data{1};
    num_trains_val = str2double(num_trains_str);
    num_hrs_train=input_data{2};
    num_hrs_train_val=str2double(num_hrs_train);
    train_time_str=input_data{3};
    train_time_val=str2double(train_time_str);
    save('user_input.m', 'num_trains_val','num_hrs_train_val','train_time_val','-append');
    source('code_run.m');
end

% Function to calculate the centered position for the figure
function position = centerFigurePosition(width, height)
    screenSize = get(0, 'ScreenSize');
    left = (screenSize(3) - width) / 2;
    bottom = (screenSize(4) - height) / 2;
    position = [left, bottom, width, height];
end

function see_output(source,event)
  fig = figure('Name', 'Output', 'Units', 'pixels', 'Position', centerFigurePosition(1200, 600));
set(gca, 'Visible', 'off');
button= cell(5, 1);
enter=cell(8,1);
a = {
    "Output of load flow",
    "Output of short ckt analysis",
    "Output of induced voltage calculation",
    "Output of temp. rise calculation",
    "Output of harmonic analysis",

};
screenSize = get(0, 'ScreenSize');
buttonWidth = 370;
buttonHeight = 100;
buttonSpacing = 30;
totalButtons = 5;
figureHeight = (buttonHeight + buttonSpacing) * totalButtons - buttonSpacing;
startX1 = (700 - 400) / 2;
startX2= (700 - 400) / 2;
startY = ((screenSize(4) - 50) / 2)-100;
c=0;
for i = 1:totalButtons
  if c==2
    c=0;
    startX1 = (700 - 400) / 2;
    startY=startY-200;
    end
    button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX1, startY, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback1(source, event, i),'BackgroundColor', [0, 0.5, 0],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold','FontSize', 12);
    startX1 = startX1 +500;c=c+1;

end
end
function buttonCallback1(source, event, buttonIndex)

    switch buttonIndex
        case 1
            output_of_load_flow(source, event);
        case 2
            output_of_short_ckt_analysis(source, event);
        case 3
            output_of_induced_voltage(source, event);
        case 4
            output_of_ohe(source, event);
        case 5
            output_of_harmonic(source, event);
    end
end
function output_of_load_flow(source,event)
fig = figure('Name', 'Choose track', 'Units', 'pixels', 'Position', centerFigurePosition(1500, 700));
set(gca, 'Visible', 'off');
button= cell(4, 1);
enter=cell(4,1);
a = {
    "Mumbai Sabarmati Track with Each Stop Train",
    "Mumbai Sabarmati Track with Rapid Train",
    "Sabarmati Mumbai Track with Each Stop Train",
    "Sabarmati Mumbai Track with Rapid Train",
};
screenSize = get(0, 'ScreenSize');
buttonWidth = 500;
buttonHeight = 100;
buttonSpacing = 50;
totalButtons = 4;
figureHeight = (buttonHeight + buttonSpacing) * totalButtons - buttonSpacing;
startX1 = 90;
startX2 = 90;
startY1 = (screenSize(4) - 50) / 2;
startY2 = (screenSize(4) - 50) / 2;
for i = 1:totalButtons
  if i<=2  button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX1, startY1-50, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback4(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX1=startX1+650;
  else
    button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX2, startY2-400, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback4(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX2=startX2+650;
end
end
end
function buttonCallback4(source, event, buttonIndex)
 switch buttonIndex
        case 1
            track = 'track1';
        case 2
            track = 'track2';
        case 3
            track = 'track3';
        case 4
            track = 'track4';
    end
    save('user_output.m', 'track');
  output_of_load_flow_track(source, event,track);
end
function output_of_load_flow_track(source,event,track)
  fig = figure('Name', 'Output of Load Flow', 'Units', 'pixels', 'Position', centerFigurePosition(700, 600));
set(gca, 'Visible', 'off');
button= cell(8, 1);
enter=cell(8,1);
a = {
    "Voltage at a particular time instant",
    "Voltage at a particular location",
    "MVA plot of TSS",
    "MVA plot of AT",
    "Maximum MVA of all TSS",
    "Maximum MVA of all AT",
    "Voltage unbalance plot of TSS",
    "Maximum voltage unbalance of all TSS"
};
screenSize = get(0, 'ScreenSize');
buttonWidth = 400;
buttonHeight = 40;
buttonSpacing = 30;
totalButtons = 8;
figureHeight = (buttonHeight + buttonSpacing) * totalButtons - buttonSpacing;
startX = (700 - 400) / 2;
startY = (screenSize(4) - 50) / 2;

for i = 1:totalButtons
    button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX, startY, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback2(source, event, i,track),'BackgroundColor', [.8, .8, 0],'ForegroundColor', [0, 0, 0],'FontWeight', 'bold');
    startY = startY - (buttonHeight + buttonSpacing);

end
end
function buttonCallback2(source, event, buttonIndex,track)

    switch buttonIndex
        case 1
            Voltage_at_a_particular_time_instant(source, event,track);
        case 2
            Voltage_at_a_particular_location(source, event,track);
        case 3
            MVA_plot_of_TSS(source, event,track);
        case 4
            MVA_plot_of_AT(source, event,track);
        case 5
            Maximum_MVA_of_all_TSS(source, event,track);
        case 6
            Maximum_MVA_of_all_AT(source, event,track);
        case 7
            Voltage_unbalance_plot_of_TSS(source, event,track);
        case 8
            Maximum_voltage_unbalance_of_all_TSS(source, event,track);

    end
end
function output_of_short_ckt_analysis(source,event)
fig = figure('Name', 'Choose track', 'Units', 'pixels', 'Position', centerFigurePosition(1500, 700));
set(gca, 'Visible', 'off');
button= cell(4, 1);
enter=cell(4,1);
a = {
    "Mumbai Sabarmati Track with Each Stop Train",
    "Mumbai Sabarmati Track with Rapid Train",
    "Sabarmati Mumbai Track with Each Stop Train",
    "Sabarmati Mumbai Track with Rapid Train",
};
screenSize = get(0, 'ScreenSize');
buttonWidth = 500;
buttonHeight = 100;
buttonSpacing = 50;
totalButtons = 8;
figureHeight = (buttonHeight + buttonSpacing) * totalButtons - buttonSpacing;
startX1 = 90;
startX2 = 90;
startY1 = (screenSize(4) - 50) / 2;
startY2 = (screenSize(4) - 50) / 2;
for i = 1:totalButtons
  if i<=2  button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX1, startY1-50, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback5(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX1=startX1+650;
  else
    button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX2, startY2-400, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback5(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX2=startX2+650;
end
end
end


function buttonCallback5(source, event, buttonIndex)
switch buttonIndex
        case 1
            track = 'track1';
        case 2
            track = 'track2';
        case 3
            track = 'track3';
        case 4
            track = 'track4';
    end
    save('user_output.m', 'track', '-append');
   output_of_short_ckt_analysis_track(source, event,track);
end

function output_of_induced_voltage(source,event)
fig = figure('Name', 'Choose track', 'Units', 'pixels', 'Position', centerFigurePosition(1500, 700));
set(gca, 'Visible', 'off');
button= cell(4, 1);
enter=cell(4,1);
a = {
    "Mumbai Sabarmati Track with Each Stop Train",
    "Mumbai Sabarmati Track with Rapid Train",
    "Sabarmati Mumbai Track with Each Stop Train",
    "Sabarmati Mumbai Track with Rapid Train",
};
screenSize = get(0, 'ScreenSize');
buttonWidth = 500;
buttonHeight = 100;
buttonSpacing = 50;
totalButtons = 4;
figureHeight = (buttonHeight + buttonSpacing) * totalButtons - buttonSpacing;
startX1 = 90;
startX2 = 90;
startY1 = (screenSize(4) - 50) / 2;
startY2 = (screenSize(4) - 50) / 2;
for i = 1:totalButtons
  if i<=2  button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX1, startY1-50, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback6(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX1=startX1+650;
  else
    button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX2, startY2-400, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback6(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX2=startX2+650;
end
end
end
function buttonCallback6(source, event, buttonIndex)

   switch buttonIndex
        case 1
            track = 'track1';
        case 2
            track = 'track2';
        case 3
            track = 'track3';
        case 4
            track = 'track4';
    end
  output_of_induced_voltage_track(source, event,track);
end
function output_of_ohe(source,event)
fig = figure('Name', 'Choose track', 'Units', 'pixels', 'Position', centerFigurePosition(1500, 700));
set(gca, 'Visible', 'off');
button= cell(4, 1);
enter=cell(4,1);
a = {
    "Mumbai Sabarmati Track with Each Stop Train",
    "Mumbai Sabarmati Track with Rapid Train",
    "Sabarmati Mumbai Track with Each Stop Train",
    "Sabarmati Mumbai Track with Rapid Train",
};
screenSize = get(0, 'ScreenSize');
buttonWidth = 500;
buttonHeight = 100;
buttonSpacing = 50;
totalButtons = 4;
figureHeight = (buttonHeight + buttonSpacing) * totalButtons - buttonSpacing;
startX1 = 90;
startX2 = 90;
startY1 = (screenSize(4) - 50) / 2;
startY2 = (screenSize(4) - 50) / 2;
for i = 1:totalButtons
  if i<=2  button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX1, startY1-50, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback7(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX1=startX1+650;
  else
    button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX2, startY2-400, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback7(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX2=startX2+650;
end
end
end
function buttonCallback7(source, event, buttonIndex)

    switch buttonIndex
        case 1
            track = 'track1';
        case 2
            track = 'track2';
        case 3
            track = 'track3';
        case 4
            track = 'track4';
    end
  output_of_ohe_track(source, event,track);
end
function output_of_harmonic(source,event)
fig = figure('Name', 'Choose track', 'Units', 'pixels', 'Position', centerFigurePosition(1500, 700));
set(gca, 'Visible', 'off');
button= cell(4, 1);
enter=cell(4,1);
a = {
    "Mumbai Sabarmati Track with Each Stop Train",
    "Mumbai Sabarmati Track with Rapid Train",
    "Sabarmati Mumbai Track with Each Stop Train",
    "Sabarmati Mumbai Track with Rapid Train",
};
screenSize = get(0, 'ScreenSize');
buttonWidth = 500;
buttonHeight = 100;
buttonSpacing = 50;
totalButtons = 4;
figureHeight = (buttonHeight + buttonSpacing) * totalButtons - buttonSpacing;
startX1 = 90;
startX2 = 90;
startY1 = (screenSize(4) - 50) / 2;
startY2 = (screenSize(4) - 50) / 2;
for i = 1:totalButtons
  if i<=2  button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX1, startY1-50, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback8(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX1=startX1+650;
  else
    button{i} = uicontrol(fig,'Style', 'pushbutton', 'String', a(i),'Units', 'pixels', 'Position', [startX2, startY2-400, buttonWidth, buttonHeight],'Callback',@(source, event) buttonCallback8(source, event, i),'BackgroundColor', [0.1, 0.5, 0.2],'ForegroundColor', [1, 1, 1],'FontWeight', 'bold', 'FontSize', 12);
    startX2=startX2+650;
end
end
end
function buttonCallback8(source, event, buttonIndex)
switch buttonIndex
        case 1
            track = 'track1';
        case 2
            track = 'track2';
        case 3
            track = 'track3';
        case 4
            track = 'track4';
    end
  output_of_harmonic_track(source, event,track);
end



function Voltage_at_a_particular_time_instant(source, event,track)

    prompt = {'Enter the time instant (in sec) for getting voltage profile along the track ','Enter the distance resolution (in meter)'};
    dlgtitle = 'Voltage at a particular time instant';
    numlines = 1;
    defaultans = {'',''};
    input_data = inputdlg(prompt, dlgtitle, numlines, defaultans);
    time_str = input_data{1};
    time_val = str2double(time_str);
    x_reso= input_data{2};
    x_reso_val= str2double(x_reso);
    save('user_output.m', 'time_val','x_reso_val', '-append');
   show_plot1(time_val,x_reso_val);
end

 function show_plot1(time_val,x_reso_val)
    fig1 = figure('Name', [' Voltage profile for the whole track at a particular time instant i.e. ', num2str(time_val), ' sec'], 'Units', 'pixels', 'Position', [1 80 1920 900]);
    set(gca, 'Visible', 'off');  % Hide the axes

    track_voltage_profile_instant_t_update_full_track;
end


function Voltage_at_a_particular_location(source,event,track)
  prompt = {'Enter the distance (in Km) from starting point for getting voltage profile over entire durations of train scheduling'};
    dlgtitle = 'Voltage at a particular location';
    numlines = 1;
    defaultans = {''};
    input_data = inputdlg(prompt, dlgtitle, numlines, defaultans);
    dist_str = input_data{1};
    dist_val = str2double(dist_str);

    save('user_output.m', 'dist_val', '-append');

   show_plot2(dist_str);
end
function show_plot2(dist_str)
  fig1 = figure('Name', [' Voltage profile over entire durations of train scheduling at ', dist_str, ' Km distance from starting point'], 'Units', 'pixels', 'Position', [1 80 1920 900]);
    set(gca, 'Visible', 'off');  % Hide the axes
voltage_variation_over_day;
end
function MVA_plot_of_TSS(source,event,track)
  prompt = {'Enter the TSS number to see its MVA profile'};
    dlgtitle = 'MVA_plot_of_TSS';
    numlines = 1;
    defaultans = {''};
    input_data = inputdlg(prompt, dlgtitle, numlines, defaultans);
    TSS_input_no_str = input_data{1};
    TSS_input_no_val = str2double(TSS_input_no_str);

    save('user_output.m', 'TSS_input_no_val', '-append');
    show_plot3(TSS_input_no_str);
end
function show_plot3(TSS_input_no_str)
  fig1 = figure('Name', [' MVA profile of TSS number ',TSS_input_no_str], 'Units', 'pixels', 'Position',[1 80 1920 900]);
    set(gca, 'Visible', 'off');  % Hide the axes
TSS_MVA_plot;
end
function MVA_plot_of_AT(source,event,track)
  prompt = {'Enter the AT number to see its MVA profile'};
    dlgtitle = 'MVA_plot_of_AT';
    numlines = 1;
    defaultans = {''};
    input_data = inputdlg(prompt, dlgtitle, numlines, defaultans);
    AT_input_no_str = input_data{1};
    AT_input_no_val = str2double(AT_input_no_str);

    save('user_output.m', 'AT_input_no_val', '-append');
    show_plot4(AT_input_no_str);
end
function show_plot4(AT_input_no_str)
  fig1 = figure('Name', [' MVA profile of AT number ',AT_input_no_str], 'Units', 'pixels', 'Position', [1 80 1920 900]);
    set(gca, 'Visible', 'off');  % Hide the axes
AT_MVA_plot;
end

function Maximum_MVA_of_all_TSS(source,event,track)
TSS_maximum_MVA;
end

function Maximum_MVA_of_all_AT(source,event,track)
AT_maximum_MVA;
end
function Voltage_unbalance_plot_of_TSS(source,event,track)
  prompt = {'Enter the TSS number to see its voltage unbalance profile'};
    dlgtitle = 'voltage_unbalance_plot_of_TSS';
    numlines = 1;
    defaultans = {''};
    input_data = inputdlg(prompt, dlgtitle, numlines, defaultans);
    TSS_input_no_unbalance_str = input_data{1};
    TSS_input_no_unbalance_val = str2double(TSS_input_no_unbalance_str);

    save('user_output.m', 'TSS_input_no_unbalance_val', '-append');
    show_plot5(TSS_input_no_unbalance_str);
end
function show_plot5(TSS_input_no_unbalance_str)
  fig1 = figure('Name', [' Voltage unbalance profile of TSS number ',TSS_input_no_unbalance_str], 'Units', 'pixels', 'Position', [1 80 1920 900]);
    set(gca, 'Visible', 'off');  % Hide the axes
TSS_voltage_unbalance_plot;
end
function Maximum_voltage_unbalance_of_all_TSS(source,event,track)
TSS_maximum_voltage_unbalance;
end

function make_system_data(source, event)
fig = figure('Name', 'Make system data', 'Units', 'pixels', 'Position', centerFigurePosition(1000, 700));
set(gca, 'Visible', 'off');

screenSize = get(0, 'ScreenSize');
buttonWidth = 300;
buttonHeight = 100;
buttonSpacing = 50;
totalButtons = 2;
figureHeight = (buttonHeight + buttonSpacing) * totalButtons - buttonSpacing;
startX1 = 200;
startX2 = 90;
startY1 = (screenSize(4) - 50) / 2;
startY2 = (screenSize(4) - 50) / 2;

b1 = uicontrol(fig,'Style', 'pushbutton', 'String', 'Prepare Fresh Data', 'Units', 'pixels', 'Position', [startX1, startY1-50, buttonWidth, buttonHeight], 'Callback', @prepare_fresh_data, 'BackgroundColor', [0.4, 0.56, 0.72], 'ForegroundColor', [1, 1, 1], 'FontWeight', 'bold', 'FontSize', 12);
startX1 = startX1 + 400;
b2 = uicontrol(fig,'Style', 'pushbutton', 'String', 'Edit Existing Data', 'Units', 'pixels', 'Position', [startX1, startY1-50, buttonWidth, buttonHeight], 'Callback', @edit_existing_data, 'BackgroundColor', [0.4, 0.56, 0.72], 'ForegroundColor', [1, 1, 1], 'FontWeight', 'bold', 'FontSize', 12);

end

function edit_existing_data(~,~)
    % Open file dialog for file selection
    [filename, pathname] = uigetfile('*.txt', 'Select Text File');

    % Check if a file was selected
    if filename ~= 0
        % Open the selected file in Octave editor
        edit(fullfile(pathname, filename));
    else
        % No file selected
        disp('No file selected.');
    end
end




 function prepare_fresh_data(~,~)
  % Prompt the user for input using inputdlg
prompt = {'Enter the number of TSS', 'Enter the distance (in km) of all the TSSs measured from the starting point', 'Enter the number of AT', 'Enter the distance (in km) of all the ATs measured from the starting point'};
dlgtitle = 'User Input';
numlines = 1;
defaultans = {'', '', '', ''};
input_data = inputdlg(prompt, dlgtitle, numlines, defaultans);

% Check if the user clicked cancel or closed the dialog
if isempty(input_data)
    return;
end

% Retrieve the user input
num_tss_str = input_data{1};
num_at_str = input_data{3};
tss_data_str = input_data{2};
at_data_str = input_data{4};

% Check if any input is empty and assign default values
missing_inputs = {};
if isempty(num_tss_str)
    num_tss_str = '11';  % Default value
    missing_inputs{end+1} = 'Number of TSS (Default: 11)';
end
if isempty(num_at_str)
    num_at_str = '52';  % Default value
    missing_inputs{end+1} = 'Number of AT (Default: 52)';
end
if isempty(tss_data_str)
    tss_data_str ='5 55 105 155 205 255 305 355 405 455 505';  % Default value
    missing_inputs{end+1} = 'Distance of TSSs (Default: [5 55 105 155 205 255 305 355 405 455 505])';
end
if isempty(at_data_str)
    at_data_str ='3 13 23 33 43 53 63 73 83 93 103 113 123 133 143 153 163 173 183 193 203 213 223 233 243 253 263 273 283 293 303 313 323 333 343 353 363 373 383 393 403 413 423 433 443 453 463 473 483 493 503 513';  % Default value
    missing_inputs{end+1} = 'Distance of ATs (Default: [3 13 23 33 43 53 63 73 83 93 103 113 123 133 143 153 163 173 183 193 203 213 223 233 243 253 263 273 283 293 303 313 323 333 343 353 363 373 383 393 403 413 423 433 443 453 463 473 483 493 503 513])';
end

% Display a warning dialog if any inputs are missing
if ~isempty(missing_inputs)
    warning_msg = ['The following inputs are missing:' sprintf('\n')];
    for i = 1:numel(missing_inputs)
        warning_msg = [warning_msg missing_inputs{i} sprintf('\n')];
    end
    warning_msg = [warning_msg sprintf('\n') 'Default values will be used.'];
choice = questdlg(warning_msg, 'Missing Inputs', 'OK', 'Re-enter', 'OK');
    if strcmp(choice, 'Re-enter')
    defaultans_sub = {input_data{1},input_data{2},input_data{3},input_data{4}};
   input_data = inputdlg(prompt, dlgtitle, numlines, defaultans_sub);
num_tss_str = input_data{1};
num_at_str = input_data{3};
tss_data_str = input_data{2};
at_data_str = input_data{4};
    end
end

% Converting string to array
num_tss_val = str2double(num_tss_str);
num_at_val = str2double(num_at_str);
tss_data_val = str2double(strsplit(tss_data_str, ' '));
at_data_val = str2double(strsplit(at_data_str, ' '));

% Limiting the size of the array to the specified value
if numel(tss_data_val) > num_tss_val
    tss_data_val = tss_data_val(1:num_tss_val);
end
if numel(at_data_val) > num_at_val
    at_data_val = at_data_val(1:num_at_val);
end

%save('user_input.mat', 'num_trains_val', 'num_tss_val', 'num_at_val', 'tss_data_val', 'at_data_val');
  % Prompt the user for input using inputdlg

prompt2 = {'Enter the TSS primary side voltage (KV)', 'Enter the TSS secondary side voltage (KV)', 'Enter the primary side resistance (ohm)', 'Enter the primary side reactance (ohm)', 'Enter the secondary side resistance (ohm)','Enter the secondary side reactance (ohm)','Enter the Rail grounding impedance (ohm)','Enter the TSS (source side) short circuit MVA'};
dlgtitle2 = 'TSS Parameters';
numlines2 = 1;
defaultans2 = {'', '', '', '','','','',''};
input_data2 = inputdlg(prompt2, dlgtitle2, numlines2, defaultans2);

% Check if the user clicked cancel or closed the dialog
if isempty(input_data2)
    return;
end

% Retrieve the additional user input
vp_str = input_data2{1};
vs_str = input_data2{2};
rp_str = input_data2{3};
rs_str = input_data2{5};
xp_str = input_data2{4};
xs_str = input_data2{6};
zn_str = input_data2{7};
sckt_str = input_data2{8};

% Check if any input is empty and assign default values
missing_inputs = {};
if isempty(vp_str)
    vp_str = '132';  % Default value
    missing_inputs{end+1} = 'TSS primary voltage (Default: 132)';
end
if isempty(vs_str)
    vs_str = '27.5';  % Default value
    missing_inputs{end+1} = 'TSS secondary voltage (Default: 27.5)';
end
if isempty(rp_str)
    rp_str = '0.1';  % Default value
    missing_inputs{end+1} = 'Primary side resistance (Default: 0.1)';
end
if isempty(rs_str)
    rs_str = '0.05';  % Default value
    missing_inputs{end+1} = 'Secondary side resistance (Default: 0.05)';
end
if isempty(xp_str)
    xp_str = '0.05';  % Default value
    missing_inputs{end+1} = 'Primary side reactance (Default: 0.05)';
end
if isempty(xs_str)
    xs_str = '0.1';  % Default value
    missing_inputs{end+1} = 'Secondary side reactance (Default: 0.1)';
end
if isempty(zn_str)
    zn_str = '1';  % Default value
    missing_inputs{end+1} = 'Rail grounding impedance (Default: 1)';
end
if isempty(sckt_str)
    sckt_str = '5000';  % Default value
    missing_inputs{end+1} = 'TSS(source side) short circuit MVA (Default: 5000)';
end

% Display a warning dialog if any inputs are missing
if ~isempty(missing_inputs)
    warning_msg = ['The following inputs are missing:' sprintf('\n')];
    for i = 1:numel(missing_inputs)
        warning_msg = [warning_msg missing_inputs{i} sprintf('\n')];
    end
    warning_msg = [warning_msg sprintf('\n') 'Default values will be used.'];
    choice = questdlg(warning_msg, 'Missing Inputs', 'OK', 'Re-enter', 'OK');
 if strcmp(choice, 'Re-enter')
    defaultans_sub = {input_data2{1},input_data2{2},input_data2{3},input_data2{4},input_data2{5},input_data2{6},input_data2{7},input_data2{8}};
    input_data2 = inputdlg(prompt2, dlgtitle2, numlines2, defaultans_sub);
    vp_str = input_data2{1};
vs_str = input_data2{2};
rp_str = input_data2{3};
rs_str = input_data2{5};
xp_str = input_data2{4};
xs_str = input_data2{6};
zn_str = input_data2{7};
sckt_str = input_data2{8};
    end
end

% Convert additional input to numbers
vp_val = str2double(vp_str);
vs_val = str2double(vs_str);
rp_val = str2double(rp_str);
rs_val = str2double(rs_str);
xp_val = str2double(xp_str);
xs_val = str2double(xs_str);
zn_val = str2double(zn_str);
sckt_val = str2double(sckt_str);

% Prompt the user for input using inputdlg
prompt_at = {'Enter the AT leakage resistance (ohm)', 'Enter the AT leakage reactance (ohm)', 'Enter the AT magnetising resistance (ohm)', 'Enter the AT magnetising reactance (ohm)'};
dlgtitle_at = 'AT Parameters';
numlines_at= 1;
defaultans_at = {'', '', '', ''};
input_data_at = inputdlg(prompt_at, dlgtitle_at, numlines_at, defaultans_at);

% Check if the user clicked cancel or closed the dialog
if isempty(input_data_at)
    return;
end

% Retrieve the user input
at_leak_res_str = input_data_at{1};
at_leak_reac_str = input_data_at{2};
at_mag_res_str = input_data_at{3};
at_mag_reac_str = input_data_at{4};

% Check if any input is empty and assign default values
missing_inputs = {};
if isempty(at_leak_res_str)
    at_leak_res_str = '0.1564';  % Default value
    missing_inputs{end+1} = 'AT leakage resistance (Default: 0.1564)';
end
if isempty(at_leak_reac_str)
    at_leak_reac_str = '0.0997';  % Default value
    missing_inputs{end+1} = 'AT leakage reactance (Default: 0.0997)';
end
if isempty(at_mag_res_str)
    at_mag_res_str ='101400';  % Default value
    missing_inputs{end+1} = 'AT magnetising resistance (Default: 101400)';
end
if isempty(at_mag_reac_str)
    at_mag_reac_str ='279100';  % Default value
    missing_inputs{end+1} = 'AT magnetising reactance (Default: 279100)';
end

% Display a warning dialog if any inputs are missing
if ~isempty(missing_inputs)
    warning_msg = ['The following inputs are missing:' sprintf('\n')];
    for i = 1:numel(missing_inputs)
        warning_msg = [warning_msg missing_inputs{i} sprintf('\n')];
    end
    warning_msg = [warning_msg sprintf('\n') 'Default values will be used.'];
choice = questdlg(warning_msg, 'Missing Inputs', 'OK', 'Re-enter', 'OK');
   if strcmp(choice, 'Re-enter')
    defaultans_sub = {input_data_at{1},input_data_at{2},input_data_at{3},input_data_at{4}};
  input_data_at = inputdlg(prompt_at, dlgtitle_at, numlines_at, defaultans_sub);
   at_leak_res_str = input_data_at{1};
at_leak_reac_str = input_data_at{2};
at_mag_res_str = input_data_at{3};
at_mag_reac_str = input_data_at{4};
   end
end

% Converting string to array
at_leak_res = str2double(at_leak_res_str);
at_leak_reac = str2double(at_leak_reac_str);
at_mag_res = str2double(at_mag_res_str);
at_mag_reac = str2double(at_mag_reac_str);

  % Prompt the user for additional input using inputdlg
% Prompt the user for input using inputdlg
prompt3 = {'Homogenous earth conducting resistivity', 'Frequency(Hz)', 'Gauge', 'Number of conductors (catenary, rail, feeder, messenger, earth)', 'Contact wire height (m) measured from rail','Messenger wire height (m) measured from rail','Feeder wire height (m) measured from rail','Feeder wire distance (m) measured from center (rail)','Earth (ground) wire height (m) measured from rail','Earth (ground) wire distance (m) measured from center (rail)'};
dlgtitle3 = 'OHE configuration';
numlines3 = 1;
defaultans3 = {'', '', '', '','','','','','',''};
input_data3 = inputdlg(prompt3, dlgtitle3, numlines3, defaultans3);

% Check if the user clicked cancel or closed the dialog
if isempty(input_data3)
    return;
end

% Retrieve the additional user input
row_str = input_data3{1};
f_str = input_data3{2};
Ga_str = input_data3{3};
nl_str = input_data3{4};
ch_str = input_data3{5};
mh_str = input_data3{6};
nfh_str = input_data3{7};
nfd_str = input_data3{8};
Gh_str = input_data3{9};
Gd_str = input_data3{10};

% Check if any input is empty and assign default values
missing_inputs = {};
if isempty(row_str)
    row_str = '100';  % Default value
    missing_inputs{end+1} = 'Homogenous earth conducting resistivity (Default: 100)';
end
if isempty(f_str)
    f_str = '50';  % Default value
    missing_inputs{end+1} = 'Frequency (Default: 50)';
end
if isempty(Ga_str)
    Ga_str = '1.435';  % Default value
    missing_inputs{end+1} = 'Gauge (Default: 1.435)';
end
if isempty(nl_str)
    nl_str = '5.0';  % Default value
    missing_inputs{end+1} = 'Number of conductors (Default: 5.0)';
end
if isempty(ch_str)
    ch_str = '5';  % Default value
    missing_inputs{end+1} = 'Contact wire height (Default: 5)';
end
if isempty(mh_str)
    mh_str = '6.5';  % Default value
    missing_inputs{end+1} = 'Messenger wire height (Default: 6.5)';
end
if isempty(nfh_str)
    nfh_str = '8.7';  % Default value
    missing_inputs{end+1} = 'Feeder wire height (Default: 8.7)';
end
if isempty(nfd_str)
    nfd_str = '3.9175';  % Default value
    missing_inputs{end+1} = 'Feeder wire distance (Default: 3.9175)';
end
if isempty(Gh_str)
    Gh_str = '6';  % Default value
    missing_inputs{end+1} = 'Earth (ground) wire height (Default: 6)';
end
if isempty(Gd_str)
    Gd_str = '3.2675';  % Default value
    missing_inputs{end+1} = 'Earth (ground) wire distnace (Default: 3.2675)';
end

% Display a warning dialog if any inputs are missing
if ~isempty(missing_inputs)
    warning_msg = ['The following inputs are missing or invalid:' sprintf('\n')];
    for i = 1:numel(missing_inputs)
        warning_msg = [warning_msg missing_inputs{i} sprintf('\n')];
    end
    warning_msg = [warning_msg sprintf('\n') 'Default values will be used.'];
    choice = questdlg(warning_msg, 'Missing Inputs', 'OK', 'Re-enter', 'OK');
if strcmp(choice, 'Re-enter')
    defaultans_sub = {input_data3{1},input_data3{2},input_data3{3},input_data3{4},input_data3{5},input_data3{6},input_data3{7},input_data3{8},input_data3{9},input_data3{10}};
    input_data3 = inputdlg(prompt3, dlgtitle3, numlines3, defaultans_sub);
    row_str = input_data3{1};
f_str = input_data3{2};
Ga_str = input_data3{3};
nl_str = input_data3{4};
ch_str = input_data3{5};
mh_str = input_data3{6};
nfh_str = input_data3{7};
nfd_str = input_data3{8};
Gh_str = input_data3{9};
Gd_str = input_data3{10};
    end
end

% Convert additional input to numbers
row_val = str2double(row_str);
f_val = str2double(f_str);
Ga_val = str2double(Ga_str);
nl_val = str2double(nl_str);
ch_val = str2double(ch_str);
mh_val = str2double(mh_str);
nfh_val = str2double(nfh_str);
Gh_val = str2double(Gh_str);
Gd_val = str2double(Gd_str);
nfd_val = str2double(nfd_str);

% Prompt the user for additional input using inputdlg
 % Prompt the user for input using inputdlg
prompt4 = {'Diameter (mm) of catenary wire', 'Resistance (ohm/km) of catenary wire', 'Diameter (mm) of messenger wire', 'Resistance (ohm/km) of messenger wire', 'Diameter (mm) of earth/ground wire','Resistance (ohm/km) of earth/ground wire','Diameter (mm) of feeder wire','Resistance (ohm/km) of feeder wire','Diameter (mm) of Rail','Resistance (ohm/km) of Rail'};
dlgtitle4 = 'OHE Parameters';
numlines4 = 1;
defaultans4 = {'', '', '', '','','','','','',''};
input_data4 = inputdlg(prompt4, dlgtitle4, numlines4, defaultans4);

% Check if the user clicked cancel or closed the dialog
if isempty(input_data4)
    return;
end

% Retrieve the additional user input
diam_C_str = input_data4{1};
Resistance_C_str = input_data4{2};
diam_M1_str = input_data4{3};
Resistance_Ml_str = input_data4{4};
diam_G_str = input_data4{5};
Resistance_G_str = input_data4{6};
diam_F_str = input_data4{7};
Resistance_F_str = input_data4{8};
diam_R1_str = input_data4{9};
Resistance_R1_str = input_data4{10};

% Check if any input is empty and assign default values
missing_inputs = {};
if isempty(diam_C_str)
    diam_C_str = '15.49';  % Default value
    missing_inputs{end+1} = 'Diameter of catenary wire (Default: 15.49)';
end
if isempty(Resistance_C_str)
    Resistance_C_str = '0.1451';  % Default value
    missing_inputs{end+1} = 'Resistance of catenary wire per km (Default: 0.1451)';
end
if isempty(diam_M1_str)
    diam_M1_str = '17.5';  % Default value
    missing_inputs{end+1} = 'Diameter of messenger wire (Default: 17.5)';
end
if isempty(Resistance_Ml_str)
    Resistance_Ml_str = '0.794';  % Default value
    missing_inputs{end+1} = 'Resistance of messenger wire per km (Default: 0.794)';
end
if isempty(diam_G_str)
    diam_G_str = '16.3';  % Default value
    missing_inputs{end+1} = 'Diameter of Earth/ground wire (Default: 16.3)';
end
if isempty(Resistance_G_str)
    Resistance_G_str = '0.2143';  % Default value
    missing_inputs{end+1} = 'Resistance of Earth/ground wire per km (Default: 0.2143)';
end
if isempty(diam_F_str)
    diam_F_str = '23.4';  % Default value
    missing_inputs{end+1} = 'Diameter of feeder wire (Default: 23.4)';
end
if isempty(Resistance_F_str)
    Resistance_F_str = '0.056';  % Default value
    missing_inputs{end+1} = 'Resistance of feeder wire per km (Default: 0.056)';
end
if isempty(diam_R1_str)
    diam_R1_str = '146';  % Default value
    missing_inputs{end+1} = 'Diameter of Rail (Default: 146)';
end
if isempty(Resistance_R1_str)
    Resistance_R1_str = '0.0240';  % Default value
    missing_inputs{end+1} = 'Resistance of Rail per km (Default: 0.0240)';
end

% Display a warning dialog if any inputs are missing
if ~isempty(missing_inputs)
    warning_msg = ['The following inputs are missing or invalid:' sprintf('\n')];
    for i = 1:numel(missing_inputs)
        warning_msg = [warning_msg missing_inputs{i} sprintf('\n')];
    end
    warning_msg = [warning_msg sprintf('\n') 'Default values will be used.'];
choice = questdlg(warning_msg, 'Missing Inputs', 'OK', 'Re-enter', 'OK');
if strcmp(choice, 'Re-enter')
    defaultans_sub = {input_data4{1},input_data4{2},input_data4{3},input_data4{4},input_data4{5},input_data4{6},input_data4{7},input_data4{8},input_data4{9},input_data4{10}};
   input_data4 = inputdlg(prompt4, dlgtitle4, numlines4, defaultans_sub);
   diam_C_str = input_data4{1};
Resistance_C_str = input_data4{2};
diam_M1_str = input_data4{3};
Resistance_Ml_str = input_data4{4};
diam_G_str = input_data4{5};
Resistance_G_str = input_data4{6};
diam_F_str = input_data4{7};
Resistance_F_str = input_data4{8};
diam_R1_str = input_data4{9};
Resistance_R1_str = input_data4{10};
end
end

% Convert additional input to numbers
diam_C_val = str2double(diam_C_str);
Resistance_C_val = str2double(Resistance_C_str);
diam_M1_val = str2double(diam_M1_str);
Resistance_Ml_val = str2double(Resistance_Ml_str);
diam_G_val = str2double(diam_G_str);
Resistance_G_val = str2double(Resistance_G_str);
diam_F_val = str2double(diam_F_str);
Resistance_F_val = str2double(Resistance_F_str);
diam_R1_val = str2double(diam_R1_str);
Resistance_R1_val = str2double(Resistance_R1_str);

    % Save the additional input values to the same file
%    save('user_input.m', 'num_tss_val', 'num_at_val', 'tss_data_val', 'at_data_val', 'vp_val', 'vs_val', 'rs_val', 'rp_val','xp_val','xs_val','zn_val','row_val','f_val','Ga_val','ch_val','mh_val','nfh_val','nfd_val','Gh_val','Gd_val','nl_val','diam_C_val', 'Resistance_C_val', 'diam_M1_val', 'Resistance_Ml_val', 'diam_G_val', 'Resistance_G_val', 'diam_F_val', 'Resistance_F_val', 'diam_R1_val', 'Resistance_R1_val', 'diam_R2_val', 'Resistance_R2_val','-append');
[filename, filepath] = uiputfile('*.txt', 'Save Data File');
if filename ~= 0
    fullpath = fullfile(filepath, filename);
    fid = fopen(fullpath, 'w');

fprintf(fid, 'Number of TSS:\n%s\n\n', num2str(num_tss_val));
fprintf(fid, 'Distance (in km) of all the TSSs measured from starting point:\n');
fprintf(fid, '%s ', num2str(tss_data_val));
fprintf(fid, '\n\n');

fprintf(fid, 'Number of AT:\n%s\n\n', num2str(num_at_val));
fprintf(fid, 'Distance (in km) of all the ATs measured from starting point:\n');
fprintf(fid, '%s ', num2str(at_data_val));
fprintf(fid, '\n\n');

fprintf(fid, 'TSS primary voltage (Kv):\n%s\n\n', num2str(vp_val));
fprintf(fid, 'TSS secondary voltage (Kv):\n%s\n\n', num2str(vs_val));

fprintf(fid, 'Primary side resistance (ohm):\n%s\n\n', num2str(rp_val));
fprintf(fid, 'Primary side reactance (ohm):\n%s\n\n', num2str(xp_val));
fprintf(fid, 'Secondary side resistance (ohm):\n%s\n\n', num2str(rs_val));
fprintf(fid, 'Secondary side reactance (ohm):\n%s\n\n', num2str(xs_val));

fprintf(fid, 'Rail Grounding impedance (ohm):\n%s\n\n', num2str(zn_val));

fprintf(fid, 'TSS (source side) short circuit MVA:\n%s\n\n', num2str(sckt_val));

fprintf(fid, 'AT leakage resistance (ohm):\n%s\n\n', num2str(at_leak_res));
fprintf(fid, 'AT leakage reactance (ohm):\n%s\n\n', num2str(at_leak_reac));
fprintf(fid, 'AT magnetising resistance (ohm):\n%s\n\n', num2str(at_mag_res));
fprintf(fid, 'AT magnetising reactance (ohm):\n%s\n\n', num2str(at_mag_reac));

fprintf(fid, 'homogenous earth conducting resistivity:\n%s\n\n', num2str(row_val));

fprintf(fid, 'frequency (Hz):\n%s\n\n', num2str(f_val));

fprintf(fid, 'gauge:\n%s\n\n', num2str(Ga_val));

fprintf(fid, 'Number of conductors (catenary, rail, feeder, messenger, earth):\n%s\n\n', num2str(nl_val));

fprintf(fid, 'contact wire height (m) measured from rail:\n%s\n\n', num2str(ch_val));
fprintf(fid, 'messenger wire height (m) measured from rail:\n%s\n\n', num2str(mh_val));
fprintf(fid, 'feeder wire height (m) measured from rail:\n%s\n\n', num2str(nfh_val));
fprintf(fid, 'feeder wire distance (m) measured from center (rail):\n%s\n\n', num2str(nfd_val));
fprintf(fid, 'earth (ground) wire height (m) measured from rail:\n%s\n\n', num2str(Gh_val));
fprintf(fid, 'earth (ground) wire distance (m) measured from centre (rail):\n%s\n\n', num2str(Gd_val));

fprintf(fid, 'diameter (mm) of catenary wire:\n%s\n\n', num2str(diam_C_val));
fprintf(fid, 'resistance (ohm/km) of catenary wire:\n%s\n\n', num2str(Resistance_C_val));

fprintf(fid, 'diameter (mm) of messenger wire:\n%s\n\n', num2str(diam_M1_val));
fprintf(fid, 'resistance (ohm/km) of messenger wire:\n%s\n\n', num2str(Resistance_Ml_val));

fprintf(fid, 'diameter (mm) of earth(ground) wire:\n%s\n\n', num2str(diam_G_val));
fprintf(fid, 'resistance (ohm/km) of earth(ground) wire:\n%s\n\n', num2str(Resistance_G_val));

fprintf(fid, 'diameter (mm) of feeder wire:\n%s\n\n', num2str(diam_F_val));
fprintf(fid, 'resistance (ohm/km) of feeder wire:\n%s\n\n', num2str(Resistance_F_val));

fprintf(fid, 'diameter (mm) of rail:\n%s\n\n', num2str(diam_R1_val));
fprintf(fid, 'resistance (ohm/km) of rail:\n%s\n\n', num2str(Resistance_R1_val));

fclose(fid);

end
end


