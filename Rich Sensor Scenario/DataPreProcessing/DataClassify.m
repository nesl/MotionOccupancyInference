function [ LearnData, LearnGTruth, TestData, TestGTruth ] = DataClassify( Data,GTruth,Learnday,Testday,Test )
%
%This function is used to divide the data into the Learn Data and Test Data
%
Totalday = Learnday + Testday;
if(Test == 1)
    LearnData = Data(:,:,2:Totalday);
    LearnGTruth = [];
    for i = 2:Totalday
    LearnGTruth = [LearnGTruth GTruth(i,:)];
    end
    TestData = Data(:,:,1);
    TestGTruth = GTruth(1,:);
else if(Test == Totalday)
        LearnData = Data(:,:,1:Totalday - 1);
        LearnGTruth = [];
        for i = 1:Totalday - 1
            LearnGTruth = [LearnGTruth GTruth(i,:)];
        end
        TestData = Data(:,:,Totalday);
        TestGTruth = GTruth(Totalday,:);
    else
        LearnData = cat(3,Data(:,:,1:Test - 1),Data(:,:,Test + 1:Totalday));
        LearnGTruth = [];
        for i = 1:Test - 1
            LearnGTruth = [LearnGTruth GTruth(i,:)];
        end
        for i = Test + 1:Totalday
            LearnGTruth = [LearnGTruth GTruth(i,:)];
        end
        TestData = Data(:,:,Test);
        TestGTruth = GTruth(Test,:);
    end
end

end

