function [z] = window_signal(signal, fs, windowing_function, nfft, hop_size)
%   By:
%   Joseph McKenney
%   Mills College, Oakland, CA
%   12-Oct-2012	
%
%   
%   signal: input signal
%   fs: sampling frequency 
%   window_tpye: windowing function to be applied to each slice    
%   nfft: width, in sample, of each window
%   hop_size: the percentage overlap 
%

    signal 		= to_mono(signal);
    signal      = remove_dc_offset(signal);
	windowing_function = lower(windowing_function);
	signal_len	= length(signal); 
	
	if(~power_of_two(nfft))
		nfft=2^nextpow2(nfft);
    end          
    
    %determine potential length of result
    windows = ceil(signal_len/nfft);
    windows =  windows * ceil(1 / hop_size);
    potential_length = windows * nfft;
    
    z = zeros(potential_length, 1); 
    display(length(z));
        
    window_data = apply_window(windowing_function, nfft);

    i = 0;
    j = 0;
    row = 1;
    while i<signal_len-nfft;
	    slice = signal(i+1:i+nfft).*window_data;
        
        %.:...... under construction
        %:: start feature vector creation process
        %feature_vector = build_feature_vector(slice, fs);
        %feature_matrix(row,:) = feature_vector; 
        row = row+1;
		
        z(j+1:j+nfft) = slice;
		j = j + nfft;
        i = i + nfft*hop_size;
        
    end
end
