function [rx, ry, ma] = wall_reactions(forces)
% Description: wall_reactions calculates the reaction forces at the origin
% (fuselage) of a spar
%
% Inputs: forces -> matrix of resultant forces and centroids calculated from
% a distributed load function
%
% Outputs: rx -> reaction force in x-direction
%          ry -> reaction force in y-direction
%          ma -> reaction moment

    rx = 0;
    ry = sum(forces(:,1));
    ma = sum(forces(:,1) .* forces(:,2));

end
