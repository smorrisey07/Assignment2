function [t,x] = generateSquare(amplitude, sampling_rate_Hz, frequency_Hz, length_secs, phase_radians) 
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[t,x] = generateSinusoidal(amplitude, sampling_rate_Hz, frequency_Hz, length_secs, phase_radians);
for i=2:10
    [t, temp] = generateSinusoidal(amplitude/(2*i - 1), sampling_rate_Hz, frequency_Hz * (2*i - 1), length_secs, phase_radians);
    x = x + temp;
end
x = x*4/pi;
end

