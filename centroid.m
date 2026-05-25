function C = centroid(X,Y)

if nargin < 2 
    error("Wrong number of arguments.")
end

C = sum(X .* Y) / sum(Y);