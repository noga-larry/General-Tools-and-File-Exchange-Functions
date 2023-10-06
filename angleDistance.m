function dist = angleDistance(x,y)

% Calculates the difference between two angles (x and y), as a number 
% between 0 and 180. 

dist = min(mod((x-y),180),mod((y-x),180));

end