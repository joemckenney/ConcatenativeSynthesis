function z = powerOfTwo(x)
%   By:
%   Joseph McKenney
%   Mills College, Oakland, CA
%   12-Oct-2012    
    if(x ~= 0 && (bitand(x, (x - 1)) == 0))
        z = 1;
    else
        z = 0;
    end
end
