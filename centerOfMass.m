function [PD,ind_PD,PD_exact] = centerOfMass (TC, directions)
% This function finds the PD of a cll given its tuning curve and the
% experimantal directions using the center of mass.
% Inputs:    TC         The tuning curce of the cell
%            directions A vector of the directions in the same order as TC. 
% Outputs:   PD         The nearest direction to the preferred direction of
%                       the cell as calculated by the center of mass.
% Outputs:   ind_PD         The nearest direction to the preferred direction of
%                       the cell as calculated by the center of mass.

v_x = cosd(directions)*TC;
v_y = sind(directions)*TC;
PD_exact = mod(atan2d(v_y,v_x),360);
dist = abs(directions-PD_exact);
[~,ind_PD] = min(dist);
PD = directions(ind_PD);