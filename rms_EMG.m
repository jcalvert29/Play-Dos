function      RMS_EMG = rms_EMG(EMGdata)
% Jonathan Calvert
% Last Updated January 5 2022
% Neuromotion Laboratory

% This function takes in EMG data and calculates the root mean square of
% the EMG data. 

% Parameters of RMS calculation
windowlength = 40; 
overlap=20;
zeropad = 1;
delta = windowlength - overlap;
% Define indices
indices = 1:delta:length(EMGdata);
% Zeropad the data if necessary
if length(EMGdata) - indices(end) + 1 < windowlength
    if zeropad
        EMGdata(end+1:indices(end)+windowlength-1) = 0;
    else
        indices = indices(1:find(indices+windowlength-1 <= length(EMGdata{j,i}), 1, 'last'));
    end
end
% Square the samples
EMGdata = EMGdata.^2;
index = 0;
for k =indices
    index = index+1;
    % Average and take the square root of each window
    RMS_EMG(index) = sqrt(mean(EMGdata(k:k+windowlength-1)));
end
