% Specify the folder path containing the images
folderPath = "B:\finalReview\cam_calibration\caliImage";

%Specify checker board square size
squareSize = 35;  % in units of 'millimeters'




% Get a list of all jpg files in the folder
imageFiles = dir(fullfile(folderPath, '*.jpg'));

% Generate full paths to the images
imageFileNames = fullfile({imageFiles.folder}, {imageFiles.name});

% Detect calibration pattern in images
detector = vision.calibration.monocular.CheckerboardDetector();
[imagePoints, imagesUsed] = detectPatternPoints(detector, imageFileNames);
imageFileNames = imageFileNames(imagesUsed);

% Read the first image to obtain image size
originalImage = imread(imageFileNames{1});
[mrows, ncols, ~] = size(originalImage);

% Generate world coordinates for the planar pattern keypoints

worldPoints = generateWorldPoints(detector, 'SquareSize', squareSize);

% Calibrate the camera
[cameraParams, imagesUsed, estimationErrors] = estimateCameraParameters(imagePoints, worldPoints, ...
    'EstimateSkew', false, 'EstimateTangentialDistortion', false, ...
    'NumRadialDistortionCoefficients', 2, 'WorldUnits', 'millimeters', ...
    'InitialIntrinsicMatrix', [], 'InitialRadialDistortion', [], ...
    'ImageSize', [mrows, ncols]);

% View reprojection errors
h1 = figure; 
showReprojectionErrors(cameraParams);

% Visualize pattern locations
h2 = figure; 
showExtrinsics(cameraParams, 'CameraCentric');

% Display parameter estimation errors
displayErrors(estimationErrors, cameraParams);

% For example, you can use the calibration data to remove effects of lens distortion.
undistortedImage = undistortImage(originalImage, cameraParams);

% Display the original and undistorted images
figure; 
subplot(1, 2, 1); imshow(originalImage); title('Original Image');
subplot(1, 2, 2); imshow(undistortedImage); title('Undistorted Image');
