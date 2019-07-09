# 6-Degree-of-Freedom-Robot-Simulation
This is a program to simulate a 6 degree of freedom robot using forward and inverse kinematics.

## Forward Kinematics
The forward kinematics method uses the joint perameters to calculate the end-effector position of the robot. The Denavit-Hartemberg method is used to find each joint reference frame using the previous joint dimensions and parameters. As shown by the transform matrix calculation below.

<img align="centre" src="https://wikimedia.org/api/rest_v1/media/math/render/svg/6963d0c47a3a894ff0719c8df348d188b996074e">

## Inverse Kinematics
The inverse kinematics method uses the end-effector position to compute the possible joint paraneters. Kinematic decoupling is used to separate the robot into a elbom manipulator and a wrist manipulator. The end effector position and orientation dictates the wrist centre position, from the wrist centre position the elbow joint angle permutation are calculated. There are four possible configuration for the 6 DoF robot shown below; Front elbow up, Front elbow down, Rear elbow up & Rear Elbow down.

<img align="centre" src="<img align="centre" src="https://wikimedia.org/api/rest_v1/media/math/render/svg/6963d0c47a3a894ff0719c8df348d188b996074e">
