function resultant = discretize_load(p, L, w0)
% Description: discretize_load takes in values for p, L, and w0 and
% calculates resultant forces and centroids of a given (linear) distributed load function.
%
% Inputs: p -> number of sections
%         L -> constant (length of spar)
%         w0 -> height of distributed load triangle
%
% Outputs: matrix of resultant forces and corresponding centroids

% I used a trapezoid approximation as it would give me an exact solution.
% I calculated the centroid of each piece using (h/3) * (b + 2a / a + b)
% where h = dx, b is the height ofe one side and a is the height of the other side.
% I assumed that the distributed load acted entirely vertical and that the distributed load function was continuous. 

% preallocate for resultant forces and centroids
resultant = zeros(p,2);

% constant
delta_x = L/p;

% constantly spaced vector
x = 0:L/p:L;

% anonymous function handle for distrbuted load
w_l = @(x) w0 * (1 - (x / L));

% calculate height of triangle at specific points
y_height = w_l(x);

% calculate resultant force and centroid
for i = 1:p
     resultant(i,1) = .5 * (y_height(i) + y_height(i + 1)) * delta_x;
     resultant(i,2) = (delta_x / 3) * ((2 * (y_height(i + 1)) + (y_height(i))) / (y_height(i) + y_height(i + 1))) + x(i);
end   
end
