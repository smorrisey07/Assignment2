function [freq_vector, time_vector, magnitude_spectrogram] = mySpecgram(x,  block_size, hop_size, sampling_rate_Hz, window_type)

sample_rate_Hz = sampling_rate_Hz;
[time_vector, X] = generateBlocks(x, sample_rate_Hz, block_size, hop_size);

% Initiate variables
freq_vector = zeros(block_size/2, 1);
magnitude_spectrogram = zeros(block_size/2, length(time_vector));

if window_type == 'rect'
    window = ones(block_size,1);
elseif window_type == 'hann'
    window = hann(block_size);
end

% for i = 1:length(time_vector)
%     windowx = window.*X(:,i);
%     [freq_vector, magnitude_spectrogram,~,~,~] = computeSpectrum(windowx, sampling_rate_Hz);
% end
end