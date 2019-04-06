function [t,x] = generateSinusoidal(amplitude, sampling_rate_Hz, frequency_Hz, length_secs, phase_radians) 
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
t = (0:1/sampling_rate_Hz:length_secs)';
t = t(1:length(t)-1, 1);
x = amplitude*sin(2*pi*frequency_Hz*t + phase_radians);
end
