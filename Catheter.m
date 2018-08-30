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
%    I N C L U D E S
%  Kinematics.m
%  Microcontrol.m
%  GUI.m
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    D E F I N E S
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   \FUNCTION   main
%   \CREATION             08/29/2018
%   \INPUT                \param
%   \GLOBAL_VARS
%   \OUTPUT
%   \FUNCTION_CALLED
% 
%   \ABSTRACT
%
%   \COMMENTS

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function main

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mechanical parameters and constraints
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

length_vertebra_meters = 0.005;                                            
max_angle_vertebrae_degree = 30;
free_vertebra = 5;
constrained_vertebra = 2;

max_angle_vertebrae_radians = degtorad(max_angle_vertebrae_degree);

mech_parameters = [length_vertebra_meters,max_angle_vertebrae_radians,
  free_vertebra, constrained_vertebra]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main Program 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Kinematics(mech_parameters);
Microcontroller();
GUI(mech_parameters);


end