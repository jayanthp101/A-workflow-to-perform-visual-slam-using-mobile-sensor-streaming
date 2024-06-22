# A-workflow-to-perform-visual-slam-using-mobile-sensor-streaming
 A MATLAB Simulink project for visual SLAM using mobile sensors
 
**Introduction:**

This project demonstrates a Visual SLAM (Simultaneous Localization and Mapping) using mobile phone sensors. Leveraging MATLAB and Simulink, the project integrates various tools and toolboxes to collect and process sensor data from mobile devices, enabling the development and testing of SLAM and navigation algorithms.

**Motivation:**

Mobile phones, with their integrated sensors like IMU, magnetic compass, GPS, and camera, provide a readily accessible platform for Visual SLAM applications. This project aims to simplify the process of acquiring synchronized multi-sensor data, which can be used by researchers to develop and validate SLAM and navigation algorithms without the need for additional complex hardware setups. The resulting point cloud from SLAM can also be utilized for augmented reality applications.

**Project Description:**

The project is structured to guide users through the following key components:

Data Collection:
Utilizes Simulink with hardware support for Android to develop an app that collects accelerometer, gyroscope, and camera data.
The collected data is stored in a .mat file format for easy access and processing in MATLAB.

Calibration:
Includes a script for calibrating the mobile device camera to ensure accurate visual data.

SLAM Algorithm:
Provides scripts to integrate the collected sensor data and implement Visual SLAM, generating a point cloud of the environment.
Researchers can use this project to collect and prepare datasets from mobile sensors to test their SLAM algorithms, facilitating advancements in navigation and mapping technologies.
