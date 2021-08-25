function returnTrace = ...
    runningWindowFunction(trace,func,windowSize, dimReturn)

if ~exist('dimReturn','var')
    dimReturn = 1;
end
    
edgeSize = ceil(windowSize/2);
runningWindow = -edgeSize:edgeSize;
centers = (edgeSize+1):(size(trace,1)-edgeSize);
returnTrace = nan(length(centers),dimReturn);

for i = 1:length(centers)
    slicedTrace = trace(centers(i)+runningWindow,:);
    returnTrace(i,:) = func(slicedTrace);
end
    

