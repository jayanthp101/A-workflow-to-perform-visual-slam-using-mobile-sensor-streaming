%insert path of folder containing images for slam
folderPath="B:\finalReview\mobile_img_dataset\n\images";

%after camera calibration, change the parameters below 
focalLength    = [445.8396, 446.3485];    % in units of pixels
 principalPoint = [241.0271, 318.7461];    % in units of pixels




imds= imageDatastore(folderPath);

% Inspect the first image
currFrameIdx = 1;
currI = readimage(imds, currFrameIdx);
himage = imshow(currI);
rng(0);
imageSize      = size(currI,[1 2]); % in units of pixels
intrinsics     = cameraIntrinsics(focalLength, principalPoint, imageSize);
vslam = monovslam(intrinsics);
for i = 1:numel(imds.Files)
    addFrame(vslam,readimage(imds,i))

    if hasNewKeyFrame(vslam)
        % Query 3-D map points and camera poses
        xyzPoints = mapPoints(vslam);
        [camPoses,viewIds] = poses(vslam);

        % Display 3-D map points and camera trajectory
        plot(vslam);
    end

    % Get current status of system
    status = checkStatus(vslam);
end 
% Plot intermediate results and wait until all images are processed
while ~isDone(vslam)
    if hasNewKeyFrame(vslam)
        plot(vslam);
    end
end

xyzPoints = mapPoints(vslam);
[camPoses,viewIds] = poses(vslam);

% Reset the system
reset(vslam)
