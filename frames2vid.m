% Define the input folder path containing the image frames
inputFolderPath = "B:\finalReview\mobile_img_dataset\frames";

% Define the output folder path where the video will be saved
outputFolderPath = 'B:\finalReview\mobile_img_dataset';
outputVideoName = fullfile(outputFolderPath, 'lib.mp4');

% Create an imageDatastore to manage the collection of images
imds = imageDatastore(inputFolderPath);

% Create a VideoWriter object to write video files
outputVideo = VideoWriter(outputVideoName);
outputVideo.FrameRate = 20; % Set the frame rate (adjust as needed)

% Open the VideoWriter object for writing
open(outputVideo);

% Loop through each image in the datastore
while hasdata(imds)
    % Read the next image
    img = read(imds);
    
    % Write the image as a frame in the video
    writeVideo(outputVideo, img);
end

% Close the VideoWriter object
close(outputVideo);

disp('Video creation complete. The video has been saved.');
