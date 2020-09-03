function M = covMatrix(x,y,varargin)

corrM = corr(x,y,varargin{:});

norm_x = nanstd(x);% * sqrt((n_x-1));
norm_y = nanstd(y); %* sqrt((n_y-1));

for i = 1:size(x,2)
     M(i,:) = corrM(i,:)*norm_x(i);     
end

for i = 1:size(y,2)
     M(:,i) = M(:,i)*norm_y(i);     
end

%M = M/N;