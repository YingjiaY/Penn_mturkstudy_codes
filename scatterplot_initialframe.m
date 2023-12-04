clear all
userpath = ('/Users/izzieyu/Desktop/test/scatterplot_use');
% alldata = readtable('scatterplot_use/allstim_forplot.xlsx');
alldata = readtable('scatterplot_use/area_initialframe.xlsx');


L = length(alldata.speaker);
for i = 1:L
    x_ber = table2array(alldata(strcmp(alldata.speaker,'bernice'),4));
    y_ber = table2array(alldata(strcmp(alldata.speaker,'bernice'),5));
    x_lin = table2array(alldata(strcmp(alldata.speaker,'lin'),4));
    y_lin = table2array(alldata(strcmp(alldata.speaker,'lin'),5));
    x_ett = table2array(alldata(strcmp(alldata.speaker,'ettore'),4));
    y_ett = table2array(alldata(strcmp(alldata.speaker,'ettore'),5));
    x_john = table2array(alldata(strcmp(alldata.speaker,'john'),4));
    y_john = table2array(alldata(strcmp(alldata.speaker,'john'),5));
    % area
    Aber = table2array(alldata(strcmp(alldata.speaker,'bernice'),6));
    Alin = table2array(alldata(strcmp(alldata.speaker,'lin'),6));
    Aett = table2array(alldata(strcmp(alldata.speaker,'ettore'),6));
    Ajohn = table2array(alldata(strcmp(alldata.speaker,'john'),6));
end
%%

figure(1)
subplot(2,1,1)
scatter(x_ber,y_ber,'filled')
hold on 
scatter(x_lin,y_lin,'filled')
xlabel('width')
ylabel('height')
legend('Bernice','Lin')

subplot(2,1,2)
scatter(x_ett,y_ett,'filled')
hold on 
scatter(x_john,y_john,'filled')
xlabel('width')
ylabel('height')
legend('Ettore','John')
%% jali against face as x and y scatterplot
figure(2)
subplot(2,1,1)
% f = polyfit(Aber,Alin,1);
% p = polyval(f,Aber);
scatter(Aber,Alin)
hold on 
y = Aber;
plot(Aber,y)
% plot(Aber,p,'-')
xlabel('mouth area for jali')
ylabel('mouth area for real')
legend('female')

subplot(2,1,2)
% f = polyfit(Aett,Ajohn,1);
% p = polyval(f,Aett);
scatter(Aett,Ajohn)
hold on 
y = Aett;
plot(Aett,y)
% plot(Aett,p,'-')
xlabel('mouth area for jali')
ylabel('mouth area for real')
legend('male')