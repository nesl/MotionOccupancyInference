%
% The script 'ID' is used in the project 'Residential Occupancy Analysis
% Using Motion Sensors'.
% This is used in the 'Limited Sensor Senario', which is different from the
% one used in the 'Rich Sensor Senario'
% There are totally four methods: Rule-based, HMM, CRF, HM-SVM
% A function is available for each method.
% For more details, please refer to 'Readme.txt' file or contact:
% ylongqi@gmail.com
%
% Author: Longqi Yang
%

clear;clc;

addpath './Layout and Connect'
addpath ./HMM
addpath ./DataPreProcessing
addpath ./Algorithm

%The feature used in this script is the existence of the motion
timeinteval = 10;

%Load in the Data from the sensor
Data = GetDataAlarm();

%Preprocessing the data(Block the data)
for i = 1:9
    Data(:,:,i) = Datablock(Data(:,:,i));
end


Test = 9;

[ LearnDataFinal, LearnGTruth, Learnday, TestDataFinal, TestGTruth, Testday ] = ID_DataPrepare1( Data,Test );

C_HMM = 197;
e_HMM = 0.5;
C_CRF = 5.1;

%Error = GenerativeHMM_id( LearnDataFinal,LearnGTruth,TestDataFinal,TestGTruth );
%Error = EXEhmmsvm_id1( LearnDataFinal,LearnGTruth,Learnday,TestDataFinal,TestGTruth,Testday,C_HMM,e_HMM ); 
Error = EXEcrf_id1( LearnDataFinal,LearnGTruth,Learnday,TestDataFinal,TestGTruth,Testday,C_CRF );

rmpath './Layout and Connect'
rmpath ./HMM
rmpath ./DataPreProcessing
rmpath ./Algorithm
