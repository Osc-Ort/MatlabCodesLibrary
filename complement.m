function [X,Y] = complement(X,Y) 

if nargin < 2 
    error("Worng number of arguments")
end

Y = fliplr(Y);