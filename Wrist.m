function [Theta] = Wrist(R06,R03)
% This function finds the angles theta 4,5 & 6
    %% 
    %Inputs the end effector position and outputs the angles for the wrist and
    %wrist centre postion
    R36 = real((R03')*R06); 
    Z = 1-(R36(3,3)^2);
    
    %% 
    % Config 1 Wrist Angles
    Theta_5a = atan2(real(sqrt(Z)),real(R36(3,3)));
    Theta_4a = atan2(real(R36(2,3)/sin(Theta_5a)),real(R36(1,3)/sin(Theta_5a)));
    Theta_6a = atan2(real(R36(3,2)/sin(Theta_5a)),-real(R36(3,1)/sin(Theta_5a)));
    
    %% 
    % Config 2 Wrist Angles
    Theta_5b = atan2(-real(sqrt(Z)),real(R36(3,3)));
    Theta_4b = atan2(-real(R36(2,3)/sin(Theta_5b)),-real(R36(1,3)/sin(Theta_5b)));
    Theta_6b = atan2(-real(R36(3,2)/sin(Theta_5b)),real(R36(3,1)/sin(Theta_5b)));
    % Outputs results
    Theta = [Theta_4a,Theta_5a,Theta_6a,Theta_4b,Theta_5b,Theta_6b];
    % Removes any NaN values from output
    Theta(isnan(Theta)) = 0;
