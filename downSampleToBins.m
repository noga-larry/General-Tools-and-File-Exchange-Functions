function binnedTrace = downSampleToBins(trace,binSz)

trace = trace';
totalTimeWithRem = size(trace,1);
numTrials = size(trace,2);
trace = trace(1:(totalTimeWithRem-rem(totalTimeWithRem,binSz)),:);
totalTime = size(trace,1);
binnedTrace = reshape(trace,binSz,totalTime/binSz,numTrials);
if numTrials>1
    binnedTrace = squeeze(mean(binnedTrace,1))';
else
    binnedTrace = squeeze(mean(binnedTrace,1));
end