function plotData(originalData, processedData, titleText)
    figure;
    plot(originalData(:, 1), originalData(:, 2), 'b-', 'DisplayName', 'Original Data');
    hold on;
    plot(processedData(:, 1), processedData(:, 2), 'r-', 'DisplayName', 'Processed Data');
    title(titleText);
    xlabel('Time (milliseconds)');
    ylabel('GSR Value');
    legend('show');
    hold off;
end
