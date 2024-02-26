clc
clear all
close all

% Directory setting
oldFolder = cd()
cd '/Users/beauchamplab/Desktop/test'

%% file format conversion
% convert all mp4 to wav
stimuli_list = dir(['*.mp4']);
for i = 1:numel(stimuli_list)
    filename = stimuli_list(i).name;
    [~, name, ~] = fileparts(filename); 

    if endsWith(filename, '.mp4')
        ffmpeg_path = '/opt/homebrew/bin/ffmpeg';
        convert = sprintf('%s -i "%s" "%s.wav"', ffmpeg_path, fullfile(cd, filename), fullfile(cd, name));
        system(convert);
    end

end

%% Normalization 

%now, take care of the wav files for normalization 
data_files = dir(['*.wav']);
data_files = {data_files(:).name}';

% Normalize
for i = 1:numel(data_files)
    
    [aud,fs] = audioread(data_files{i});

     % Check channels: If audio has only one channel, duplicate it to make stereo
    if size(aud, 2) == 1
        aud = [aud, aud];
    end
    
    % Normalize original audio by channel
    aud_c1 = aud(:,1)/max(abs(aud(:,1)));
    aud_c2 = aud(:,2)/max(abs(aud(:,2)));
    aud_n = [aud_c1,aud_c2];

    % Data name
    [~, name_n, ~] = fileparts(data_files{i});

    audiowrite([name_n '_norm.wav'],aud_n,fs);
    
end
