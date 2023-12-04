clear all;
close all;
userpath = ('/Users/izzieyu/Desktop/test/scatterplot_use');
alldata = readtable('scatterplot_use/area_widest_alphabetical.xlsx');

L = length(alldata.speaker);
for i = 1:L
    Aber = table2array(alldata(strcmp(alldata.speaker,'bernice'),6));
    Alin = table2array(alldata(strcmp(alldata.speaker,'lin'),6));
    Aett = table2array(alldata(strcmp(alldata.speaker,'ettore'),6));
    Ajohn = table2array(alldata(strcmp(alldata.speaker,'john'),6));
end

xB = ones(1, length(Aber));
xL = ones(1, length(Alin));
xE = ones(1, length(Aett));
xJ = ones(1, length(Ajohn));

mB = round(mean(Aber));
mL = round(mean(Alin));
mE = round(mean(Aett));
mJ = round(mean(Ajohn));
%%
figure(1)
subplot(2,1,1)
scatter(xB,Aber)
hold on
scatter(xL,Alin)
xlabel('speaker')
ylabel('area')
legend('Bernice','Lin')

subplot(2,1,2)
scatter(xE,Aett)
hold on
scatter(xJ,Ajohn)
xlabel('speaker')
ylabel('area')
legend('Ettore','John')
%% mean in bar graph
figure(2)
% subplot(2,1,1)
xaxis = categorical({'Bernice','Lin','Ettore','John'});
xaxis = reordercats(xaxis,{'Bernice','Lin','Ettore','John'});
yaxis = [mB mL mE mJ];
bar(xaxis,yaxis)

%% t test 
%{
% t test for area
hBernice = alldata(strcmp(alldata.speaker,'bernice'),6);
hLin = alldata(strcmp(alldata.speaker,'lin'),6);
[h,p] = ttest(hBernice.Area,hLin.Area)

hEttore = alldata(strcmp(alldata.speaker,'ettore'),6);
hJohn = alldata(strcmp(alldata.speaker,'john'),6);
[h,p] = ttest2(hEttore.Area,hJohn.Area)

% t test for width
wBernice = alldata(strcmp(alldata.speaker,'bernice'),4);
wLin = alldata(strcmp(alldata.speaker,'lin'),4);
[h,p] = ttest2(wBernice.Width,wLin.Width)

wEttore = alldata(strcmp(alldata.speaker,'ettore'),4);
wJohn = alldata(strcmp(alldata.speaker,'john'),4);
[h,p] = ttest2(wEttore.Width,wJohn.Width)

% t test for height
heiBernice = alldata(strcmp(alldata.speaker,'bernice'),5);
heiLin = alldata(strcmp(alldata.speaker,'lin'),5);
[h,p] = ttest2(heiBernice.Height,heiLin.Height)

heiEttore = alldata(strcmp(alldata.speaker,'ettore'),5);
heiJohn = alldata(strcmp(alldata.speaker,'john'),5);
[h,p] = ttest2(heiEttore.Height,heiJohn.Height)
%}
