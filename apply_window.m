function [window_data] = apply_window(windowing_function, nfft)
%   By:
%   Joseph McKenney
%   Mills College, Oakland, CA
%   12-Oct-2012
%
%   windowing_function: string window type to be matched to availabel
%                       windowing functions.  
%

    switch windowing_function
        case 'triangle'
            window_data = window(@triang, nfft);
        case 'rectangle'
            window_data = window(@rectwin, nfft);
        case 'hamming'
            window_data = window(@hamming, nfft);
        case 'gaussian'
            window_data = window(@gausswin, nfft,2.5);
        case 'kaiser'
            window_data = window(@kaiser, nfft,5);
        case 'bartlett'
            window_data = window(@bartlett, nfft);
        case 'blackman-harris'
            window_data = window(@blackmanharris, nfft);
        case 'hann'
            window_data = window(@hann, nfft);
		case 'tukey, 0.75'
			window_data = window(@tukeywin, nfft, 0.75);
		case 'tukey, 0.5'
			window_data = window(@tukeywin, nfft, 0.5);
		case 'tukey, 0.25'
			window_data = window(@tukeywin, nfft, 0.25);
        otherwise
			fprintf('Window %s is invalid! Defaulting to hamming\n', shape);
            window_data = window(@hamming, num_samples);
    end

end

