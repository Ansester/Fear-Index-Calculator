# Fear Analysis using GSR Data

## Overview
This project involves the development of a MATLAB program designed to analyze the relationship between Galvanic Skin Response (GSR) signals and physiological responses to fear. The analysis includes loading GSR data, applying various filters, normalizing the data, calculating features, and determining a fear index.

## Table of Contents
- [Overview](#overview)
- [Technical Details](#technical-details)
  - [GSR Data and Features](#gsr-data-and-features)
  - [Algorithm](#algorithm)
  - [Functions](#functions)
- [Usage Instructions](#usage-instructions)
- [Conclusion](#conclusion)

## Technical Details

### GSR Data and Features
Galvanic Skin Response (GSR) measures the electrical conductance of the skin, which varies with sweat gland activity and is influenced by the sympathetic nervous system. The project uses GSR data recorded during a fearful VR simulation and a baseline recording. The GSR data is processed to extract meaningful features that can be used to calculate a fear index.

### Algorithm
1. **Load Data**: Load GSR data from CSV files into a matrix.
2. **Apply Filters**:
   - **3rd Order Median Filter**: Smooths the data by replacing each point with the median of its neighboring values.
   - **Low Pass Filter**: Filters out high-frequency noise with a cutoff frequency of 20 Hz.
   - **10-Point Moving Average Filter**: Smooths the data by averaging each point with its nine neighbors.
3. **Normalize Data**: Scale the GSR values to a range of 0 to 100.
4. **Calculate Features**: Compute various features from the GSR data, such as mean, variance, peak rise time, peak amplitude, peak energy, highest SCR amplitude and rise time, number of peaks, mean power, and bandwidth.
5. **Calculate Fear Index**: Use the extracted features to calculate a fear index.

### Functions
1. **loadDataAsStrings(filename)**:
   - Loads GSR data from a CSV file into a string matrix.
   - Skips the header row and reads the timestamp and GSR values.

2. **processStringMatrix(stringMatrix)**:
   - Converts the timestamp from `mm:ss:SSS` format to milliseconds.
   - Converts GSR values from strings to double precision.

3. **medianFilter(data)**:
   - Applies a 3rd order median filter to the GSR data.
   - Replaces each value with the median of its neighboring values.

4. **lowPassFilter(data, sampleRate)**:
   - Applies a low pass filter to the GSR data with a cutoff frequency of 20 Hz.
   - Uses a Butterworth filter design.

5. **movingAverageFilter(data, N)**:
   - Applies an N-point moving average filter to the GSR data.
   - Averages each point with its N-1 neighbors.

6. **normalizeGSR(data)**:
   - Normalizes the GSR values to a range of 0 to 100.
   - Adjusts the scale of the data while preserving the overall shape.

7. **calculateFeatures(data)**:
   - Extracts various features from the GSR data.
   - Computes mean, variance, peak rise time, peak amplitude, peak energy, highest SCR amplitude and rise time, number of peaks, mean power, and bandwidth.

8. **plotData(originalData, processedData, titleText)**:
   - Plots the original and processed GSR data.
   - Displays both curves on the same graph for comparison.

9. **calculateFearIndex(features)**:
   - Calculates the fear index using a predefined formula.
   - Combines the extracted features to determine the fear index.

### Main Function
The main function orchestrates the entire process:
1. **Load Baseline Data**:
   - Load and process the baseline GSR data.
   - Apply the median filter, low pass filter, moving average filter, and normalization.
   - Plot the original and processed data at each step.
   - Calculate features and the fear index for the baseline data.

2. **Load Fear Data**:
   - Load and process the fear GSR data.
   - Apply the same sequence of filters and normalization as the baseline data.
   - Plot the original and processed data at each step.
   - Calculate features and the fear index for the fear data.

3. **Display Results**:
   - Display the calculated fear indices and features for both baseline and fear data.

## Usage Instructions
1. **Loading Data**:
   - Ensure the CSV files (`GSR_Baseline.csv` and `GSR_FEAR.csv`) are in the active directory.
   - Run the main function to process the data and generate the results.

2. **Applying Filters**:
   - The program automatically applies the median filter, low pass filter, moving average filter, and normalization in sequence.

3. **Plotting Data**:
   - The program generates and displays plots of the original and processed data for both baseline and fear recordings.

4. **Calculating Features and Fear Index**:
   - The program calculates various features from the GSR data and uses them to determine the fear index.

## Conclusion
This project successfully demonstrates the analysis of GSR data to understand physiological responses to fear. The program effectively processes the data, extracts meaningful features, and calculates a fear index, providing a comprehensive tool for fear analysis using GSR data.
