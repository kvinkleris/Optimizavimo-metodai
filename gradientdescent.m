% -------------------------------------------------------------------
%  Generated by MATLAB on 14-Oct-2021 20:19:05
%  MATLAB version: 9.10.0.1739362 (R2021a) Update 5
% -------------------------------------------------------------------
saveVarsMat = load('gradientdescent.mat');

f = saveVarsMat.f; % <1x1 function_handle> unsupported class

f2 = saveVarsMat.f2; % <1x1 function_handle> unsupported class

grad = saveVarsMat.grad; % <1x1 function_handle> unsupported class

gradf = saveVarsMat.gradf; % <1x1 function_handle> unsupported class

i = 1;

initialguess = [2; 3];

iterations = 50;

nextguess = [2; 3];

recordguesses = [2; 3];

stepsize = 0.01;

x1 = saveVarsMat.x1; % <401x401 double> too many elements

x2 = saveVarsMat.x2; % <401x401 double> too many elements

z = saveVarsMat.z; % <401x401 double> too many elements

clear saveVarsMat;
