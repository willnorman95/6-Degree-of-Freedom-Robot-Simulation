function [FEU,FED,BEU,BED] = elbow(Wc)
% This function calculates the angles theta 1,2 & 3
    %% Initialises function variables
    d = [0.103,0,0,0.165,0,0.04];
    a = [0.020,0.165,0,0,0,0] ;
    L = 0.165; % Link lengths

    %Calc S & R
    r = [sqrt(Wc(1)^2+Wc(2)^2)-a(1),sqrt(Wc(1)^2+Wc(2)^2)+a(1)];
    s = Wc(3) - d(1);
    % Calc T
    T = [sqrt(s^2+r(1)^2),sqrt(s^2+r(2)^2)];
    Theta = zeros(10,1);


    %% 
    %THETA 1
    %Front Up & Down
    Theta(1) = atan2(Wc(2),Wc(1));
    %Back Up & Down
    Theta(2) = pi + Theta(1);


    %% 
    % %THETA 3
    z = zeros(2,1); % Zeta is the angle betwwn link 2 and the angle from the wrist
    %cosine rule
    z(1) = acos((T(1)^2-2*L^2)/(-2*L*L)); % Front
    z(2) = acos((T(2)^2-2*L^2)/(-2*L*L)); % Rear

    % Front E-Up
    Theta(3) = z(1) - pi/2;
    % Front E-Down
    Theta(4) = pi-Theta(3);
   
    % Back E-Up
    Theta(5) = z(2) - pi/2;
    % Back E-Down
    Theta(6) = pi-Theta(5);
    %end

    %% 
    %THETA 2
    %Beta is the angle between
    Beta =[atan2(s,r(1)),atan2(s,r(2))];
    %Gamma is the angle between
    Gamma = zeros(1,2);
    Gamma(1) = abs((pi)-(z(1)/2))-pi/2;
    Gamma(2) = abs((pi)-(z(2)/2))-pi/2;


    % FRONT 
    % Front E-Up
    Theta(7) = Beta(1)+Gamma(1);
    % Front E-down
    Theta(8) = Beta(1)-Gamma(1);
    
    % BACK 
    % Back E-Down
    Theta(9) = pi - (Beta(2)-Gamma(2)); 
    % Back E-up
    Theta(10) = pi - (Beta(2)+Gamma(2));
    
    if isnan(Theta(3))
        Theta(3) = 0;
    end

    %Front Elbow Up
    FEU = [Theta(1),Theta(7),Theta(3)];
    %Front Elbow Down
    FED = [Theta(1),Theta(8),Theta(4)];
    %Back Elbow Down
    BED = [Theta(2),Theta(9),Theta(5)];
    %Back Elbow Up
    BEU = [Theta(2),Theta(10),Theta(6)];