%
% The script 'ID' is used in the project 'Residential Occupancy Analysis
% Using Motion Sensors'.
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
Data = GetData();

ErrorFinal = [];

%Preprocessing the data(Block the data)
for i = 1:9
    Data(:,:,i) = Datablock(Data(:,:,i));
end

Test = 9;

%[ LearnDataFinal, LearnGTruth, Learnday, TestDataFinal, TestGTruth, Testday ] = ID_DataPrepare1( Data,Test );  % ID_DataPrepare1 is for other models: Conditional HMM, CRF, HM-SVM
[ LearnDataFinal, LearnGTruth, Learnday, TestDataFinal, TestGTruth, Testday ] = ID_DataPrepare3( Data,timeinteval,Test );  % ID_DataPrepare3 is only for the Rule-based method

% Parameters setting in HMM-SVM
C_HMM = 8;
e_HMM = 0.5;
% Parameter setting in CRF
C_CRF = 1.8;

Error = ID_Rule_Based( TestDataFinal, TestGTruth );   %Rule-based Method
%Error = GenerativeHMM_id(LearnDataFinal,LearnGTruth,TestDataFinal,TestGTruth ); %Conditional HMM
%Error = EXEhmmsvm_id1( LearnDataFinal,LearnGTruth,Learnday,TestDataFinal,TestGTruth,Testday,C_HMM,e_HMM );
                                                                                 %HM-SVM
%Error = EXEcrf_id1( LearnDataFinal,LearnGTruth,Learnday,TestDataFinal,TestGTruth,Testday,C_CRF );
                                                                                 %CRF
rmpath './Layout and Connect'
rmpath ./HMM
rmpath ./DataPreProcessing
rmpath ./Algorithm
