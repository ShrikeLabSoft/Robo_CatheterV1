%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Name:                 Inverse Kinematic functions for catheter
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
%  Kinematics_Inv_Equations.m
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   \FUNCTION         Kinematics Inverse
%   \CREATION         08/29/2018
%   \INPUT            mech_parameters,vector              
%   \GLOBAL_VARS
%   \OUTPUT           lengths
%   \FUNCTION_CALLED
%                     calculate_wire_lengths
%                     calculate_vertebrae_angle
%                     Rotate_vector_2D_analysis
%                     Rotate_vector_3D_analysis
%                     Kinematics_Inverse_Solver
%                     free_roty
%   \ABSTRACT
%   This function takes an desired 3-D position vector as input and 
%   outputs the new lengths of the wire tendons to be moved and the
%   displacement of the linear actuators. It rotates the robot workspace
%   to work on the xy plane, does the inverse kinematic calculation for 
%   the linear actuator in 2-D, and then rotates back and does the reverse
%   kinematics for the wires. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function actuator_input = Kinematics_Inverse(mech_parameters,vector)
    
    [rotated_vector, angle_rotation] = Rotate_vector_2D_analysis(vector);
    result_vector = Kinematics_Inverse_Solver(mech_parameters,rotated_vector);
    final_vector = Rotate_vector_3D_analysis(result_vector, angle_rotation);
    vertebra_angle = calculate_vertebrae_angle(mech_parameters, final_vector);
    lengths = calculate_wire_lengths(mech_parameters, vertebra_angle, angle_rotation);
    actuator_input = [lengths , result_vector(3)]
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %   \FUNCTION   calculate_wire_lengths
    %   \CREATION             08/29/2018
    %   \INPUT                mech_parameters, theta, angle_rotation
    %   \GLOBAL_VARS
    %   \OUTPUT               lengths
    %   \FUNCTION_CALLED
    % 
    %   \ABSTRACT
    %   Function that calculates the actuator values based on angles of
    %   vertebra and rotation of catheter
    %   \COMMENTS

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    function lengths = calculate_wire_lengths(mech_parameters, theta, angle_rotation)
        h0 = mech_parameters(1);
        lengths = [0,0,0,0];
        N = mech_parameters(3);
        d = mech_parameters(5);
        L = mech_parameters(6);
        
        a = (d/2)*sin(angle_rotation);
        b = (d/2)*cos(angle_rotation);
        
        lengths(1) = L + 2*N*(b*sin(theta/2)-h0*sin(theta/2).^2) ;
        lengths(2) = L + 2*N*(a*sin(theta/2)-h0*sin(theta/2).^2) ;
        lengths(3) = L - 2*N*(b*sin(theta/2)+h0*sin(theta/2).^2) ;
        lengths(4) = L - 2*N*(a*sin(theta/2)+h0*sin(theta/2).^2) ; 
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %   \FUNCTION   calculate_vertebrae_angle
    %   \CREATION             08/29/2018
    %   \INPUT                mech_parameters, vector
    %   \GLOBAL_VARS
    %   \OUTPUT
    %   \FUNCTION_CALLED
    % 
    %   \ABSTRACT
    %   Calculates the angle of vertebra based on xyz coordinates
    %   \COMMENTS

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    function theta = calculate_vertebrae_angle(mech_parameters, vector)
        x = vector(1);
        y = vector(2);
        z = vector(3);
        N = mech_parameters(3);
        theta = ((2*N-1)/(N*(N-0.5)))*atan((sqrt(x.^2+ y.^2))/(z));
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %   \FUNCTION   Rotate_vector_2D_analysis
    %   \CREATION             08/29/2018
    %   \INPUT                vector
    %   \GLOBAL_VARS 
    %   \OUTPUT               [rotated_vector,angle_rotation]
    %   \FUNCTION_CALLED
    % 
    %   \ABSTRACT
    %   Takes the xyz goal vector, checks its angle to the xy plane
    %   and rotates it to study the catheter  in 2D
    %   \COMMENTS

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    function [rotated_vector,angle_rotation] = Rotate_vector_2D_analysis(vector)
        angle_rotation = (atan(vector(3)/vector(1)));
        rotation_matrix = free_roty(-angle_rotation);
        rotated_vector = vector * rotation_matrix;
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %   \FUNCTION   Rotate_vector_3D_analysis
    %   \CREATION             08/29/2018
    %   \INPUT                vector, angle_rotation
    %   \GLOBAL_VARS
    %   \OUTPUT               final_vector
    %   \FUNCTION_CALLED
    %   
    %   \ABSTRACT
    %   this function takes the vector after the 2D inverse kinematics
    %   analysis and rotates it to the original plane
    %
    %   \COMMENTS
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    function final_vector = Rotate_vector_3D_analysis(vector, angle_rotation)
        angle_rotation = (atan(vector(3)/vector(1)));
        rotation_matrix = free_roty(angle_rotation);
        final_vector = vector * rotation_matrix;
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %   \FUNCTION   Kinematics_Inverse_Solver
    %   \CREATION             08/29/2018
    %   \INPUT                mech_parameters, vector
    %   \GLOBAL_VARS
    %   \OUTPUT               final_solution
    %   \FUNCTION_CALLED
    % 
    %   \ABSTRACT
    %   Takes the desired xy coordinates of the end of the actuator and
    %   calculates xy coordinates for the end of vertebrae and displacement
    %   of linear actuator
    %   
    %   \COMMENTS

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %solving the problem in 2D
    function final_solution = Kinematics_Inverse_Solver(mech_parameters, vector)
        initial_solutions = [-1,-1,1];
        final_solution = fsolve(@(initial_constraints) Kinematics_Inv_Equations(initial_constraints, mech_parameters, vector), initial_solutions)
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %   \FUNCTION   free_roty
    %   \CREATION             08/29/2018
    %   \INPUT                angle
    %   \GLOBAL_VARS              
    %   \OUTPUT               rotation_matrix
    %   \FUNCTION_CALLED
    % 
    %   \ABSTRACT
    %   This function creates a 3D rotation matrix around the y axis,
    %   based on an angle of rotation in radians
    %   \COMMENTS
    %   This function is equivalent to the roty function from 
    %   the phased array toolbox, differing only in its use of radians
    %   https://www.mathworks.com/help/phased/ref/roty.html
    %   this function doesn't need buy the phased array toolbox ($$$)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    function rotation_matrix = free_roty(angle)
        rotation_matrix = [cos(angle),0,sin(angle);0,1,0;-sin(angle),0,cos(angle)];
    end


end