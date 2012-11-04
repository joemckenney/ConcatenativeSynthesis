function [n_zero_cross] = zero_crossings(x)
%   By:
%   Joseph McKenney
%   Mills College, Oakland, CA
%   12-Oct-2012

sigLen=length(x);         

%might not need to store indicies 
crossings = zeros(sigLen/4,1);
j = 1;
for i=2:sigLen-1
    if (sign(x(i)) ~= sign(x(i-1)))
        crossings(j) = i;    
        j=j+1; 
    end
end    

crossings(crossings==0)=[];
n_zero_cross = length(crossings);

%debugging
%disp(n_zero_cross);

end


