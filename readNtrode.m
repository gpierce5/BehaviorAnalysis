function [ traces ] = readNtrode(filepath,ntrodefile, signal)
%readNtrode IN PROGRESS
%   readNtrode(filepath, ntrodefile) will read the ntrode files from that session. 
%   It will look for signal names included in the file
%   behavior_signals.mat.
%
%   readNtrode(filepath, signal) will read only the particular signal.
%   Signal should be a cell array of with each cell containing a string of
%   the signal(s) you want to read

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

