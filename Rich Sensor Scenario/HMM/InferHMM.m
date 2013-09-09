function [Gama, Q] = InferHMM( s, y )
% 
%This function can learn the parameters in the HMM that is used in the
%occupancy inference.
%Attention: Before using this function, make sure that the input state is
%from 1 to 4; the input observation is from 1 to 5;
%
%Author: Yang Longqi  Final update: 8/7/2013
%

ssize = size(s);
totalnum = ssize(1,2);
daynum = totalnum/144;

countGama = zeros(4,4,24);     %4 is the dimention of the state space
countQ = zeros(4,5,2);         %5 is the total categories of observations
Gama = zeros(4,4,24);
Q = zeros(4,5,2);

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
        
        countQ(s(1,currentindex),y(1,currentindex),currentmode) = ...
            countQ(s(1,currentindex),y(1,currentindex),currentmode) + 1;
        end
    end
end

for i = 1:24
    for j = 1:4
        total = sum(countGama(j,:,i));
        if(total)
        Gama(j,:,i) = countGama(j,:,i)/total;
        else
        Gama(j,:,i) = 0.25*ones(1,4);    
        end
    end
end

for i = 1:2
    for j = 1:4
        total = sum(countQ(j,:,i));
        if(total)
        Q(j,:,i) = countQ(j,:,i)/total;
        else
        Q(j,:,i) = 0.2*ones(1,5);    
        end
    end
end


