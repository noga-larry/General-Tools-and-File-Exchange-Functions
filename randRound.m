function intX = randRound(x)

% This function rounds x so that if x=0.5 its value is 1 or 0 with equal
% probability


intX = round(x);
inxMiddel = find(rem(x,1)==0.5);
intX(inxMiddel) = round(x(inxMiddel)+rand(size(inxMiddel))-0.5);