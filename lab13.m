% Load a speech signal (replace 'speech.wav' with your file)
[speechSignal, Fs] = audioread('New_Real_Conversation_Lessons.mp3');

% Parameters for spectrogram
windowSize = round(0.02 * Fs); % Window size in samples (20 ms)
overlap = round(0.5 * windowSize); % Overlap between windows (50%)

% Create and plot the spectrogram
figure;
spectrogram(speechSignal, hamming(windowSize), overlap, [], Fs, 'yaxis');
title('Spectrogram of Speech Signal');
xlabel('Time (s)');
ylabel('Frequency (Hz)');
colorbar;

% Adjust the figure layout
set(gcf, 'Position', get(0, 'Screensize'));