function result = ViterbiHMM(Gama, Q, y)
%
%This function use the Viterbi Algorithm to compute the most likely
%transmission of the states based on the observation y
%
%Author: Yang Longqi Last Update: 2013-8-7
%

sizeofy = size(y);
totalnum = sizeofy(1,2);
daynum = totalnum/144;

result = zeros(1,totalnum);
T1 = zeros(4,totalnum);
T2 = zeros(4,totalnum);

T1(4,1) = Q(4,y(1,1),2);

for day = 1:daynum
    for slot = 1:144
        if(~(day == 1 && slot == 1))
            currentindex = (day - 1)*144 + slot;
            previoushour = fix((slot - 2)/6) + 1; %Slot - 2 is due to the trasition from the previous state to the current state
            %currenthour = fix((slot - 1)/6) + 1;
            
            if(slot >= 7 && slot <= 42)     
                currentmode = 1;
            else
                currentmode = 2;
            end
            
            for state = 1:4
                ma = 0; maxk = 0;
                for k = 1:4
                    present = T1(k,currentindex - 1)*Gama(k,state,previoushour)...
                        *Q(state,y(1,currentindex),currentmode);
                    if(present >= ma)
                    ma = present;
                    maxk = k;
                    end
                end
                T1(state,currentindex) = ma;
                T2(state,currentindex) = maxk;
            end  
        end
    end
end

[maxnum result(1,totalnum)] = max(T1(:,totalnum));
i = totalnum;
while(i >= 2)
    result(1,i - 1) = T2(result(1,i),i);
    i = i - 1;
end

%{
for i = 2:T
    for j = 1:2^Pnum
        %Comupute the Maximum
        ma = 0; maxk = 0;
        for k = 1:2^Pnum
            if(~sennum(1,i))
                present = T1(k, i-1)*Gama(k,j,1)*Qprob(Q,y,j,i); 
            else if(sennum(1,i) == 1)
                present = T1(k, i-1)*Gama(k,j,2)*Qprob(Q,y,j,i);
                else if(sennum(1,i) == 2)
                   present = T1(k, i-1)*Gama(k,j,3)*Qprob(Q,y,j,i);
                   else if(sennum(1,i) == 3)
                   present = T1(k, i-1)*Gama(k,j,4)*Qprob(Q,y,j,i);
                   else if(sennum(1,i) == 4)
                   present = T1(k, i-1)*Gama(k,j,5)*Qprob(Q,y,j,i);
                       end
                       end
                    end
                end
            end
            if(present >= ma)
                ma = present;
                maxk = k;
            end
        end
        T1(j,i) = ma;
        T2(j,i) = maxk;
    end
    i
end

[maxnum result(1,T)] = max(T1(:,T));
i = T;
while(i >= 2)
    result(1,i - 1) = T2(result(1,i),i);
    i = i - 1;
end
%}

