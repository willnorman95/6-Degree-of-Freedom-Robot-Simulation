function solution_IK = IK(effPos, R06)
% This function finds the possible angle combinations to satisfy
% the end-effector position and orientation
    % Calculate Wrist Position
    Wc = WcCalc(effPos,R06);
    % Initilise Results Matrix for all Joint Angles 
    solution_IK = zeros(9,4);
    %% Find the Combinations of the first four Joint Angles
    [FEU,FED,BEU,BED] = elbow(Wc);
    
    %% Calculate Remaing Angles and Add to Solution Matrix for FEU
    % FRONT ELBOW-UP 
    [R03] = R03Calc(FEU(1:3));
    Theta1 = Wrist(R06,R03);
    solution_IK(1,1) = FEU(1); %First possible solution for theta(1)
    solution_IK(2,1) = FEU(2); %First possible solution for theta(2)
    solution_IK(3,1) = FEU(3); %First possible solution for theta(3)
    solution_IK(4,1) = Theta1(1); %Front Elbow-up solution for theta(4)
    solution_IK(5,1) = Theta1(2); %Front Elbow-up solution for theta(5)
    solution_IK(6,1) = Theta1(3); %Front Elbow-up solution for theta(6)
    solution_IK(7,1) = Theta1(4); %Second possible solution for theta(4)
    solution_IK(8,1) = Theta1(5); %Second possible solution for theta(5)
    solution_IK(9,1) = Theta1(6); %Second possible solution for theta(6)


    %%  Calculate Remaing Angles and Add to Solution Matrix for FED
    % FRONT ELBOW-DOWN
    [R03] = R03Calc(FED(1:3));
    Theta2 = Wrist(R06,R03);
    solution_IK(1,2) = FED(1); %First possible solution for theta(4)
    solution_IK(2,2) = FED(2); %First possible solution for theta(5)
    solution_IK(3,2) = FED(3); %First possible solution for theta(6)
    solution_IK(4,2) = Theta2(1); %Front Elbow-up solution for theta(1)
    solution_IK(5,2) = Theta2(2); %Front Elbow-up solution for theta(2)
    solution_IK(6,2) = Theta2(3); %Front Elbow-up solution for theta(3)
    solution_IK(7,2) = Theta2(4); %Second possible solution for theta(1)
    solution_IK(8,2) = Theta2(5); %Second possible solution for theta(2)
    solution_IK(9,2) = Theta2(6); %Second possible solution for theta(3)


    %% Calculate Remaing Angles and Add to Solution Matrix for BEU 
    % BACK ELBOW-UP
    [R03] = R03Calc(BEU(1:3));
    Theta3 = Wrist(R06,R03);
    solution_IK(1,3) = BEU(1); %First possible solution for theta(4)
    solution_IK(2,3) = BEU(2); %First possible solution for theta(5)
    solution_IK(3,3) = BEU(3); %First possible solution for theta(6)
    solution_IK(4,3) = Theta3(1); %Front Elbow-up solution for theta(1)
    solution_IK(5,3) = Theta3(2); %Front Elbow-up solution for theta(2)
    solution_IK(6,3) = Theta3(3); %Front Elbow-up solution for theta(3)
    solution_IK(7,3) = Theta3(4); %Second possible solution for theta(1)
    solution_IK(8,3) = Theta3(5); %Second possible solution for theta(2)
    solution_IK(9,3) = Theta3(6); %Second possible solution for theta(3)
    %% Calculate Remaing Angles and Add to Solution Matrix for BED 
    % BACK ELBOW-DOWN
    [R03] = R03Calc(BED(1:3));
    Theta4 = Wrist(R06,R03);
    solution_IK(1,4) = BED(1); %First possible solution for theta(4)
    solution_IK(2,4) = BED(2); %First possible solution for theta(5)
    solution_IK(3,4) = BED(3); %First possible solution for theta(6)
    solution_IK(4,4) = Theta4(1); %First possible solution for theta(1)
    solution_IK(5,4) = Theta4(2); %First possible solution for theta(2)
    solution_IK(6,4) = Theta4(3); %First possible solution for theta(3)
    solution_IK(7,4) = Theta4(4); %Second possible solution for theta(1)
    solution_IK(8,4) = Theta4(5); %Second possible solution for theta(2)
    solution_IK(9,4) = Theta4(6); %Second possible solution for theta(3)