
% plotting the result

figure(1)
plot(train_prof(:,1),train_prof(:,2))
xlabel('time (sec)')
ylabel('Velocity (Km/h)')

hold on
figure(2)
plot(train_prof(:,1),train_prof(:,3))
xlabel('time (sec)')
ylabel('Distance (Km)')

hold on
figure(3)
plot(train_prof(:,3),train_prof(:,2))
xlabel('Distance (Km)')
ylabel('Velocity (Km/h)')

hold on
figure(4)
plot(train_prof(:,1),train_prof(:,4))
xlabel('time (sec)')
ylabel('Power (MW)')

hold on
figure(5)
plot(train_prof(:,1),train_prof(:,5))
xlabel('time (sec)')
ylabel('accleration (m/sec^2)')

hold on
figure(6)
plot(train_prof(:,1),train_prof(:,6))
xlabel('time (sec)')
ylabel('tractive or braking force (kN)')