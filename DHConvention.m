function [T] = DHConvention(angles,Fr)
% This function finds the transfrom matrix from one frame to another
    %% Initialise Robot DH-Perameters 
    aph = [pi/2,0,pi/2 ,-pi/2,pi/2,0];
    d = [0.103,0,0,0.165,0,0.04];
    a = [0.020,0.165,0,0,0,0] ;
    
    %% Homogenous Transformation Matrix to find Transform Matix 
    T = zeros(4,4);
    T(1,1) = cos(angles(Fr));
    T(1,2) = -sin(angles(Fr))*cos(aph(Fr));
    T(1,3) = sin(angles(Fr))*sin(aph(Fr));
    T(1,4) = a(Fr)*cos(angles(Fr));
    T(2,1) = sin(angles(Fr));
    T(2,2) = cos(angles(Fr))*cos(aph(Fr));
    T(2,3) = -cos(angles(Fr))*sin(aph(Fr));
    T(2,4) = a(Fr)*sin(angles(Fr));
    T(3,2) = sin(aph(Fr));
    T(3,3) = cos(aph(Fr));
    T(3,4) = d(Fr);
    T(4,4) = 1;
    