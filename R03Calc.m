function [R03] = R03Calc(A)
% This function finds the rotation matrix to the wrist centre
    %% Find Rotation Matrix From Wrist Centre to End-Effector
    %Calculates the Rotation Matrix R03 From the first 3 theta values
    Beta = [A(1),A(2),A(3)];
    t01 = DHConvention(Beta,1);
    t12 = DHConvention(Beta,2);
    t23 = DHConvention(Beta,3);
    t02 = t01*t12;
    t03 = t02*t23;
    R03 = t03(1:3,1:3);