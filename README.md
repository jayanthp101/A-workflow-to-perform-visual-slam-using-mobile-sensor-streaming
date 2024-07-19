
# A-workflow-to-perform-visual-slam-using-mobile-sensor-streaming

## Table of Contents
- [Introduction](#introduction)
- [Abstract](#abstract)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Methodology](#methodology)
- [Results](#results)
- [Conclusion and Future Scope](#conclusion-and-future-scope)
- [Acknowledgements](#acknowledgements)
- [License](#license)

## Introduction
In recent years, the field of robotics and autonomous systems has witnessed significant advancements, with Simultaneous Localization and Mapping (SLAM) emerging as a critical technology. This project leverages the advanced capabilities of modern smartphones to develop an efficient and reliable visual SLAM system. The project aims to democratize access to advanced mapping and localization technologies by utilizing the built-in sensors of mobile phones, thus eliminating the need for specialized and costly hardware.

## Abstract
The project successfully acquired and transferred image and sensor data from a mobile phone to a laptop for SLAM processing. The project aimed to create a comprehensive workflow for visual SLAM (VSLAM) in the MATLAB environment, enabling real-time navigation and mapping using visual sensor data from cameras. Despite the challenges of integrating IMU data and performing real-time processing, the project achieved data acquisition and dataset creation for visual SLAM algorithms. The implementation was based on the ORB SLAM framework, covering stages like Map Initialization, Tracking, Local Mapping, and Loop Closure.

## Features
- Acquisition of image and sensor data from a mobile phone.
- Transfer of data to a laptop for SLAM processing.
- Implementation of the ORB SLAM framework.
- Stages include Map Initialization, Tracking, Local Mapping, and Loop Closure.
- Comprehensive workflow for visual SLAM in MATLAB.

## Installation
To set up the project, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/robust-visual-slam.git
   ```
2. Navigate to the project directory:
   ```bash
   cd robust-visual-slam
   ```
3. Install the required software and packages:
   - MATLAB
   - Simulink Support Package for Android Devices

## Usage
### Tools Required:
- MATLAB
- Simulink
- [Computer Vision Toolbox](https://www.mathworks.com/products/computer-vision.html)
- [Navigation Toolbox](https://in.mathworks.com/products/navigation.html)
- [Sensor Fusion and Tracking Toolbox](https://in.mathworks.com/products/sensor-fusion-and-tracking.html)
- [Simulink Support Package for Android Devices](https://in.mathworks.com/hardware-support/android-programming-simulink.html)

### Steps to Use:
1. **Download Required Tools:**
   - Ensure all the listed tools are downloaded and installed.

2. **Download and Extract Zip File:**
   - Download the provided zip file and extract its contents.

3. **Open Folder in MATLAB:**
   - Navigate to the extracted folder and open it in MATLAB.

4. **Develop Android Application:**
   - Open the file named `Logging_from_phone.slx`. This will open a Simulink model.
   - Ensure your Android device setup is complete for the Simulink Support Package for Android Devices.

5. **Connect Phone and Build Application:**
   - Connect your phone to your computer via a USB cable.
   - In Simulink, click on `Hardware` and then `Monitor and Tune`. This action will build the application on your mobile phone.
   - Once built, you can start collecting data from the phone. The collected data is logged in your MATLAB workspace.

6. **Using Collected Data:**
   - Data can be used directly from the workspace or converted into a dataset folder using the `complete_workspace_to_folder.m` script.

7. **Perform Camera Calibration:**
   - Camera calibration is required before performing SLAM.
   - Use the Camera Calibration app in MATLAB or the `camera_calibration.m` script for this purpose.

8. **Test SLAM Algorithm:**
   - You can test the SLAM algorithm using the collected data.
   - Two scripts are provided for this purpose:
     - `vFunctionSlam.m`: Uses the inbuilt function `monoslam()` to perform visual SLAM. More information can be found [here](https://in.mathworks.com/help/vision/ref/monovslam.html).
     - `vslam_owndata.m`: A modular code for visual SLAM. You can modify this script according to your dataset.

## Methodology
### Software
- MATLAB
- Simulink Support Package for Android Devices

### Hardware
- Mobile device with a camera, accelerometer, and gyroscope

### Workflow
1. **Camera Calibration**: Calibrate the camera to ensure accurate data acquisition.
2. **Data Acquisition**: Capture and transmit sensor data from the mobile device to MATLAB.
3. **Data Processing**: Use the ORB SLAM framework to process the data and perform SLAM operations.

## Results
The project demonstrated successful data acquisition and SLAM processing using mobile sensors. Key results include accurate map initialization, tracking, local mapping, and loop closure, proving the feasibility of using mobile phones for robust visual SLAM.


https://github.com/user-attachments/assets/910e8ead-9fe2-445d-aeac-e9f920a55bab



The below is the screenshort of dataset folder:-
![image](https://github.com/user-attachments/assets/c7a7c72d-c209-4ffb-8200-d0b0ca343edf)
![image](https://github.com/user-attachments/assets/59d07dbf-ce89-45fc-aa19-f1bf89db8f54)
![image](https://github.com/user-attachments/assets/0b4fc3ba-6c9a-4069-964f-62c761335f7a)

The below are the results obtained from vSlam algorithm that was performed to test the dataset:-
![image](https://github.com/user-attachments/assets/a1593075-8ec7-4bb3-b062-11052ba5d2e0)
![image](https://github.com/user-attachments/assets/3bc15882-9500-42fc-9aef-ed0eba0e5bf9)
![image](https://github.com/user-attachments/assets/686ac49b-19f8-4817-8f0e-4069e049a1b5)




## Conclusion and Future Scope
The project successfully established a comprehensive workflow for visual SLAM using mobile sensors, eliminating the need for expensive setups. Future work could focus on integrating IMU data for real-time processing and improving the robustness of the SLAM system for various applications in mobile robotics, augmented reality, and autonomous systems.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
