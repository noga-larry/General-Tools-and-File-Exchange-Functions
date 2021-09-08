function binary = times2Binary(eventTimes,alignmemtTime,window,len)

ts = alignmemtTime + window;
eventInds = ceil(eventTimes);
eventInds(eventInds==0) = 1; % if an event is at time 0, move to 1.
binary = zeros (len,1);
binary(eventInds) = 1;
binary = binary (ts);