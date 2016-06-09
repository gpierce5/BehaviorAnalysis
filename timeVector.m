function [t, dt] = timeVector( signal, samplingRate )
%timeVector Returns a time vector in ms given a sampling rate in hz
%   

dt = 1000*(1/samplingRate);
t=0:dt:(length(signal)-1)*dt;


end

