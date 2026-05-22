function [X,Y] = trapezoidal(a,b,c,d,muestras,tam_extra)

if nargin < 4
    error("Noy enought arguments.")
end

if nargin < 5
    muestras = 1000;
end

if nargin < 6
    tam_extra = (d-a) / 2;
end

if ~(a <= b && b <= c && c <= d)
    error("a,b,c,d have to be in order.")
end

X = linspace(a-tam_extra,d+tam_extra,muestras);

Y = [
    zeros(1,sum(X <= a)) ...
    (X(X > a & X <= b) - a) / (b - a) ...
    ones(1,sum(X > b & X < c)) ...
    (d - X(X >= c & X < d)) / (d - c) ...
    zeros(1,sum(X >= d))
];
