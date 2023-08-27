 %Write a MATLAB/Python program to separation of voiced/un-voiced/silence regions 
%from a speech signal.

% Load a speech signal (replace 'speech.wav' with your file)
[speechSignal, Fs] = audioread('New_Real_Conversation_Lessons.mp3');

% Parameters for voice activity detection
frameSize = 0.02 * Fs;  % Frame size in samples (20 ms)
overlap = 0.5;         % Overlap between frames (50%)
threshold_zcr = 20;    % ZCR threshold to detect unvoiced segments
threshold_ste = 0.03;  % STE threshold to detect silence segments

% Initialize arrays to store results
voiced = zeros(size(speechSignal));
unvoiced = zeros(size(speechSignal));
silence = zeros(size(speechSignal));

for i = 1 : frameSize : length(speechSignal) - frameSize
    frame = speechSignal(i : i + frameSize - 1);
    
    % Calculate zero-crossing rate
    zcr = sum(abs(diff(frame > 0))) / (2 * frameSize);
    
    % Calculate short-time energy
    ste = sum(frame .^ 2) / frameSize;
    
    % Classify frames into voiced, unvoiced, or silence
    if zcr > threshold_zcr
        unvoiced(i : i + frameSize - 1) = frame;
    elseif ste < threshold_ste
        silence(i : i + frameSize - 1) = frame;
    else
        voiced(i : i + frameSize - 1) = frame;
    end
end

% Play the original speech signal
soundsc(speechSignal, Fs);

% Play the separated segments
soundsc(voiced, Fs);
pause(1);
soundsc(unvoiced, Fs);
pause(1);
soundsc(silence, Fs);