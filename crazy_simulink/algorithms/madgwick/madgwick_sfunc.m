function [sys,x0,str,ts] = madgwicksfunc(t,x,u,flag,param)

switch flag,
    case 0
        [sys,x0,str,ts] = mdlInitializeSizes(param);
	case 2
        sys = mdlUpdates(x,u,param);
	case 3
        sys = mdlOutputs(x);
    case {1, 4, 9}
        sys = [];
    otherwise
        error(['Unhandled flag = ',num2str(flag)]);
end

function [sys,x0,str,ts] = mdlInitializeSizes(param)

sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 4;
sizes.NumOutputs     = 4; % 4 dof - quaternion
sizes.NumInputs      = 6; % 6 dof - accelerometer (aG) and gyro (wB)
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes); 

x0 = [1,0,0,0];
str = [];                % Set str to an empty matrix.
ts  = [param.h 0];       % sample time: [period, offset]
		      
%==============================================================
% Update the discrete states
%==============================================================
function sys = mdlUpdates(x,u,param)
dt = param.h;
beta = param.beta;

a = u(1:3);
g = u(4:6);
q = x;

% Normalise accelerometer measurement
if(norm(a) == 0)
    disp('here')
end	% handle NaN
a = a / norm(a);	% normalise magnitude

% Gradient decent algorithm corrective step
F = [-2*(q(2)*q(4) - q(1)*q(3)) - a(1)
     -2*(q(1)*q(2) + q(3)*q(4)) - a(2)
     -2*(0.5 - q(2)^2 - q(3)^2) - a(3)];
J = -[-2*q(3),	2*q(4),    -2*q(1),	2*q(2)
      2*q(2),     2*q(1),     2*q(4),	2*q(3)
      0,         -4*q(2),    -4*q(3),	0    ];
step = J'*F;
step = step / norm(step);	% normalise step magnitude

% Compute rate of change of quaternion
qDot = 0.5 * quaternProd(q, [0 g(1) g(2) g(3)]) - beta * step;

% Integrate to yield quaternion
q = q + qDot * dt;

% Normalize
q = q./norm(q);
sys = q;

%==============================================================
% Calculate outputs
%==============================================================
function sys = mdlOutputs(x)
sys = x(1:4);


function ab = quaternProd(a, b)
ab = [a(1).*b(1)-a(2).*b(2)-a(3).*b(3)-a(4).*b(4);
      a(1).*b(2)+a(2).*b(1)+a(3).*b(4)-a(4).*b(3);
      a(1).*b(3)-a(2).*b(4)+a(3).*b(1)+a(4).*b(2);
      a(1).*b(4)+a(2).*b(3)-a(3).*b(2)+a(4).*b(1)];
