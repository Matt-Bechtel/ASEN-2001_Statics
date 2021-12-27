function moment_err = moment_error(resultant, L, w0)
% Description: moment_error calculates the error in the bending moment 
% calculated from a matrix of resultant forces and centroids. 
% Inputs: resultant -> matrix of resultant forces and respective centroids
%         L -> constant (length of spar)
%         w0 -> constant (height of triangle for distributed load)
% outputs: moment_err -> value for error
x = (3/16) * L;

%anonymous function handle for bending moment equation
m_dist = @(x) w0 * ((1/2) * x^2 - (1 / (6*L)) * x^3 - (1/2) * (x * L)) + ((w0 * L^2) / 6);

%all indices
index = find(resultant(:,2) >= x);

%calculate both exact moment and point moment
m_point = sum(resultant(index,1) .* (resultant(index,2) - x));
m_dist_x = m_dist(x)

moment_err = abs(m_point - m_dist_x);

end