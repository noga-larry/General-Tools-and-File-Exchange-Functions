function [Msum,normalization] = matricesNanAdd2D(M1,M2)

% This function adds to matrics M1 and M2 that have dimensionality mXn (2d)
% matrices) ignoring NaN values. It returns the sum of the matrices, Msum
% aswell as a normalization matrix, normalization, that can be used to
% calculate the mean. That is the mean of the two matrices is 
% Msum./normalization.


% make sure martices are the same size
assert(~any(size(M1)~=size(M2)))

tmp = cat(3,M1,M2); 
Msum = nansum(tmp,3);

normalization = (~isnan(M1))+(~isnan(M2));


end