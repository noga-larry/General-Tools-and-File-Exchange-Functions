function M = covMatrix(x,y,varargin)

corrM = corr(x,y,varargin{:});

n_x = size(x,2);
norm_x = nanstd(x);% * sqrt((n_x-1));
n_y = size(x,2);
norm_y = nanstd(y); %* sqrt((n_y-1));
N = size(x,1);
for i = 1:size(x,2)
     M(i,:) = corrM(i,:)*norm_x(i);     
end

for i = 1:size(y,2)
     M(:,i) = corrM(:,i)*norm_y(i);     
end

%M = M/N;