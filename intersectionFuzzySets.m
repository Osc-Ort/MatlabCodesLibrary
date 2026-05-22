function T = intersectionFuzzySets(X,Y,type)

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
    case "minimum"
        T = min(X,Y);
    case "product"
        T = X .* Y;
    case "Lukasiewicz"
        T = max(0,X+Y-1);
    case "drastic"
        T = zeros(size(X));
        x1 = find(X == 1);
        y1 = find(Y == 1);
        T(x1) = Y(x1);
        T(y1) = X(y1);
    otherwise
        error("Not valid type of intersection, must be minimum, product, Lukasiewicz or drastic.")
end
