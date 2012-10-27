function mono_signal = to_mono(signal)
	if (size(signal,2) > 1)
		fprintf('::: signal is being converted to mono...\n');
		mono_signal = sum(signal, 2) ./ size(signal, 2);
	end
end

