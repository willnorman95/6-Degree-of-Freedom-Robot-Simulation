function [effpos, xyzCoor, R] = FK(angles)
% This function finds the XYZ Co-ordinates and Rotation Matrices
% for all joint angles
    %% Finds Transform Matrices to each frame
    % Calculates the matrix transform to each frame from the
    % previous frame
    t01 = DHConvention(angles,1);
    t12 = DHConvention(angles,2);
    t23 = DHConvention(angles,3);
    t34 = DHConvention(angles,4);
    t45 = DHConvention(angles,5);
    t56 = DHConvention(angles,6);
    % Calculates the matrix transform from the origin to each frame
    t02 = t01*t12;
    t03 = t02*t23;
    t04 = t03*t34;
    t05 = t04*t45;
    t06 = t05*t56;

    %% Output all the frame Co-ordinates and Rotation Matrices to GUI
    % Sets the coordinates of all the frames
    xyzCoor = [ 0, 0, 0.0;...
                t01(1,4), t01(2,4),t01(3,4);...
                t02(1,4), t02(2,4),t02(3,4);...
                t03(1,4), t03(2,4),t03(3,4);...
                t04(1,4), t04(2,4),t04(3,4);...
                t05(1,4), t05(2,4),t05(3,4);...
                t06(1,4), t06(2,4),t06(3,4)];
            
    % Sets co-ordinates of the end-effector
    effpos = t06(1:3,4);
    % Sets rotation matrices from the Homogeneous transforms w.r.t 
    % the robot's base to each reference frame
    R(:,:,1) = [1 0 0 ; 0 1 0; 0 0 1];
    R(:,:,2) = t01(1:3,1:3);
    R(:,:,3) = t02(1:3,1:3);
    R(:,:,4) = t03(1:3,1:3);
    R(:,:,5) = t04(1:3,1:3);
    R(:,:,6) = t05(1:3,1:3);
    R(:,:,7) = t06(1:3,1:3);