function [feature_vector] = build_feature_vector(slice, fs)
%   By:
%   Joseph McKenney
%   Mills College, Oakland, CA
%   12-Oct-2012
%
%   @params slice: window of the signal, with windowing function applied
%   @params fs: sampling frequency
%
% 
   feature_vector{1} = zero_crossings(slice);
   feature_vector{2} = fundamental_frequency(slice, fs);
   feature_vector{3} = rms(slice);
   feature_vector{4} = power_spectrum(slice, fs);
   feature_vector{5} = spectral_centroid(slice, fs, length(slice));

   %feature_vector(6) = unsure.. 
    
end

