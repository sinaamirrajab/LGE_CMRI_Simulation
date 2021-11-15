% Simulating LGE images at different breathing positions
clc
clear
addpath('.\Utils')

% path to XCAT .bin files
filepath = '..\.\XCAT_Subject_10_Breathing\SAview\';
phase = 10;
% name of XCAT subjects
filename = '26June2020_I_Type_Cylinder_Resp_act_1.bin';
for i = 1:phase
filepath2 = [ filepath num2str(i) '\'];
subject = ['Respiratory_' num2str(i)];
MRXCAT_CMR_LGE(filename,filepath2,'subject',subject);
fprintf(['simulated respiratory phase...' num2str(i) '\n'])   
end
