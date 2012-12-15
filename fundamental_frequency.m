function [fund_freq] = fundamental_frequency(slice, fs)
%   By:
%   Joseph McKenney
%   Mills College, Oakland, CA
%   12-Oct-2012

    X = fft(slice);
    plot(abs(X(1:end/2+1)));
    f = linspace(0, fs, length(X));
    magnitude = abs(X);
    magnitude = magnitude(1:end/2+1);
    peaks = (magnitude(1:end-2) < magnitude(2:end-1)) & magnitude(2:end-1) > magnitude(3:end);
    peaks = peaks & magnitude(2:end-1) > 0.5;
    fund_freq = f(peaks);
    %disp(fund_freq)
end
