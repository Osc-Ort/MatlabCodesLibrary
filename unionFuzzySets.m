function T = unionFuzzySets(X,Y,type)

if nargin < 3
    error("Wrong number of arguments.")
end

if ~isstring(type)
    error("Type must be a string.")
end

if ~isequal(size(X), size(Y)) || any(X > 1 | X < 0) || any(Y > 1 | Y < 0)
    error("Both sets must be normalized and with the same size.")
end


switch type
    case "maximum"
        T = max(X,Y);
    case "sum-product"
        T = X + Y - X .* Y;
    case "Lukasiewicz"
        T = min(1,X+Y);
    case "drastic"
        T = ones(size(X));
        x1 = find(X == 0);
        y1 = find(Y == 0);
        T(x1) = Y(x1);
        T(y1) = X(y1);
    otherwise
        error("Not valid type of intersection, must be maximum, sum-product, Lukasiewicz or drastic.")
end
