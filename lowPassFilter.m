function filteredData = lowPassFilter(data, sampleRate)
    % Apply a low pass filter with a passband frequency of 20 Hz
    if nargin < 2 || isempty(sampleRate)
        error('Sample rate must be specified');
    end

    Wn = 20 / (sampleRate / 2); % Normalized frequency
    [b, a] = butter(1, Wn, 'low');

    % Apply filter to the second column
    if istable(data)
        filteredColumn = filtfilt(b, a, data{:,2});
        data{:,2} = filteredColumn;
    else
        filteredColumn = filtfilt(b, a, data(:,2));
        data(:,2) = filteredColumn;
    end

    filteredData = data;
end
