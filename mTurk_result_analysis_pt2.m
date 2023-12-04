clear all
clc
%% 
userpath = ('/Users/beauchamplab/Dropbox (PennNeurosurgery)/BeauchampLabAtPenn/JALI_mTurk_experiment/result_analysis/analysis');
tA = readtable('analysis/batch1_batch2_batch3.csv');
tA_add = readtable('analysis/batch1_batch2_batch3_add.csv');
merged_tA = [tA;tA_add];
for i = size(merged_tA,1)
    real_AnV = table2array(tA((strcmp(tA.condition,'AnV') & strcmp(tA.movie_type,'real')),13));
    jali_AnV = table2array(tA((strcmp(tA.condition,'AnV') & strcmp(tA.movie_type,'jali')),13));
    An = table2array(tA((strcmp(tA.condition,'An') & strcmp(tA.movie_type,'real')),13));
end

mean_real_AnV = mean(real_AnV)
mean_jali_AnV = mean(jali_AnV)
mean_An = mean(An)

% Var = ["mean_bernice_AnV",mean_bernice_AnV
%     "mean_lin_AnV",mean_lin_AnV
%     "mean_lin_An",mean_lin_An
%     "mean_ettore_AnV",mean_ettore_AnV
%     "mean_john_AnV",mean_john_AnV
%     "mean_john_An",mean_john_An]
% 
% %% plottings
% % comparing all groups (AnV+An) in scatterplot + mean from each group
% figure(2)
% xaxis_All = categorical({'jali female AnV','jali_male AnV','real female AnV','real male AnV','female An','male An'});
% xaxis_All = reordercats(xaxis_All,{'jali female AnV','jali_male AnV','real female AnV','real male AnV','female An','male An'});
% yaxis_All = [acc_bernice acc_ettore acc_lin_AnV acc_john_AnV acc_lin_An acc_john_An];
% scatter(xaxis_All,yaxis_All,'jitter','on', 'jitterAmount',0.1)
% hold on 
% mean_yaxis_All = [mean_bernice_AnV mean_ettore_AnV mean_lin_AnV mean_john_AnV mean_lin_An mean_john_An];
% plot(xaxis_All,mean_yaxis_All,'r*','LineWidth', 2)
% xlabel('movie type')
% ylabel('accuracy')
% 
% % bar graph for the mean 
% figure(3)
% bar(xaxis_All,mean_yaxis_All)
% ylim([0 1])
% xlabel('movie type')
% ylabel('mean accuracy')
% 
% 
