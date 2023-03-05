function [crossAreas] = findCrossAreas(vector, threshold)
% This function finds areas in a vector in which the values cross a
% threshold and then cross back.
% Inputs:
%   vector - the input vector to analyze
%   threshold - the threshold value
% Outputs:
%   crossAreas - a matrix where each row represents a crossing area,
%   with the first column indicating the start index and the second column
%   indicating the end index of the area.

% Find where the vector crosses the threshold
crossIndices = find(diff((vector - threshold)>0));

% Check if there are any crossing areas
if isempty(crossIndices)
    crossAreas = [];
    return
end

% check if begins with crossing
if (vector(1) - threshold(1)) > 0 
    crossIndices = [1 crossIndices];
end

% check if ends with crossing
if (vector(end) - threshold(end)) > 0 
    crossIndices = [crossIndices length(vector)];
end

% Reshape the indices into pairs of start and end indices
crossAreas = reshape(crossIndices, 2, [])';

end