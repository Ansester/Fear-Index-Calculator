function main
% Process Baseline Data
    baselineStringData = loadDataAsStrings('GSR_Baseline.csv');
    baselineOriginalData = processStringMatrix(baselineStringData);

    % Median Filter - Baseline
    baselineMedianFilteredData = medianFilter(baselineOriginalData);
    plotData(baselineOriginalData, baselineMedianFilteredData, 'Baseline - Median Filter');

    % Low Pass Filter - Baseline
    baselineLowPassFilteredData = lowPassFilter(baselineMedianFilteredData, 48);
    plotData(baselineMedianFilteredData, baselineLowPassFilteredData, 'Baseline - Low Pass Filter');

    % N-point Moving Average Filter - Baseline
    baselineMovingAverageFilteredData = movingAverageFilter(baselineLowPassFilteredData, 10);
    plotData(baselineLowPassFilteredData, baselineMovingAverageFilteredData, 'Baseline - Moving Average Filter');

    % Normalization - Baseline
    baselineNormalizedData = normalizeGSR(baselineMovingAverageFilteredData);
    plotData(baselineMovingAverageFilteredData, baselineNormalizedData, 'Baseline - Normalization');

    % Calculate features and fear index for baseline data
    baselineFeatures = calculateFeatures(baselineNormalizedData);
    baselineFearIndex = calculateFearIndex(baselineFeatures);

    % Display Baseline Fear Index
    disp('Baseline Fear Index:');
    disp(baselineFearIndex);
    disp('Baseline features-');
    disp(baselineFeatures);

    % Process Fear Data
    fearStringData = loadDataAsStrings('GSR_FEAR.csv');
    fearOriginalData = processStringMatrix(fearStringData);

    % Median Filter - Fear
    fearMedianFilteredData = medianFilter(fearOriginalData);
    plotData(fearOriginalData, fearMedianFilteredData, 'Fear - Median Filter');

    % Low Pass Filter - Fear
    fearLowPassFilteredData = lowPassFilter(fearMedianFilteredData, 48);
    plotData(fearMedianFilteredData, fearLowPassFilteredData, 'Fear - Low Pass Filter');

    % Moving Average Filter - Fear
    fearMovingAverageFilteredData = movingAverageFilter(fearLowPassFilteredData, 10);
    plotData(fearLowPassFilteredData, fearMovingAverageFilteredData, 'Fear - Moving Average Filter');

    % Normalization - Fear
    fearNormalizedData = normalizeGSR(fearMovingAverageFilteredData);
    plotData(fearMovingAverageFilteredData, fearNormalizedData, 'Fear - Normalization');

    % Calculate features and fear index for fear data
    fearFeatures = calculateFeatures(fearNormalizedData);
    fearFearIndex = calculateFearIndex(fearFeatures);

    % Display Fear Fear Index
    disp('Fear Fear Index:');
    disp(fearFearIndex);
    disp('Fear features-');
    disp(fearFeatures);
  
end

