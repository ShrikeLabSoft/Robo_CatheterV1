%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Name:                 Kinematic handler for catheter
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
%  Kinematics_Inverse.m
% 
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
%
%   The kinematic equations for this code were based on the mechanisms
%   described in the following papers:
%   -Li, Zheng, and Ruxu Du. "Design and analysis of a bio-inspired wire-driven 
%   multi-section flexible robot." International Journal of Advanced Robotic 
%   Systems 10.4 (2013): 209.
%   -Li, Zheng, et al. "A novel tele-operated flexible robot targeted for 
%   minimally invasive robotic surgery." Engineering 1.1 (2015): 073-078.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Kinematics(mech_parameters)
%Kinematics_Forward(mech_aprameters);
vector = [0.1,0.5,0];
actuator_input = Kinematics_Inverse(mech_parameters, vector);
end