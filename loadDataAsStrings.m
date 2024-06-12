function stringMatrix = loadDataAsStrings(filename)
    % Load data from a CSV file into a string matrix
    opts = delimitedTextImportOptions('NumVariables', 2);

    % Specify range and delimiter
    opts.DataLines = [2, Inf]; % Start reading from the second line due to the header row
    opts.Delimiter = ",";

    % Specify variable types as strings
    opts.VariableTypes = ["string", "string"];

    % Import the data as a table
    tbl = readtable(filename,opts);

    % Convert the table to a string matrix
    stringMatrix = string(table2array(tbl));
end

