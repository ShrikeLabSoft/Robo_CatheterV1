function [xf,yf,zf] = Kinematics_Forward(L1,L2,L3,L4,d,N)
% xf,yi,zf Are final coordinates after linear actuator
% L1,L2,L3,L4 Are string lengths
% d Is length of linear actuator
% N is number of nodes

%%%%%%%%%%%%%%%%%Actuator to angle%%%%%%%%%%%%%%%%%%
thetafin = 2*N*asin(sqrt((L1-L3)^2+(L2-L4)^2)/(2*N*d));
theta = thetafin/N;
phi = atan((L2-L4)/(L1-L3));
%%%%%%%%%%%%%%%%%Angle to i-coords%%%%%%%%%%%%%%%%%%%%
xi = (H+h0)*sin(N*theta/2)^2/sin(theta/2)*cos(phi);
yi = (H+h0)*sin(N*theta/2)^2/sin(theta/2)*sin(phi);
zi = (H+h0)*sin(N*theta/2)*cos(N*theta/2)/sin(theta/2);
%%%%%%%%%%%%%%%%%I-coords to f-coords%%%%%%%%%%%%%%%%%
xf = xi + cos(phi)*sin(thetafin)*d;
yf = yi + sin(phi)*sin(thetafin)*d;
zf = zi + cos(thetafin)*d;
end