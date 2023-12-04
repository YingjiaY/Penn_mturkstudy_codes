userpath = ('/Users/beauchamplab/Desktop/time_course');
moviename = importdata('time_course/rename.xlsx');

for i = 2:length(moviename)
    moviesplit = moviename{i,1};
    moviesplit = erase(moviesplit,'.mp4');
    split = lower(strsplit(moviesplit,"_"));
    moviename{i,2} = split{1};
    moviename{i,3} = split{2};
%     disp(split);
end

writetable(cell2table(moviename),'/Users/beauchamplab/Desktop/time_course/rename.xlsx');
