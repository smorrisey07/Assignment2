function [t, X] = generateBlocks(x, sample_rate_Hz, block_size, hop_size)
len = length(x)-block_size+hop_size;
rem = hop_size - mod(len, hop_size);
x = [x' zeros(1, rem)]';
n_blocks = floor((len + rem)/hop_size);

% Initialize variables
X = zeros(block_size, n_blocks);
t_dash = hop_size*(0:n_blocks-1)';

for i = 1:n_blocks
    X(:,i) = x(t_dash(i)+1:t_dash(i)+block_size)';
t = t_dash/sample_rate_Hz;
end