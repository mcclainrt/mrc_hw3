% 
% Use MATLAB to generate three figures based on the recorded data from Exercise 3:
% 
%     A plot the X and Y location of your turtle. Save this file as matlab/pose_xy.png
%     A plot of the heading angle (Theta) of your turtle as a function of time. Save this file as matlab/pose_theta.png
%     A quiver plot showing the location and heading of the turtle.  Save this file as matlab/pose_quiver.png
% 
% Following the Working with rosbag Log Files example, develop a script called plotbag.m and put it in a directory of your package called matlab.  Your script will need to do the following...
% 
%     Load the myturtle.bag file
%     Select the messages on the turtle1/pose topic
%     Convert these pose messages to a timeseries
%     Generate the figures.  (Make sure to include labels and titles for your figures.)

clear all
close all

%% Load file and parse data

bag = rosbag('../data/myturtle.bag');
 
% Display a list of the topics and message types in the bag file
bag.AvailableTopics;

% show attributes of the Twist message
msg_pose = rosmessage('turtlesim/Pose');
showdetails(msg_pose);
 
% Parse bag file for topic - pose
posebag = select(bag,'Topic','turtle1/pose');
 
% Create a time series object
ts = timeseries(posebag,'X','Y','Theta','LinearVelocity','AngularVelocity');

% Normalize time from timeseries
timeN=ts.time-ts.time(1);

%% Plotting

% Position plot
plot(ts.Data(:,1),ts.Data(:,2));
xlabel('X position')
ylabel('Y position')
title('Turtle Position')
saveas(gcf, 'pose_xy.png');

% Theta vs. time
figure
xlabel('Time (s)')
ylabel('Theta (rad)')
title('Heading Angle vs. Time')
saveas(gcf, 'pose_theta.png');

% Quiver plot
figure
vel = ts.Data(:,4);
th = ts.Data(:,3);
u = vel.*cos(th);
v = vel.*sin(th);
i = 1:10:length(ts.Data(:,1));
quivfig = quiver(ts.Data(i,1),ts.Data(i,2),u(i),v(i));
xlabel('X position')
ylabel('Y position')
title('Quiver Plot of Turtle1')
saveas(gcf, 'pose_quiver.png');

