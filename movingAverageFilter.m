function filteredData = movingAverageFilter(data, N)
    % Apply an N-point moving average filter manually to the second column
    [nRows, ~] = size(data);

    % Initialize filtered data column
    filteredDataColumn = zeros(nRows, 1);

    % Check if data is a table, and extract the second column as an array
    if istable(data)
        dataColumn = data{:,2};
    else
        % Assuming data is a matrix
        dataColumn = data(:,2);
    end

    % Apply moving average for the second column
    for row = 1:nRows
        % Calculate the start and end index for the moving average window
        startIdx = max(1, row - floor((N-1)/2));
        endIdx = min(nRows, row + floor(N/2));

        % Compute the average for the window
        filteredDataColumn(row) = mean(dataColumn(startIdx:endIdx));
    end

    % Replace the second column of the original data with the filtered data
    if istable(data)
        data{:,2} = filteredDataColumn;
    else
        data(:,2) = filteredDataColumn;
    end

    filteredData = data;
end
