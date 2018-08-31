function Kinematics_Inverse(mech_parameters,vector)
    
    Kinematics_Inverse_Solver(mech_parameters,vector);
    
    function Kinematics_Inverse_Solver(mech_parameters, vector)
        initial_solutions = [0.01,0.03,0.001];
        final_solution = fsolve(@(initial_constraints) Kinematics_Inv_Equations(initial_constraints, mech_parameters, vector), initial_solutions);
        disp(final_solution)
    end

end