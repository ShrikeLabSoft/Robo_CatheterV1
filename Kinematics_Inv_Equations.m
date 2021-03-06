%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Name:                 Inverse Kinematics Equations for linear actuator
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   \FUNCTION             Kinematics_Inv_Equations
%   \CREATION             08/29/2018
%   \INPUT                initial_constraints, mech_parameters, vector             
%   \GLOBAL_VARS 
%   \OUTPUT               solutions
%   \FUNCTION_CALLED
% 
%   \ABSTRACT
%   This function is a set of equations in which the input is an array with
%   the desired xy final coordinates of the catheter un a 2D plane, and the output is 
%   an array with the xy coordinates of the last vertebrae plus the
%   needed displacement of the linear actuator.
%
%   \COMMENTS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function solutions = Kinematics_Inv_Equations(initial_constraints,mech_parameters,vector)

  x_f = vector(1);
  y_f = vector(2);
  
  N = mech_parameters(3);
  
  a= sqrt(initial_constraints(2)*atan(((atan(initial_constraints(2)/initial_constraints(1))*N)/(2*N-1))^2));
  b = sqrt(initial_constraints(1)^2 + initial_constraints(2)^2) + initial_constraints(3);
  
  solutions(1) = b * cos(a) - x_f;
  solutions(2) = b * sin(a) - y_f;
  solutions(3) = atan((initial_constraints(2))/(initial_constraints(1))) - atan(y_f/x_f);

end