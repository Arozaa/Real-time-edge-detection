Real-Time Edge Detection with PSNR & MSE
Overview
This MATLAB script performs real-time edge detection from a webcam feed using both Sobel and Canny edge detection algorithms. It displays the original frame alongside the edge-detected results with calculated PSNR (Peak Signal-to-Noise Ratio) and MSE (Mean Squared Error) metrics for quality comparison.

Features
Real-time webcam video capture and processing

Two edge detection methods:

Sobel operator

Canny edge detector with adaptive thresholds

Image quality metrics calculation (PSNR and MSE)

Gaussian filtering for noise reduction

Optimized for performance with pre-allocated memory and resolution settings

Requirements
MATLAB R2016b or later

MATLAB Image Processing Toolbox

Webcam connected to your computer

Usage
Connect a webcam to your computer

Run the script in MATLAB

The script will open a full-screen window showing:

Original webcam feed (top)

Sobel edge detection results with PSNR/MSE (middle)

Canny edge detection results with PSNR/MSE (bottom)

Close the window to stop the capture and release the webcam

Parameters
Webcam resolution set to 640x480 for optimal performance

Canny edge detection thresholds: [0.1 0.3]

Gaussian filter sigma: 1

Authors
Abraham Fikre (01143/14)

Dagmawi Behailu (02434/14)

Temesgen Gashaw (01833/14)

Notes
The script automatically adjusts to your screen size for optimal viewing

Performance may vary depending on your hardware capabilities

The PSNR and MSE values provide quantitative comparison between the edge detection methods and the original image
