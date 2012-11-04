function [x] = remove_dc_offset(x)
%   By:
%   Joseph McKenney
%   Mills College, Oakland, CA
%   12-Oct-2012    
    fprintf('::: removing dc offset...\n');
    x = x - mean(x);
end

