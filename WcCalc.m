function [Wc] = WcCalc(o,R06)
% This function calculates the wrist centre position
    %% Find the Co-ordinates of the Wrist Centre
    % Initialises the link lengths
    d = [0.103,0,0,0.165,0,0.04];

    %Calculate Wrist Centre
    Xc = o(1) - d(6)*R06(1,3);
    Yc = o(2) - d(6)*R06(2,3);
    Zc = o(3) - d(6)*R06(3,3);
    Wc = [Xc,Yc,Zc]; 