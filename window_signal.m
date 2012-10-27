% Need to add overlap functionality

function [z] = window_signal(signal, window_type, window_len)

	signal 		= to_mono(signal);
	window_type = lower(window_type)
	signal_len	= length(signal); 
	
	if(~power_of_two(window_len))
		window_len=2^nextpow2(window_len);
	end          

	switch window_type
        case 'triangle'
            window_data = window(@triang, window_len);
        case 'rectangle'
            window_data = window(@rectwin, window_len);
        case 'hamming'
            window_data = window(@hamming, window_len);
        case 'gaussian'
            window_data = window(@gausswin, window_len,2.5);
        case 'kaiser'
            window_data = window(@kaiser, window_len,5);
        case 'bartlett'
            window_data = window(@bartlett, window_len);
        case 'blackman-harris'
            window_data = window(@blackmanharris, window_len);
        case 'hann'
            window_data = window(@hann, window_len);
		case 'tukey, 0.75'
			windowData = window(@tukeywin, window_len, 0.75);
		case 'tukey, 0.5'
			window_data = window(@tukeywin, window_len, 0.5);
		case 'tukey, 0.25'
			window_data = window(@tukeywin, window_len, 0.25);
        otherwise
			fprintf('Window shape %s does not exist! Using hamming\n', shape);
            window_data = window(@hamming, num_samples);
    end

    i = 0;
	z = zeros(window_len+ceil(signal_len),1);
 
    while i<length(signal) - window_len
	    current_window = signal(i+1:i+window_len).*window_data;
		z(i+1:i+window_len) = current_window;
		i = i + window_len;
    end
end
