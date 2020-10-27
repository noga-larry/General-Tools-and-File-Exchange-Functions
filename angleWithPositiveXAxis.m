function theta = angleWithPositiveXAxis(h,v)
%   This function returns the angle with positive X axis in a range [0,360)
    theta = mod(180*angle([h+i*v])/pi,360);
end