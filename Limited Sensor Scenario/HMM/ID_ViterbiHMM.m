function result = ID_ViterbiHMM( Gama, Q, y )

sizeofy = size(y);
totalnum = sizeofy(1,1);
daynum = totalnum/144;

result = zeros(1,totalnum);
T1 = zeros(8,totalnum);
T2 = zeros(8,totalnum);

currentobservation = bin2dec(num2str(y(1,:) - 1)) + 1;
T1(8,1) = Q(8,currentobservation,2);

for day = 1:daynum
    for slot = 1:144
        if(~(day == 1 && slot == 1))
            currentindex = (day - 1)*144 + slot;
            previoushour = fix((slot - 2)/6) + 1; %Slot - 2 is due to the trasition from the previous state to the current state
            %currenthour = fix((slot - 1)/6) + 1;
            observation = bin2dec(num2str(y(currentindex,:) - 1)) + 1;
            if(slot >= 7 && slot <= 42)     
                currentmode = 1;
            else
                currentmode = 2;
            end
            
            for state = 1:8
                ma = 0; maxk = 0;
                for k = 1:8
                    present = T1(k,currentindex - 1)*Gama(k,state,previoushour)...
                        *Q(state,observation,currentmode);
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


end

