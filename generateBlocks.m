function [t, X] = generateBlocks(x, sample_rate_Hz, block_size, hop_size)
%zero-pad last block of x
m = mod(length(x),hop_size);
x = [x' zeros(1, hop_size - m)]';
% hop = number of blocks in input x
hop = length(x)/hop_size;

% Initiate variables
t = zeros(hop, 1);
X = zeros(hop, block_size);
t(1) = 1;

for i = 1:length(t)
    lastSample = t(i) + block_size;
    freqVec = (x(t(i):lastSample - 1, 1))';
    X(i,:) = freqVec;
    t(i+1) = hop_size * i; %sample number for each block
end
t = t ./ sample_rate_Hz; %from samples to time stamps
end