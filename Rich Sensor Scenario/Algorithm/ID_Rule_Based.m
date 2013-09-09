function Error = ID_Rule_Based( TestDataFinal, TestGTruth )
%
% This function is for the rule-based method
% For the output, two different variables can be used:
% 1. Error: Symmetric Difference focusing on the identity of each occupant
% 2. Error_num: Absolute Value used in the inference of the number of
% occupants
% 
% Author: Longqi Yang   E-mail: ylongqi@gmail.com
%

fprintf('Rule Based Inference...\n');

Error = 0;
Error_num = 0;
Inference = [];
for i = 1:144
    if(i <= 42 || i >= 108)
    Inference = [Inference 4];
    else
        if(TestDataFinal(1,i) >= 4)
            Inference = [Inference 4];
        else if(TestDataFinal(1,i) == 3)
                Inference = [Inference 3];
            else if(TestDataFinal(1,i) == 2)
                Inference = [Inference 2];
                else
                    Inference = [Inference 1];
                end
            end
        end
    end
end
Inference = Inference - 1;

%Error Calculation from the 'number' view
for i = 1:144
        presentstrGTruth = dec2bin(TestGTruth(1,i) - 1,3);
        GTruthnum = str2double(presentstrGTruth(1,1)) + str2double(presentstrGTruth(1,2)) + str2double(presentstrGTruth(1,3));
        Error_num = Error_num + abs(GTruthnum - Inference(1,i));
end

%Error Calculation from the 'identity' view
%Prediction = [];
pre = ones(1,3);
for i = 1:144
if(Inference(1,i) == 3)
        presentstate = ones(1,3);
else
    if(i >= 2)
        randnum = rand(1,1);
        if(Inference(1,i) > Inference(1,i - 1))
            prestate = find(~pre);
            [a, zero_num] = size(find(~pre));
            if(zero_num == Inference(1,i) - Inference(1,i - 1))
                presentstate = ones(1,3);
            else if(Inference(1,i - 1) == 0 && Inference(1,i) == 1)
                    if(randnum <= 0.33)
                        presentstate = [1 0 0];
                    else if(randnum > 0.33 && randnum <=0.66)
                            presentstate = [0 1 0];
                        else
                                presentstate = [0 0 1];
                        end
                    end
                else if(Inference(1,i - 1) == 0 && Inference(1,i) == 2)
                      if(randnum <= 0.33)
                        presentstate = [1 1 0];
                      else if(randnum > 0.33 && randnum <=0.66)
                            presentstate = [0 1 1];
                          else
                                presentstate = [1 0 1];
                          end
                      end  
                    else if(Inference(1,i - 1) == 1 && Inference(1,i) == 2)
                            if(randnum >= 0.5)
                                presentstate(1,prestate(1,1)) = 1;
                            else
                                presentstate(1,prestate(1,2)) = 1;
                            end
                        end
                    end
                end
            end
        else if(Inference(1,i) < Inference(1,i - 1))
                prestate = find(pre);
            [a, one_num] = size(find(pre));
            if(one_num == Inference(1,i - 1) - Inference(1,i))
                presentstate = zeros(1,3);
            else if(Inference(1,i - 1) == 3 && Inference(1,i) == 2)
                    if(randnum <= 0.33)
                        presentstate = [1 1 0];
                    else if(randnum > 0.33 && randnum <=0.66)
                            presentstate = [0 1 1];
                        else
                                presentstate = [1 0 1];
                        end
                    end
                else if(Inference(1,i - 1) == 3 && Inference(1,i) == 1)
                      if(randnum <= 0.33)
                        presentstate = [1 0 0];
                      else if(randnum > 0.33 && randnum <=0.66)
                            presentstate = [0 0 1];
                          else
                                presentstate = [0 0 1];
                          end
                      end  
                    else if(Inference(1,i - 1) == 2 && Inference(1,i) == 1)
                            if(randnum >= 0.5)
                                presentstate(1,prestate(1,1)) = 0;
                            else
                                presentstate(1,prestate(1,2)) = 0;
                            end
                        end
                    end
                end
            end
        
            end
        end
    end
end
        %Prediction = [Prediction bin2dec(num2str(presentstate))];
        pre = presentstate;
%         Judge the Error
        presentstrGTruth = dec2bin(TestGTruth(1,i) - 1,3);
        if(presentstate(1,1) ~= str2double(presentstrGTruth(1,1)))
            Error = Error + 1;
        end
        if(presentstate(1,2)~= str2double(presentstrGTruth(1,2)))
            Error = Error + 1;
        end
        if(presentstate(1,3) ~= str2double(presentstrGTruth(1,3)))
            Error = Error + 1;
        end
end
fprintf('Prediction OK...\n');

%plot(1:144, Prediction);
%hold on;
%plot(1:144, TestGTruth - 1,'r');


