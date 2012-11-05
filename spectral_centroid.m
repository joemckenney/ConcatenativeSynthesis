function [C] = spectral_centroid(slice,fs,nfft)
%   By:
%   Joseph McKenney
%   Mills College, Oakland, CA
%   4-Nov-2012
    s = specgram(slice, nfft, fs);
    C = sum((repmat((1:size(s,1))',1,size(s,2)) .* abs(s))) ./ sum(abs(s));
end