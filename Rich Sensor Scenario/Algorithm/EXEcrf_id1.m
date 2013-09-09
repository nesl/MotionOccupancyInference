function Error = EXEcrf_id1( LearnDataFinal,LearnGTruth,Learnday,TestDataFinal,TestGTruth,Testday,C )
%
% This function is used to learn and test the CRF model
% For the output, two different variables can be used:
% 1. Error: Symmetric Difference focusing on the identity of each occupant
% 2. Error_num: Absolute Value used in the inference of the number of
% occupants
% 
% Author: Longqi Yang   E-mail: ylongqi@gmail.com
%

file_template = fopen('F:/CRF/template','wt');
file_learn = fopen('F:/CRF/train.data','wt');
file_test = fopen('F:/CRF/test.data','wt');
frewind(file_template);
frewind(file_learn);
frewind(file_test);

fprintf('FILE Writing...\n');

%fprintf(file_template, '# Unigram\n');
fprintf(file_template, '# Bigram\n');
fprintf(file_template, 'B00:%%x[0,0]\n');
fprintf(file_template, 'B01:%%x[0,1]\n');
fprintf(file_template, 'B02:%%x[0,2]\n');
fprintf(file_template, 'B03:%%x[0,3]\n');
fprintf(file_template, 'B04:%%x[0,4]\n');
fprintf(file_template, 'B05:%%x[0,5]\n');
fprintf(file_template, 'B06:%%x[0,6]\n');
fprintf(file_template, 'B07:%%x[0,7]\n');
fprintf(file_template, 'B08:%%x[0,8]\n');
fprintf(file_template, 'B09:%%x[0,9]\n');
fprintf(file_template, 'B10:%%x[0,10]\n');
fprintf(file_template, 'B11:%%x[0,0]/%%x[0,1]/%%x[0,2]/%%x[0,3]/%%x[0,4]/%%x[0,5]/%%x[0,6]/%%x[0,7]/%%x[0,8]/%%x[0,9]\n');
%fprintf(file_template, '# Bigram\n');
%fprintf(file_template, 'B\n');

for i = 1:Learnday
    for j = 1:144
        presentindex = 144*(i - 1) + j;
        presenthour = fix((j - 1)/6) + 1;
        fprintf(file_learn,'%d %d %d %d %d %d %d %d %d %d %d %d\n',LearnDataFinal(presentindex,1),...
            LearnDataFinal(presentindex,2),LearnDataFinal(presentindex,3),LearnDataFinal(presentindex,4),...
            LearnDataFinal(presentindex,5),LearnDataFinal(presentindex,6),LearnDataFinal(presentindex,7),...
            LearnDataFinal(presentindex,8),LearnDataFinal(presentindex,9),LearnDataFinal(presentindex,10),...
            presenthour,LearnGTruth(1,presentindex));
    end
        fprintf(file_learn,'\n');
end

for i = 1:Testday
    for j = 1:144
        presentindex = 144*(i - 1) + j;
        presenthour = fix((j - 1)/6) + 1;
       fprintf(file_test,'%d %d %d %d %d %d %d %d %d %d %d %d\n',TestDataFinal(presentindex,1),...
            TestDataFinal(presentindex,2),TestDataFinal(presentindex,3),TestDataFinal(presentindex,4),...
            TestDataFinal(presentindex,5),TestDataFinal(presentindex,6),TestDataFinal(presentindex,7),...
            TestDataFinal(presentindex,8),TestDataFinal(presentindex,9),TestDataFinal(presentindex,10),...
            presenthour,TestGTruth(1,presentindex));
    end
        fprintf(file_test,'\n');
end

fclose(file_learn);
fclose(file_test);
fclose(file_template);

%ErrorFinal = [];

%Execute the learning program
system(strcat('F:/CRF/crf_learn -c',32,num2str(C), ...
        ' F:/CRF/template F:/CRF/train.data F:/CRF/model.data'));
%Prediction Part
system('F:/CRF/crf_test -m F:/CRF/model.data F:/CRF/test.data > F:/CRF/Testresult.txt');

Prediction = importdata('F:/CRF/Testresult.txt');

Error = 0;
Error_num = 0;
for i = 1:Testday
    for j = 1:144
        presentindex = (i - 1)*144 + j;
        presentstr = dec2bin(Prediction(presentindex,13) - 1,3);
        presentstrGTruth = dec2bin(TestGTruth(1,presentindex) - 1,3);
        if(str2double(presentstr(1,1)) ~= str2double(presentstrGTruth(1,1)))
            Error = Error + 1;
        end
        if(str2double(presentstr(1,2)) ~= str2double(presentstrGTruth(1,2)))
            Error = Error + 1;
        end
        if(str2double(presentstr(1,3)) ~= str2double(presentstrGTruth(1,3)))
            Error = Error + 1;
        end
        Predictionnum = str2double(presentstr(1,1)) + str2double(presentstr(1,2)) + str2double(presentstr(1,3));
        GTruthnum = str2double(presentstrGTruth(1,1)) + str2double(presentstrGTruth(1,2)) + str2double(presentstrGTruth(1,3));
        Error_num = Error_num + abs(Predictionnum - GTruthnum);
    end
end

Pred = Prediction(:,13)';
GT = TestGTruth;
end

