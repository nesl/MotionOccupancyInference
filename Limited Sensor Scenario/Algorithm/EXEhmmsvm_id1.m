function Error = EXEhmmsvm_id1( LearnDataFinal,LearnGTruth,Learnday,TestDataFinal,TestGTruth,Testday,C,e )
%
% This function is used to learn and test the HMM-SVM model
% For the output, two different variables can be used:
% 1. Error: Symmetric Difference focusing on the identity of each occupant
% 2. Error_num: Absolute Value used in the inference of the number of
% occupants
% 
% Author: Longqi Yang   E-mail: ylongqi@gmail.com
%
file_learn = fopen('..\HMMSVM\training_input.dat','wt');
file_test = fopen('..\HMMSVM\test_input.dat','wt');
frewind(file_learn);
frewind(file_test);

fprintf('FILE Writing...\n');
for i = 1:Learnday
    for j = 1:144
        presentindex = 144*(i - 1) + j;
        presenthour = fix((j - 1)/6) + 1;
        fprintf(file_learn,'%d qid:%d 1:%d 2:%d 3:%d 4:%d\n',...
            LearnGTruth(1,presentindex),i,LearnDataFinal(presentindex,1),LearnDataFinal(presentindex,2),...
            LearnDataFinal(presentindex,3),presenthour);
    end
end

for i = 1:Testday
    for j = 1:144
        presentindex = 144*(i - 1) + j;
        presenthour = fix((j - 1)/6) + 1;
        fprintf(file_test,'%d qid:%d 1:%d 2:%d 3:%d 4:%d\n',...
            TestGTruth(1,presentindex),i,TestDataFinal(presentindex,1),TestDataFinal(presentindex,2),...
            TestDataFinal(presentindex,3),presenthour);
    end
end

fclose(file_learn);
fclose(file_test);
%ErrorFinal = [];

    %Execute the learning program
system(strcat('..\HMMSVM\svm_hmm_learn -c',32,num2str(C),' -e',32,num2str(e), ...
        ' ..\HMMSVM\training_input.dat ..\HMMSVM\modelfile.dat'));
    %Prediction Part
system(strcat('..\HMMSVM\svm_hmm_classify ..\HMMSVM\test_input.dat ..\HMMSVM\modelfile.dat ..\HMMSVM\classify.tags'));

Prediction = importdata('..\HMMSVM\classify.tags');

 
Error1 = 0;
Error2 = 0;
Error3 = 0;
Error = 0;
Error_num = 0;
for i = 1:Testday
    for j = 1:144
        presentindex = (i - 1)*144 + j;
        presentstr = dec2bin(Prediction(presentindex,1) - 1,3);
        presentstrGTruth = dec2bin(TestGTruth(1,presentindex) - 1,3);
        if(str2double(presentstr(1,1)) ~= str2double(presentstrGTruth(1,1)))
            Error1 = Error1 + 1;
            Error = Error + 1;
        end
        if(str2double(presentstr(1,2)) ~= str2double(presentstrGTruth(1,2)))
            Error2 = Error2 + 1;
            Error = Error + 1;
        end
        if(str2double(presentstr(1,3)) ~= str2double(presentstrGTruth(1,3)))
            Error3 = Error3 + 1;
            Error = Error + 1;
        end
        Predictionnum = str2double(presentstr(1,1)) + str2double(presentstr(1,2)) + str2double(presentstr(1,3));
        GTruthnum = str2double(presentstrGTruth(1,1)) + str2double(presentstrGTruth(1,2)) + str2double(presentstrGTruth(1,3));
        Error_num = Error_num + abs(Predictionnum - GTruthnum);
    end
end
    %ErrorFinal = [ErrorFinal Error];

end

