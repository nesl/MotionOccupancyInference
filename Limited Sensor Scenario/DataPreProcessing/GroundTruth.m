function [P1, P2, P3] = GroundTruth( Datain )
%
%The function of GroundTruth can process the data from the raw ground
%truth.
%
insize = size(Datain);
rowsize = insize(1,1);

Person1 = ones(1,86400);
Person2 = ones(1,86400);
Person3 = ones(1,86400);

P1start = 1; 
P2start = 1;
P3start = 1;

for i = 1:rowsize
    Thisstr = cell2mat(Datain(i,:));
    Thishour = str2double(Thisstr(1,2:3));
    Thisminute = str2double(Thisstr(1,5:6));
    Thissecond = str2double(Thisstr(1,8:9));
    ThisP1 = Thisstr(1,13);
    ThisP2 = Thisstr(1,15);
    ThisP3 = Thisstr(1,17);
    time = Thishour*3600 + Thisminute*60 + Thissecond;
    
    if(ThisP1 == 'L')
        P1start = time;
        else if(ThisP1 == 'E')
                Person1(1,P1start:time) = zeros(1,time - P1start + 1);
            end
    end
    
    if(ThisP2 == 'L')
        P2start = time;
        else if(ThisP2 == 'E')
                Person2(1,P2start:time) = zeros(1,time - P2start + 1);
            end
    end
    
    if(ThisP3 == 'L')
        P3start = time;
        else if(ThisP3 == 'E')
                Person3(1,P3start:time) = zeros(1,time - P3start + 1);
            end
    end    
end
% Person1, Person2 and Person3 are in the second-interval
% P1, P2 and P3 are in the 10minute-interval

P1 = [];
P2 = [];
P3 = [];
for i = 1:144
    sum = 0;
    for j = 1:600
        if(Person1(1,600*(i - 1) + j))
            sum = sum + 1;
        end
    end
    if(sum >= 300)
        P1 = [P1 1];
    else
        P1 = [P1 0];
    end
end

for i = 1:144
    sum = 0;
    for j = 1:600
        if(Person2(1,600*(i - 1) + j))
            sum = sum + 1;
        end
    end
    if(sum >= 300)
        P2 = [P2 1];
    else
        P2 = [P2 0];
    end
end

for i = 1:144
    sum = 0;
    for j = 1:600
        if(Person3(1,600*(i - 1) + j))
            sum = sum + 1;
        end
    end
    if(sum >= 300)
        P3 = [P3 1];
    else
        P3 = [P3 0];
    end
end


end

