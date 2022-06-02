function SEM = nanSEM(M,dim)

if ~(exist('dim','var')==1)
    
    if sum(size(M)>1)==1
        dim = find(size(M)>1);
    else
        dim=1;
    end
    
end
STD = nanstd(M,1,dim);
normalization = sqrt(sum(~isnan(M),dim));
SEM = STD./normalization;
