function binary = times2Binary(eventTimes,alignmemtTime,window)

eventTimes = eventTimes - alignmemtTime;
eventInds = ceil(eventTimes);
eventInds = intersect(eventInds,window);
binary = zeros (length(window),1);
binary(eventInds-min(window)+1) = 1;
