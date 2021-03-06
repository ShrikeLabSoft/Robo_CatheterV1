%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%   \FUNCTION   main
%   \CREATION             08/29/2018
%   \INPUT                \param
%   \GLOBAL_VARS
%   \OUTPUT
%   \FUNCTION_CALLED
%   Kinematics
%   Microcontroller
%   GUI
% 
%   \ABSTRACT
%
%   \COMMENTS

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function main

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mechanical parameters and constraints
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

length_vertebra_meters = 0.01;                                            
max_angle_vertebrae_degree = 30;
free_vertebra = 5;
constrained_vertebra = 2;
diameter_vertebra = 0.005;
initial_wire_length = 0.05;

max_angle_vertebrae_radians = degtorad(max_angle_vertebrae_degree);

mech_parameters = [length_vertebra_meters,max_angle_vertebrae_radians, free_vertebra, constrained_vertebra, diameter_vertebra, initial_wire_length];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main Program 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Kinematics(mech_parameters);
Microcontroller();
GUI(mech_parameters);



end