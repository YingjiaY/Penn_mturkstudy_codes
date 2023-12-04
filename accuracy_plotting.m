clear all;
clc;
close all;

%%
userpath = ('/Users/beauchamplab/Dropbox (PennNeurosurgery)/BeauchampLabAtPenn/JALI_mTurk_experiment/result_analysis/analysis');
response = readtable('analysis/accuracy_batch_1.csv');
for i = size(response,1)
    acc_bernice = table2array(response(strcmp(response.speaker,'bernice'),11));
    acc_lin_AV = table2array(response((strcmp(response.speaker,'lin') & strcmp(response.condition,'AV')),11));
    acc_lin_AO = table2array(response((strcmp(response.speaker,'lin') & strcmp(response.condition,'AO')),11));
    acc_ettore = table2array(response(strcmp(response.speaker,'ettore'),11));
    acc_john_AV = table2array(response((strcmp(response.speaker,'john') & strcmp(response.condition,'AV')),11));    
    acc_john_AO = table2array(response((strcmp(response.speaker,'john') & strcmp(response.condition,'AO')),11));   
end
%% plottings
% AV group comparison between jali and real for different speakers 
figure(1)
xaxis_AV = categorical({'Bernice','Lin','Ettore','John'});
xaxis_AV = reordercats(xaxis_AV,{'Bernice','Lin','Ettore','John'});
yaxis_AV = [acc_bernice acc_lin_AV acc_ettore acc_john_AV];
scatter(xaxis_AV,yaxis_AV,'jitter','on', 'jitterAmount',0.1)
hold on 
mean_bernice = mean(acc_bernice);
mean_lin_AV = mean(acc_lin_AV);
mean_ettore = mean(acc_ettore);
mean_john_AV = mean(acc_john_AV);
mean_yaxis_AV = [mean_bernice mean_lin_AV mean_ettore mean_john_AV];
plot(xaxis_AV,mean_yaxis_AV,'r*','LineWidth', 2)
xlabel('speaker')
ylabel('accuracy')

% comparing all groups (AV+AO) in scatterplot + mean from each group
figure(2)
xaxis_All = categorical({'Bernice','Lin','female AO','Ettore','John','male AO'});
xaxis_All = reordercats(xaxis_All,{'Bernice','Lin','female AO','Ettore','John','male AO'});
yaxis_All = [acc_bernice acc_lin_AV acc_lin_AO acc_ettore acc_john_AV acc_john_AO];
scatter(xaxis_All,yaxis_All,'jitter','on', 'jitterAmount',0.1)
hold on 
mean_lin_AO = mean(acc_lin_AO);
mean_john_AO = mean(acc_john_AO);
mean_yaxis_All = [mean_bernice mean_lin_AV mean_lin_AO mean_ettore mean_john_AV mean_john_AO];
plot(xaxis_All,mean_yaxis_All,'r*','LineWidth', 2)
xlabel('speaker')
ylabel('accuracy')

% bar graph for the mean 
figure(3)
bar(xaxis_All,mean_yaxis_All)
xlabel('speaker')
ylabel('mean accuracy')