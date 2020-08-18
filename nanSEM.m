function SEM = nanSEM(M,dim)

if ~(exist('dim','var')==1)
    dim=1;
end
STD = nanstd(M,1,dim);
normalization = sqrt(sum(~isnan(M),dim));
SEM = STD./normalization;
