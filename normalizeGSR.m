function normalizedData = normalizeGSR(data)
    % Normalize the GSR signal in the second column
    normalizedData = data; % Initialize with original data

    % Check if data is a table, and extract the second column as an array
    if istable(data)
        dataColumn = data{:,2};
    else
        % Assuming data is a matrix
        dataColumn = data(:,2);
    end

    % Normalize the second column
    normalizedColumn = (dataColumn - min(dataColumn)) / (max(dataColumn) - min(dataColumn)) * 100;

    % Replace the second column of the original data with the normalized data
    if istable(data)
        normalizedData{:,2} = normalizedColumn;
    else
        normalizedData(:,2) = normalizedColumn;
    end
end
