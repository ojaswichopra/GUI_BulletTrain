% octave
% pkg install -forge io
pkg load io;
% Read train operation data
[train_operation_data, txt, raw] = xlsread('stopage_data_train_time_rapid.xlsx');
station_distances = train_operation_data.distance;
station_names = train_operation_data.Station;
station_arrival = train_operation_data.Arrival;
station_departure = train_operation_data.Departure;
stop_data=station_departure-station_arrival;
total_track_distance = max(station_distances);
total_intermediate_station = length(station_distances) - 2;
number_of_section = total_intermediate_station + 1;

% Initialize section distance and duration
section_distance = zeros(number_of_section, 1);
for i_section = 1:number_of_section
    section_distance(i_section, 1) = station_distances(i_section + 1) - station_distances(i_section);
end

section_duration = zeros(number_of_section, 1);
for i_section = 1:number_of_section
    section_duration(i_section, 1) = station_arrival(i_section + 1) - station_departure(i_section);
end

% Read speed limit data
[speed_limit_data, txt, raw] = xlsread('track_speed_limit.xlsx');
start_pt_limit = speed_limit_data.limit_start;
end_pt_limit = speed_limit_data.limit_end;
speed_limit = speed_limit_data.limit_speed;
% max_speed = 320;
% Initialize a vector to store the count of limits per station segment
limits_count_per_segment = zeros(1, length(station_distances) - 1);

% Loop through each pair of consecutive stations
for i_lin = 1:length(station_distances) - 1
    start_distance = station_distances(i_lin);
    end_distance = station_distances(i_lin + 1);
    start_section_distance(i_lin)=start_distance;
    end_section_distance(i_lin)=end_distance;
    % Count how many speed limits fall within this segment
    count = 0;
    for j_lin = 1:height(speed_limit_data)
        limit_start = start_pt_limit(j_lin);
        limit_end = end_pt_limit(j_lin);

        % Check if the speed limit range overlaps with the station segment
        if (limit_start <= end_distance && limit_end >= start_distance)
            count = count + 1;
        end
    end

    limits_count_per_segment(i_lin) = count;
end

% Display the results
disp('Number of speed limits between each station pair:');
disp(limits_count_per_segment);

% defining number of acceleration, cruising, costing and braking
% section_acceleration_count= zeros(1, length(station_distances) - 1);
% for i_lin = 1:length(station_distances) - 1
%     count=0;
%     if limits_count_per_segment(i_lin)>0
%         for ii_lin=1:limits_count_per_segment(i_lin)
%
%         end
%     else
%       section_acceleration_count(i_lin)=1;
%     end
% end

% defining number  of operation
operation_mode_number= zeros(1, length(station_distances) - 1);
for i_lin = 1:length(station_distances) - 1
    operation_mode_number(i_lin)= 4*(limits_count_per_segment(i_lin)+1)+1*limits_count_per_segment(i_lin);
end

% global gradientData;

[gradientData, txt, raw] = xlsread('gradient_data.xlsx');
start_km = gradientData.start_distance;
end_km = gradientData.end_distance;
gradients = gradientData.gradient;