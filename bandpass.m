function [ filtered ] = bandpass( signal, cutoffFreq, samplingRate )
%bandpass bandpass filter a signal
%   cuttoffFreq =[low high] is the low and high pass cutoffs, will keep frequencies
%   between the two values

cfreq = cutoffFreq/samplingRate;
[b,a] = butter(1,[cfreq],'bandpass');
filtered = filtfilt(b,a,signal);

end

