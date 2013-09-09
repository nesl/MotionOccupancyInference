function Error_num = GenerativeHMM_id( LearnDataFinal,LearnGTruth,TestDataFinal,TestGTruth )

fprintf( 'Infer the parameters...\n' );
[Gama, Q] = ID_InferHMM(LearnGTruth,LearnDataFinal);
fprintf( 'Parameters OK!\n' );

fprintf( 'Viterbi Algorithm...\n');
Predict = ID_ViterbiHMM(Gama, Q, TestDataFinal);
fprintf( 'Prediction OK!\n' );

%figure;
%plot(1:144,Predict);
%hold on;
%plot(1:144,TestGTruth,'r');
Error = 0;
Error_num = 0;
for i = 1:144
        presentstr = dec2bin(Predict(1,i) - 1,3);
        presentstrGTruth = dec2bin(TestGTruth(1,i) - 1,3);
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

