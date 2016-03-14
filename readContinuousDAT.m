function [trace] = readContinuousDAT(fpath)
%readContinuousDAT - Read ntrode .dat files into matlab variable
%
%Output:
%   -trace in single format

switch nargin
    case 0
        [filename pathname] = uigetfile('D:\Data\*.dat', 'Select a .dat file to read');
        filepath = [pathname filename];
    case 1
        filepath = fpath;
end


[fid, message] = fopen(filepath, 'r', 'b');
[headerSize, header] = SkipHeader(fid);
trace = fread(fid,'*float32');
fclose(fid);

end