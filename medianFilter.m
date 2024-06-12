function filteredData = medianFilter(data)
    % Apply a 3rd order median filter manually to the second column
    [nRows, ~] = size(data);

    % Initialize filteredDataColumn with the same size as the second column of data
    filteredDataColumn = zeros(nRows, 1); % Ensuring the column vector format

    % Extract the second column as an array
    if istable(data)
        dataColumn = data{:,2};
    else
        % Assuming data is a matrix
        dataColumn = data(:,2);
    end

    % Apply median filter for the second column
    for row = 2:(nRows - 1) % Exclude first and last element
        % Extract the neighborhood values
        neighborhood = dataColumn(row-1:row+1);
        
        % Compute median and assign to filtered data column
        filteredDataColumn(row) = median(neighborhood);
    end

    % Keep the first and last elements unfiltered
    filteredDataColumn(1) = dataColumn(1);
    filteredDataColumn(end) = dataColumn(end);

    % Replace the second column of the original data with the filtered data
    if istable(data)
        data{:,2} = filteredDataColumn;
    else
        data(:,2) = filteredDataColumn;
    end

    filteredData = data;
end
