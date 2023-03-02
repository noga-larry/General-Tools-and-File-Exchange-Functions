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
crossIndices = find(diff(sign(vector - threshold)));

% Check if there are any crossing areas
if isempty(crossIndices)
    crossAreas = [];
    return
end

% Check if the first crossing is a crossing down or up
if sign(vector(crossIndices(1))) < 0
    crossIndices = crossIndices(2:end);
end

% Check if the last crossing is a crossing down or up
if sign(vector(crossIndices(end))) > 0
    crossIndices = crossIndices(1:end-1);
end

% Reshape the indices into pairs of start and end indices
crossAreas = reshape(crossIndices, 2, [])';

end