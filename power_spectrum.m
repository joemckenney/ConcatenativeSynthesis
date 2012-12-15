function [f, magnitude] = power_spectrum(slice, fs)
%   By:
%   Joseph McKenney
%   Mills College, Oakland, CA
%   12-Oct-2012

    fftslice = fft(slice);
    
    % FFT is symmetric about the nyquist frequency, i.e. fs/2
	ft = fftslice(1:ceil((slice+1)/2));
    
	nfft = length(slice);

    magnitude = abs(ft)/nfft;

    magnitude = magnitude.^2;
    
    magnitude(2:end-1) = magnitude(2:end-1)*2; 
    
    %frequency vector
    f = (0:nfft-1)*fs/nfft; 
 
    %debugging
    plot(f, magnitude);
end


