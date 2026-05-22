function [X,Y] = ramp(a,b,muestras,tam_extra)

if nargin < 2
    error("Noy enought arguments.")
end

if nargin < 3
    muestras = 1000;
end

if nargin < 4
    tam_extra = (d-a) / 2;
end

if a > b
    error("a,b have to be in order.")
end

X = linspace(a-tam_extra,b+tam_extra,muestras);

Y = [
    zeros(1,sum(X <= a)) ...
    (X(X > a & X < b) - a) / (b - a) ...
    ones(1,sum(X >= b))
];
