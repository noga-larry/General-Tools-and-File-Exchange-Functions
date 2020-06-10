function plotHistForFC(trace,bins,varargin)

[counts,centers] = hist(trace, bins);
%centers = 0.5*(edges(1:end-1)+edges(2:end));
counts = counts/sum(counts);
plot(centers, counts,varargin{:});


