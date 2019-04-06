function [f,XAbs,XPhase,XRe,XIm] = computeSpectrum(x, sample_rate_Hz)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
X = fft(x);
X = X(1:floor(((length(x)-1)/2)+1), 1);
XAbs = abs(X);
XPhase = angle(X);
XRe = real(X);
XIm = imag(X);
f = (0:(sample_rate_Hz/length(x)):sample_rate_Hz/2)';
f = f(1:length(f)-1, 1);
end

