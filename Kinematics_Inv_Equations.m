function solutions = Kinematics_Inv_Equations(initial_constraints)

  x_f = 0.4;
  y_f = 0.3;
  N = 10;
  
  
%   equations(1) = sqrt(x(1)^2 + x(2)^2) + x(3) * cos(sqrt(x(2)*atan(((atan(x(2)/x(1))*N)/(2*N-1))^2))) - x_f;
%   equations(2) = sqrt(x(1)^2 + x(2)^2) + x(3) * sin(sqrt(x(2)*atan(((atan(x(2)/x(1))*N)/(2*N-1))^2))) - y_f;
%   equations(3) = atan((x(2))/(x(1))) - atan(y_f/x_f);
  
  a= sqrt(initial_constraints(2)*atan(((atan(initial_constraints(2)/initial_constraints(1))*N)/(2*N-1))^2));
  b = sqrt(initial_constraints(1)^2 + initial_constraints(2)^2) + initial_constraints(3);
  
  solutions(1) = b * cos(a) - x_f;
  solutions(2) = b * sin(a) - y_f;
  solutions(3) = atan((initial_constraints(2))/(initial_constraints(1))) - atan(y_f/x_f);

end