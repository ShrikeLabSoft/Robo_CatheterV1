%   Name:                 Software package for Catheter Project
%   File Name:            Catheter Profile
%   Start Date:           08/29/2018
%   Developed by:         Engineered Biosystems lab
%   Programmers:          Andres Garcia Rubio
%   References:           
%   Lenguage:             Matlab
%   Abstract:             
% 
%   Hardware:             Arduino Mega
%   IDE:                  Matlab R2017b Windows 7 64-bit Edition

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Change LOG
%
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    I N C L U D E S
%
%  kinematics_catheter.m
%  inverse_kinematics_catheter.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    D E F I N E S
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function main

length_vertebra_meters = 0.005;
max_angle_vertebrae_degree = 30;
max_angle_vertebrae_radians = degtorad(max_angle_vertebrae_degree);

free_vertebra = 5;
constrained_vertebra = 2;

disp(free_vertebra)

end