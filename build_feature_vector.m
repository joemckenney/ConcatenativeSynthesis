function [feature_vector] = build_feature_vector(slice, fs)
%   By:
%   Joseph McKenney
%   Mills College, Oakland, CA
%   12-Oct-2012

   %construction by joe  
   feature_vector = 1:1:6;
   feature_vector(1) = zero_crossings(slice);
   feature_vector(2) = fundamental_frequency(slice, fs);
  
    
end

