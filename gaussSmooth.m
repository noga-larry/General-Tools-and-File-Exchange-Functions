function [ smoothed_vec ] = gaussSmooth(vec, SD)
% Gassian smoothing of an array (vec) with standard deviation (SD)

smoothed_vec = smoothdata(vec,'gaussian',SD*5,'includenan'); 
% The SD is set to be 1/5 of the window size.


end

