function [t, X] = generateBlocks(x, sample_rate_Hz, block_size, hop_size)

%zero-pad last block of X
m = mod(length(x),block_size);
x = [x;zeros(m-1, 1)];

% hop = number of blocks in input x
hop = round(length(x)/hop_size);

% Initiate variables
t = zeros(hop, 1);
X = zeros(hop, block_size);
t(1) = 1;

for i = 1:hop
    t(i+1) = hop_size * i; %sample number for each block
    lastSample = t(i) + block_size - 1;
    % Slice input x into blocks from the starting sample (t(i) or hop_size * hop number) to sample + block
    %   size
    X(i,:) = (x(t(i):lastSample))';
end
t(:,1) = t(:,1) / sample_rate_Hz;
end