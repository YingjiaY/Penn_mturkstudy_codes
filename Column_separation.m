userpath = ('/Users/beauchamplab/Dropbox (PennNeurosurgery)/BeauchampLabAtPenn/JALI_mTurk_experiment/result_analysis/pixel_plotting/plotting');
speaker_all = importdata('plotting/all_measurements.xlsx');
speaker_calculate = speaker_all(:,1);
%% get column separated
% columns for comparison
measurement_type = speaker_all(strcmp(speaker_all.measurement_type,'face'));
selectrows = speaker_all.textdata(2:end,measurement_type);
selectcols = 6:9;

% [rows, cols] = size(speaker_all);
for i = 2:selectrows
    k = 0;
    for j = 2:selectcols %length(Ettore_all)
        speaker_axis = speaker_all{i,j};
        erase_cell = {'(',')'};
        speaker_axis = erase(speaker_axis,erase_cell);
        split = strsplit(speaker_axis,", ");
        speaker_calculate{i,j+k} = split{1};
        k = k + 1;
        speaker_calculate{i,j+k} = split{2};
    end
end
%% rename first row
k = 0;
for i = 2:cols
    speaker_calculate{1,i+k} = speaker_all{1,i}+" x";
    k = k + 1;
    speaker_calculate{1,i+k} = speaker_all{1,i}+" y";
end


output = 'all_speaker_face_height.xlsx';
writecell(speaker_calculate,output,'Sheet','face','Range','A1');



