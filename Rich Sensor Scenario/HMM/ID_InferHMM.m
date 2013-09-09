function [Gama, Q] = ID_InferHMM( s, y )

ssize = size(s);
totalnum = ssize(1,2);
daynum = totalnum/144;

countGama = zeros(8,8,24);     %4 is the dimention of the state space
countQ = zeros(8,2048,2);         %5 is the total categories of observations
Gama = zeros(8,8,24);
Q = zeros(8,2048,2);

for day = 1:daynum
    for slot = 1:144
        if (~(slot == 144 && day == daynum))
        %Learning of the parameters in the trasition Matrix
        currenthour = fix((slot - 1)/6) + 1;
        currentindex = (day - 1)*144 + slot;
        countGama(s(1,currentindex),s(1,currentindex + 1),currenthour) = ...
            countGama(s(1,currentindex),s(1,currentindex + 1),currenthour) + 1;
        
        %Learning of the parameters in conditional probability
        
        if(slot >= 7 && slot <= 42)
            currentmode = 1;
        else
            currentmode = 2;
        end
        
        observation = bin2dec(num2str(y(currentindex,:) - 1)) + 1;
        countQ(s(1,currentindex),observation,currentmode) = ...
            countQ(s(1,currentindex),observation,currentmode) + 1;
        end
    end
end

for i = 1:24
    for j = 1:8
        total = sum(countGama(j,:,i));
        if(total)
        Gama(j,:,i) = (countGama(j,:,i) + 1)/(total + 8);
        else
        Gama(j,:,i) = 0.125*ones(1,8);    
        end
    end
end

for i = 1:2
    for j = 1:8
        total = sum(countQ(j,:,i));
        if(total)
        Q(j,:,i) = (countQ(j,:,i) + 1)/(total + 2048);
        else
        Q(j,:,i) = (1/2048)*ones(1,2048);    
        end
    end
end


end

