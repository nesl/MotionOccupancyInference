function [  LearnDataFinal, LearnGTruth, Learnday, TestDataFinal, TestGTruth, Testday  ] = ID_DataPrepare1( Data,Test )

[GTruth1, GTruth2, GTruth3] = GetGroundTruth();
GroundTruthsize = size(GTruth1);
GTruth = [];
for i = 1:GroundTruthsize(1,1)
    ThisGTruth = [];
    for j = 1:GroundTruthsize(1,2)
        ThisGTruth = [ThisGTruth bin2dec(strcat(num2str(GTruth1(i,j)),num2str(GTruth2(i,j)),num2str(GTruth3(i,j)))) + 1];
    end
    GTruth = [GTruth;ThisGTruth];
end

%Setting of the parameters
Learnday = 8;
Testday = 1;
[ LearnData, LearnGTruth, TestData, TestGTruth ] = DataClassify( Data,GTruth,Learnday,Testday,Test );
%Setting of the parameters

LearnDataFinal = [];
for i = 1:Learnday
    for j = 1:144
        Exist = FeatureExist(LearnData(:,(j - 1)*600 + 1:j*600,i));
        LearnDataFinal = [LearnDataFinal; Exist];
    end
end
LearnDataFinal = LearnDataFinal + 1;   %Convert the absolute value to the state number

TestDataFinal = [];
for i = 1:Testday
    for j = 1:144
        Exist = FeatureExist(TestData(:,(j - 1)*600 + 1:j*600,i));
        TestDataFinal = [TestDataFinal; Exist];
    end
end
TestDataFinal = TestDataFinal + 1;


end

