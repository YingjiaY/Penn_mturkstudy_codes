clear all
% clc
%% transpose response sheet format vertically to one criteria per column

userpath = ('/Users/beauchamplab/Dropbox (PennNeurosurgery)/BeauchampLabAtPenn/JALI_mTurk_experiment/result_analysis/analysis');
% alldata = cell2table(readcell('transpose/original_result.csv'));
% transposed_alldata = rows2vars(alldata);
% transposed_alldata = transposed_alldata(2:end,2:4);%delete irrelavant rows and cols
% transposed_alldata = renamevars(transposed_alldata,"Var1",'participant_no');
% writetable(transposed_alldata, 'transposed_result.csv');

%% matching columns based on S3 link and write all relative information in a new sheet 
% take file data from relative dir and read as tables;
moviekey = readtable('analysis/movielist_batch.csv');
% extract_batch = moviekey(moviekey.batch == 3,:);
% extract_catch = moviekey(moviekey.batch == 0,:);
% 
% output = 'extract_batch_3.xlsx';
% writetable(extract_batch,output,'Range','A1');

%% Import data that needs to be matched. R as response, B as batch 
[~, tR] = xlsread('analysis/transposed_batch_2.xlsx');
[~, tB] = xlsread('analysis/extract_batch_2.xlsx');

% matched columns based on S3link from two sheets (column3)
match_col_R = 3;
match_col_B = 3;
insert_cols_B = [1, 2, 4, 5];
insert_cols_R = [1, 2, 4, 5];% put in new response sheet column []

% Create a new cell array to store matched data
matched_data = cell(size(tR, 1), size(tR, 2) + size(tB, 2) - 1);

%% Iterate through each row in tR
for i = 1:size(tR, 1)
    % This is the S3 link column from response sheet, in cell
    match_R = tR{i, match_col_R};
    % Find the matching column in batch sheet
    match_B = find(strcmp(tB(:, match_col_B), match_R));
    
    if ~isempty(match_B)
        % If a match is found, copy the corresponding other rows from batch sheet
        matched_data(i, insert_cols_R) = tB(match_B, insert_cols_B);
        
    %{
    else
        % If no match is found, leave the corresponding row empty
        matched_data(i, :) = table2cell([tR(i, :), repmat({''}, 1, size(tB, 2))]);
    %}
    end
end

writecell(matched_data,'matched_batch_2.csv');
