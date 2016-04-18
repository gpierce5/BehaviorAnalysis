function [ d ] = dPrime( signal, response )
%dPrime Calculate d prime
%   input logicals for signal present and mouse responded

if isempty(signal)
    error('Signal vector is empty')
elseif isempty(response)
    error('Response vector is empty')
end

presentANDresponded = signal & response;
notpresentANDresponded = (~signal) & response;

hits = sum(presentANDresponded)/sum(signal);
FAs = sum(notpresentANDresponded)/sum(~signal);

%set a minimum and maximum for probability of hits and FAs so that you
%don't hit infinity or NaN
numtrials = length(signal);
Pmax = (numtrials - 1)/numtrials;
Pmin = 1/numtrials;
hits(hits>Pmax) = Pmax;
FAs(FAs>Pmax) = Pmax;
hits(hits<Pmin) = Pmin;
FAs(FAs<Pmin) = Pmin;

%calculate d prime using Z scores of hit and FA probability
d = norminv(hits)-norminv(FAs);


end

