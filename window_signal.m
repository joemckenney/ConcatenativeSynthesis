%   By:
%   Joseph McKenney
%   Mills College, Oakland, CA
%   12-Oct-2012 
%
%   
%   @params signal: input signal
%   @params fs: sampling frequency 
%   @params win_fn: windowing function to be applied to each slice    
%   @params nfft: width, in sample, of each window
%   @params hop_size: the percentage overlap 
%
function [z] = window_signal(signal, fs, win_fn, nfft, hop_size)
    signal 		= to_mono(signal);
    signal      = remove_dc_offset(signal);
	win_fn      = lower(win_fn);
	signal_len	= length(signal); 
	
	if(~power_of_two(nfft))
		nfft=2^nextpow2(nfft);
    end          
    
    %determine potential length of result
    windows = ceil(signal_len/nfft);
    windows =  windows * ceil(1 / hop_size);
    potential_length = windows * nfft;
    
    z = zeros(potential_length, 1); 
    
    %debugging
    %display(length(z));
        
    window_data = apply_window(win_fn, nfft);

    i = 0;
    j = 0;
    row = 1;
    while i<signal_len-nfft;
	    slice = signal(i+1:i+nfft).*window_data;
        
        %.:...... under construction........................
        %::
            feature_vector = build_feature_vector(slice, fs);
            feature_matrix(row,:) = feature_vector; 
            disp(feature_matrix);
            row = row+1;
		%::.................................................
        z(j+1:j+nfft) = slice;
		j = j + nfft;
        i = i + nfft*hop_size;
    end
end
