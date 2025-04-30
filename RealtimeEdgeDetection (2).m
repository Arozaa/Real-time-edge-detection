%Real time edge detection from webcam
%Abraham Fikre------------- 01143/14           
%Dagmawi Behailu----------- 02434/14
%Temesgen Gashaw------------ 01833/14

% Create webcam object
cam = webcam;

% Set webcam resolution for improved speed
cam.Resolution = '640x480';

% Create a figure window for displaying results
hFig = figure('Name', 'Real-Time Edge Detection with PSNR & MSE', 'Units', 'normalized', 'OuterPosition', [0 0 1 1]);

% Pre-allocate grayscale image for performance
frame = snapshot(cam);
grayFrame = zeros(size(frame, 1), size(frame, 2), 'uint8');


% Adaptive Thresholds for Canny (Fine-tuned for better results)
cannyThreshold = [0.1 0.3];

% Main loop for continuous video capture
while ishandle(hFig)
    % Capture a frame from the webcam
    frame = snapshot(cam);
    
    % Convert the image to grayscale
    grayFrame(:) = rgb2gray(frame);

    % Noise reduction using Gaussian filtering
   smoothFrame = imgaussfilt(grayFrame, 1);  % Reduces noise for better edges

    % Perform edge detection using Sobel and Canny
    sobelEdges = edge(smoothFrame, 'Sobel');
    cannyEdges = edge(smoothFrame, 'Canny', cannyThreshold);



    % Calculate MSE and PSNR for Sobel and Canny
    mse_sobel = immse(uint8(sobelEdges) * 255, grayFrame);
    mse_canny = immse(uint8(cannyEdges) * 255, grayFrame);

    psnr_sobel = psnr(uint8(sobelEdges) * 255, grayFrame);
    psnr_canny = psnr(uint8(cannyEdges) * 255, grayFrame);

    % Display Original Frame, Sobel, and Canny results on a larger screen
    subplot(3, 1, 1);
    imshow(frame, 'InitialMagnification', 'fit');
    title('Original Frame');

    subplot(3, 1, 2);
    imshow(sobelEdges, 'InitialMagnification', 'fit');
    title(sprintf('Sobel | PSNR: %.2f dB | MSE: %.2f', psnr_sobel, mse_sobel));

    subplot(3, 1, 3);
    imshow(cannyEdges, 'InitialMagnification', 'fit');
    title(sprintf('Canny | PSNR: %.2f dB | MSE: %.2f', psnr_canny, mse_canny));


    % Pause for smoother frame rate
    pause(0.001);
end

% Release the webcam when the figure is closed
clear cam;
