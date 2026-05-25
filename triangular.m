function [X,Y] = triangular(a,m,b,muestras,tam_extra)

if nargin < 3
    error("Noy enought arguments.")
end

if nargin < 4
    muestras = 1000;
end

if nargin < 5
    tam_extra = (d-a) / 2;
end

if a > b || a > m || b < m
    error("a,m,b have to be in order.")
end

X = linspace(a - tam_extra,b + tam_extra,muestras);

Y = [ 
    zeros(1,sum(X <= a)) ...
    ((X(X > a & X <= m) - a)) / (m - a) ...
    (b - (X(X > m & X < b))) / (b - m) ...
    zeros(1,sum(X >= b))
];