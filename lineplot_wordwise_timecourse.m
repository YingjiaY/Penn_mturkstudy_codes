clear all;
close all;
clc;

% userpath = ('/Users/beauchamplab/Dropbox (PennNeurosurgery)/BeauchampLabAtPenn/JALI_mTurk_experiment/stimuli/PIXEL/data_for_plotting_IY');
userpath = ('/Users/beauchamplab/Desktop/time_course');
alldata = readtable('time_course/time_course_area.xlsx');

L = length(alldata.speaker);
for i = 1:L
    % although
    Aber_1 = table2array(alldata(strcmp(alldata.code,'b1'),5));
    Alin_1 = table2array(alldata(strcmp(alldata.code,'l1'),5));

    % fetch
    Aber_2 = table2array(alldata(strcmp(alldata.code,'b2'),5));
    Alin_2 = table2array(alldata(strcmp(alldata.code,'l2'),5));
    %soothing
    Aber_3 = table2array(alldata(strcmp(alldata.code,'b3'),5));
    Alin_3 = table2array(alldata(strcmp(alldata.code,'l3'),5));
    

    %choice
    Aett_1 = table2array(alldata(strcmp(alldata.code,'e1'),5));
    Ajohn_1 = table2array(alldata(strcmp(alldata.code,'j1'),5));
    %fusion
    Aett_2 = table2array(alldata(strcmp(alldata.code,'e2'),5));
    Ajohn_2 = table2array(alldata(strcmp(alldata.code,'j2'),5));
    %worthy
    Aett_3 = table2array(alldata(strcmp(alldata.code,'e3'),5));
    Ajohn_3 = table2array(alldata(strcmp(alldata.code,'j3'),5));
end
%% line plot of time course per word 
x1 = [2 4 6 8 10 12];
x2 = [2 4 6 8 10 12 14];
% female
figure(1)
subplot(3,1,1)
plot(x1,Aber_1,'o-')
hold on
plot(x1,Alin_1,'o-')
legend('Bernice','Lin')
subtitle('although')

subplot(3,1,2)
plot(x1,Aber_2,'o-')
hold on
plot(x1,Alin_2,'o-')
legend('Bernice','Lin')
subtitle('fetch')

subplot(3,1,3)
plot(x2,Aber_3,'o-')
hold on
plot(x2,Alin_3,'o-')
legend('Bernice','Lin')
subtitle('soothing')

% male
figure(2)
subplot(3,1,1)
plot(x1,Aett_1,'o-')
hold on
plot(x1,Ajohn_1,'o-')
legend('Ettore','John')
subtitle('choice')

subplot(3,1,2)
plot(x2,Aett_2,'o-')
hold on
plot(x2,Ajohn_2,'o-')
legend('Ettore','John')
subtitle('fusion')


subplot(3,1,3)
plot(x2,Aett_3,'o-')
hold on
plot(x2,Ajohn_3,'o-')
xlim = ([0 16]);
legend('Ettore','John')
subtitle('worthy')

xlabel('Number of frames')
ylabel('Mouth area')

