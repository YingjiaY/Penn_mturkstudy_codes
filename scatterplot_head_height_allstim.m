clear all;
close all;
%clc;

userpath = ('/Users/beauchamplab/Dropbox (PennNeurosurgery)/BeauchampLabAtPenn/JALI_mTurk_experiment/result_analysis/pixel_plotting/plotting');
alldata = readtable('plotting/.csv');

L = length(alldata.speaker);
for i = 1:L
    %{
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
    
    %taking width column and height column as x and y axis
    x_ber = table2array(alldata(strcmp(alldata.speaker,'bernice'),12));
    y_ber = table2array(alldata(strcmp(alldata.speaker,'bernice'),13));
    x_lin = table2array(alldata(strcmp(alldata.speaker,'lin'),12));
    y_lin = table2array(alldata(strcmp(alldata.speaker,'lin'),13));
    x_ett = table2array(alldata(strcmp(alldata.speaker,'ettore'),12));
    y_ett = table2array(alldata(strcmp(alldata.speaker,'ettore'),13));
    x_john = table2array(alldata(strcmp(alldata.speaker,'john'),12));
    y_john = table2array(alldata(strcmp(alldata.speaker,'john'),13));
    % taking area column as axis
    Aber = table2array(alldata(strcmp(alldata.speaker,'bernice'),14));
    Alin = table2array(alldata(strcmp(alldata.speaker,'lin'),14));
    Aett = table2array(alldata(strcmp(alldata.speaker,'ettore'),14));
    Ajohn = table2array(alldata(strcmp(alldata.speaker,'john'),14));
    %}

    accuracy = table2array(alldata(strcmp(alldata.speaker,'bernice'),11));

end
%% line plot of time course per word 
% x1 = [2 4 6 8 10 12];
% x2 = [2 4 6 8 10 12 14];
% % female
% figure(1)
% subplot(3,1,1)
% plot(x1,Aber_1,'o-')
% hold on
% plot(x1,Alin_1,'o-')
% legend('Bernice','Lin')
% subtitle('although')
% 
% subplot(3,1,2)
% plot(x1,Aber_2,'o-')
% hold on
% plot(x1,Alin_2,'o-')
% legend('Bernice','Lin')
% subtitle('fetch')
% 
% subplot(3,1,3)
% plot(x2,Aber_3,'o-')
% hold on
% plot(x2,Alin_3,'o-')
% legend('Bernice','Lin')
% subtitle('soothing')
% 
% % male
% figure(2)
% subplot(3,1,1)
% plot(x1,Aett_1,'o-')
% hold on
% plot(x1,Ajohn_1,'o-')
% legend('Ettore','John')
% subtitle('choice')
% 
% subplot(3,1,2)
% plot(x2,Aett_2,'o-')
% hold on
% plot(x2,Ajohn_2,'o-')
% legend('Ettore','John')
% subtitle('fusion')
% 
% 
% subplot(3,1,3)
% plot(x2,Aett_3,'o-')
% hold on
% plot(x2,Ajohn_3,'o-')
% xlim = ([0 16]);
% legend('Ettore','John')
% subtitle('worthy')
% 
% xlabel('Number of frames')
% ylabel('Mouth area')

%% jali against real [area] scatterplot

figure(3)
subplot(2,1,1)
% f = polyfit(Aber,Alin,1);
% p = polyval(f,Aber);
scatter(Aber,Alin)
hold on 
yy = Aber;
plot(Aber,yy)
xlabel('area for jali')
ylabel('area for real')
legend('female')

subplot(2,1,2)
% f = polyfit(Aett,Ajohn,1);
% p = polyval(f,Aett);
scatter(Aett,Ajohn)
hold on 
yy = Aett;
plot(Aett,yy)
xlabel('head area for jali')
ylabel('head area for real')
legend('male')
%}

%% width against height scatterplot

figure(4)
subplot(2,1,1)
scatter(x_ber,y_ber,'filled')
hold on 
scatter(x_lin,y_lin)
xlabel('width')
ylabel('height')
legend('Bernice','Lin')

subplot(2,1,2)
scatter(x_ett,y_ett,'filled')
hold on 
scatter(x_john,y_john)
xlabel('width')
ylabel('height')
legend('Ettore','John')


%% jali against real [height] scatterplot

figure(5)
subplot(2,1,1)
% f = polyfit(Aber,Alin,1);
% p = polyval(f,Aber);
scatter(y_ber,y_lin)
hold on 
yy1 = y_ber;
yline(yy1)
xlim([0 490])
ylim([0 490])
xlabel('height for jali')
ylabel('height for real')
legend('female')

subplot(2,1,2)
% f = polyfit(Aett,Ajohn,1);
% p = polyval(f,Aett);
scatter(y_ett,y_john)
hold on 
yy2 = y_ett;
yline(yy2)
xlim([0 490])
ylim([0 490])
xlabel('height for jali')
ylabel('height for real')
legend('male')

%%

figure(6)
subplot(2,1,1)
% f = polyfit(Aber,Alin,1);
% p = polyval(f,Aber);
scatter(y_ber,y_ett)
hold on 
% y = y_ber;
% plot(y_ber,y)
xlabel('head height for jali')
ylabel('head height for real')
legend('female')

subplot(2,1,2)
% f = polyfit(Aett,Ajohn,1);
% p = polyval(f,Aett);
scatter(y_lin,y_john)
hold on 
% y = y_ett;
% plot(y_ett,y)
xlabel('head height for jali')
ylabel('head height for real')
legend('male')


%% 
