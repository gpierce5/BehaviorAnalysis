function [t, dt] = timeVector( signal, samplingRate )
%timeVector Returns a time vector in ms given a sampling rate in hz
%   

dt = 1000*(1/samplingRate);
t=dt:dt:(length(signal))*dt;


end

