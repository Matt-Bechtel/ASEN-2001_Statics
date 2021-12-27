close all
clear
clc

format longG

%% constants
L = 27.25;     %[ft]
w0 = 2001;     %[lb/ft]

%% loop
%preallocate for vectors of errors
err_vec = zeros(1, 30);
%evenly spaced vector from 1 through 30 for p
p = 1:1:30;

%function calls while iterating through p
for i = 1:30
    err_vec(i) = moment_error(discretize_load(p(i), L, w0), L, w0); 
end   

% function call for wall reactions
[rx, ry, rm] = wall_reactions(discretize_load(10, L, w0));

%% Plots
plot(p, err_vec)
legend("Error")
title("Number of Sections vs Error")
xlabel("Number of Sections")
ylabel("Error")
