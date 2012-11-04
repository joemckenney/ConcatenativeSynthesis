function [signal] = to_mono(signal)
%   By:
%   Joseph McKenney
%   Mills College, Oakland, CA
%   12-Oct-2012
    
    if (size(signal,2) > 1)
		fprintf('::: signal is being converted to mono...\n');
        signal = sum(signal, 2) ./ size(signal, 2);
	end
end

