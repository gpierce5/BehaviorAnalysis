function [ traces ] = readNtrode(filepath,ntrodefile, signal)
%readNtrode IN PROGRESS
%   readNtrode(filepath) will read all ntrode files located in a folder
%   of a single session. It will look for signal names included in the file
%   behavior_signals.mat
%
%   readNtrode(filepath, signal) will read only the particular signal.
%   Signal should be a cell array of with each cell containing a string of
%   the signal(s) you want to read
%   added a mandatory second term, ntrodefile, so program will work if
%   files are not named the same as the typical

switch nargin
    case 2
        load('D:\Data\behavior_signals.mat');
    case 3
        behavior_signals = signal;
end

for i=1:length(behavior_signals)
    fname = [ntrodefile '-' behavior_signals{i} '.dat'];
    sig(:,i) = double(readContinuousDAT([filepath fname]));
end

traces=array2table(sig);
traces.Properties.VariableNames=behavior_signals;

end

