function binary = times2Binary(eventTimes,alignmemtTime,window)

% times2Binary converts time stamps to binary (raster) vectors.
%
% Inputs:
%   eventTimes - The time of the events (relative to the trial onset or the 
%                onset of data collection - in the case of extended data).
%   alignmentTime - The time of the event within the trial to which to 
%                   align the events (relative to the same onset as eventTimes).
%   window - The window of time to create around the event.
%
% Output:
%   binary - A binary vector, representing the raster of the events from 
%   eventTimes in the window around alignmentTime.
%
% If alignmentTime is NaN, the binary vector will be NaN-filled.
%

if isnan(alignmemtTime)
    binary = nan (length(window),1);
    return
end

eventTimes = eventTimes - alignmemtTime;
eventInds = ceil(eventTimes);
eventInds = intersect(eventInds,window);
binary = zeros (length(window),1);
binary(eventInds-min(window)+1) = 1;
