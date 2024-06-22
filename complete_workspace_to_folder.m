outputFolder = "B:\finalReview\mobile_img_dataset\n"; % Change to your desired folder
convertMat2Folder(gyro1, acc1, camera1, outputFolder);



function convertMat2Folder(angularVelocityData, accelerationData, imageData, outputFolder)
    % Ensure the output folder exists
    if ~exist(outputFolder, 'dir')
        mkdir(outputFolder);
    end

    % Define the output file name for sensor data
    outputFileName = 'imu0.csv';
    outputFilePath = fullfile(outputFolder, outputFileName);

    % Extract time and data for angular velocity
    timeData = angularVelocityData.time;
    angularVelocityMatrix = [];

    for i = 1:length(angularVelocityData.signals)
        if isempty(angularVelocityMatrix)
            angularVelocityMatrix = angularVelocityData.signals(i).values;
        else
            angularVelocityMatrix = [angularVelocityMatrix angularVelocityData.signals(i).values]; %#ok<AGROW>
        end
    end

    % Extract data for acceleration
    accelerationMatrix = [];

    for i = 1:length(accelerationData.signals)
        if isempty(accelerationMatrix)
            accelerationMatrix = accelerationData.signals(i).values;
        else
            accelerationMatrix = [accelerationMatrix accelerationData.signals(i).values]; %#ok<AGROW>
        end
    end

    % Combine time, angular velocity, and acceleration data into one matrix
    combinedData = [timeData angularVelocityMatrix accelerationMatrix];

    % Define custom headers for the CSV file
    headers = {'#timestamp [ns]', 'w_RS_S_x [rad s^-1]', 'w_RS_S_y [rad s^-1]', 'w_RS_S_z [rad s^-1]', 'a_RS_S_x [m s^-2]', 'a_RS_S_y [m s^-2]', 'a_RS_S_z [m s^-2]'};

    % Open file for writing
    fid = fopen(outputFilePath, 'w');
    if fid == -1
        error('Could not open file for writing: %s', outputFilePath);
    end

    % Write headers
    fprintf(fid, '%s,', headers{1:end-1});
    fprintf(fid, '%s\n', headers{end});

    % Write data
    for row = 1:size(combinedData, 1)
        fprintf(fid, '%f,', combinedData(row, 1:end-1));
        fprintf(fid, '%f\n', combinedData(row, end));
    end

    % Close the file
    fclose(fid);

    disp(['Sensor data saved to ' outputFilePath]);

    % Ensure the image output folder exists
    imageOutputFolder = fullfile(outputFolder, 'images');
    if ~exist(imageOutputFolder, 'dir')
        mkdir(imageOutputFolder);
    end

    % Extract the image data from the structure
    imageDataArray = imageData.signals.values;

    % Check if imageData is a 3D array
    if ndims(imageDataArray) == 3
        % Loop through each image and save it
        for i = 1:size(imageDataArray, 3)
            % Get the grayscale image from the 3D array
            grayImage = imageDataArray(:, :, i);

            % Create a filename for the image
            filename = fullfile(imageOutputFolder, sprintf('image_%04d.png', i));

            % Save the grayscale image as a PNG file
            imwrite(grayImage, filename);

            % Display a message indicating the image was saved
            disp(['Saved: ' filename]);
        end
    else
        disp('imageData is not in a 3D array format. Check the structure format.');
    end

    disp(['Image data saved to folder ' imageOutputFolder]);
end
