function [counts,centers] = plotHistForFC(trace,centers,varargin)


isCDF = false;
if any(strcmp(varargin,'cdf'))
    isCDF = true;
    varargin = setdiff(varargin, 'cdf');
end

isNormalized = true;
if any(strcmp(varargin,'unNormalized'))
    isNormalized = false;
    varargin = setdiff(varargin, 'unNormalized');
end

[counts, centers] = hist(trace, centers);
%centers = 0.5*(edges(1:end-1)+edges(2:end));
if isNormalized
    counts = counts/sum(counts);
end
if isCDF
    counts = cumsum(counts,'reverse');
end
plot(centers, counts,varargin{:});




