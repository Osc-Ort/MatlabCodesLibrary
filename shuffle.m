function [varargout] = shuffle(varargin)

numArgs = length(varargin);

if numArgs < 1
    error("Must be at least one argument.")
end

sF = size(varargin{1}, 2); 

for i = 2:numArgs
    if size(varargin{i}, 2) ~= sF
        error("All variables must have the same number of columns.")
    end
end

ord = randperm(sF);

varargout = cell(1, numArgs); 

for i = 1:numArgs
    m = varargin{i};
    varargout{i} = m(:,ord); 
end
