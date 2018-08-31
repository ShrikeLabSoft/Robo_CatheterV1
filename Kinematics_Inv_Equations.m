function solutions = Kinematics_Inv_Equations(initial_constraints,mech_parameters,vector)

  x_f = vector(1);
  y_f = vector(2);
  z_f = vector(3);
  N = mech_parameters(3);
  
  a= sqrt(initial_constraints(2)*atan(((atan(initial_constraints(2)/initial_constraints(1))*N)/(2*N-1))^2));
  b = sqrt(initial_constraints(1)^2 + initial_constraints(2)^2) + initial_constraints(3);
  
  solutions(1) = b * cos(a) - x_f;
  solutions(2) = b * sin(a) - y_f;
  solutions(3) = atan((initial_constraints(2))/(initial_constraints(1))) - atan(y_f/x_f);

end