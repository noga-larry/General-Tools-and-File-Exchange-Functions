function returnTrace = ...
    runningWindowFunction(trace,func,windowSize)

edgeSize = ceil(windowSize/2);
runningWindow = -edgeSize:edgeSize;
centers = (edgeSize+1):(size(trace,1)-edgeSize);
returnTrace = nan(length(centers),1);

for i = 1:length(centers)
    slicedTrace = trace(centers(i)+runningWindow,:);
    returnTrace(i) = func(slicedTrace);
end
    

