function Kinematics_Inverse

fun = @Kinematics_Inv_Equations;
x0 = [0.01,0.03,0.001];
x = fsolve(fun,x0);

disp(x)

end