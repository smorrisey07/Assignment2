clc;

%% Question 1
[t,x] = generateSinusoidal(1.0, 44100, 400, 0.5, pi/2);
figure(1)
subplot(2, 3, 1)
plot(t(1:221), x(1:221));
xlabel('Time (s)')
ylabel('Amplitude')
title('Sinusoidal')

%% Question 2
[t,y] = generateSquare(1.0, 44100, 400, 0.5, 0);
subplot(2,3,4)
hold on
plot(t(1:221), x(1:221));
plot(t(1:221), y(1:221));
hold off
legend('Sinusoidal','Square')
xlabel('Time')
ylabel('Amplitude')
title('Sinusoidal and Square Waves')

%% Question 3
[fX,XAbs,XPhase,XRe,XIm] = computeSpectrum(x, 44100);
subplot(2,3,2)
plot(fX, XAbs);
xlabel('Frequency')
ylabel('Magnitude')
title('Magnitude Spectrum of Sinusoidal')
subplot(2,3, 3), plot(fX, XPhase);
xlabel('Sample')
ylabel('Phase')
title('Phase Spectrum of Sinusoidal')
[fY,YAbs,YPhase,YRe,YIm] = computeSpectrum(y, 44100);
subplot(2,3,5), plot(fY, YAbs);
xlabel('Frequency')
ylabel('Magnitude')
title('Magnitude Spectrum of Square Wave')
subplot(2,3,6), plot(fY, YPhase);
xlabel('Sample')
ylabel('Phase')
title('Phase Spectrum of Square Wave')

%% Question 4
[rect_freq_vector, rect_time_vector, rect_magnitude_spectrogram] = mySpecgram(y, 2048, 1024, 44100, 'rect');
[hann_freq_vector, hann_time_vector, hann_magnitude_spectrogram] = mySpecgram(y, 2048, 1024, 44100, 'hann');

figure(2)
colorbar;
subplot(3,1,1)
p = image(rect_freq_vector, rect_time_vector, 20*log10(rect_magnitude_spectrogram));
p.Parent.YDir = 'normal';
title('Magnitude spectrogram using rectangular window')
subplot(3,1,2)
p = image(hann_freq_vector, hann_time_vector, 20*log10(hann_magnitude_spectrogram));
p.Parent.YDir = 'normal';
title('Magnitude spectrogram using Hann window')
subplot(3,1,3)
title('MATLAB Spectrogram')
spectrogram(y,hann(t),[],[],44100,'yaxis');
%spectrogram(x, hann(2048), 1024, 2048, 'yaxis');
%% tests
[t, X] = generateBlocks(x, 44100, 2048, 1024);

