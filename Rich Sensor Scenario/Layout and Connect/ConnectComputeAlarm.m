function finalmax = ConnectComputeAlarm( Datain,timeinteval )
%
% Datain: The data that need to be processed.

% This function returns the Max Co-occurence in the specific time inteval.
%

load('CONNECT.mat');
[Sensornum, Maxnum] = size(Datain);
Connectout = zeros(Sensornum,Sensornum);

    for i = 1:Sensornum 
        pre = 0;
        for j = 1:Maxnum
            
            if(Datain(i,j))
                pre = 1;
            else if(~Datain(i,j) && pre)
                    for k = 1:Sensornum
                        for m = j:min(j+timeinteval,Maxnum)
                            if(Datain(k,m) && ~Datain(k,m-1))
                               Connectout(i,k) = Connectout(i,k) + 1;
                               %Show_Line(i,k);
                               break;
                            end
                        end
                    end
                    pre = 0;
                end
            end
        end
        %hold off;
        %figure;
        %imshow('layout.jpg');
    end
    
    
    maxvector1 = [];            %store the max value for each row
    for i = 1:Sensornum
        maxtimes = 0;
        for j = 1:Sensornum
        if(Connectout(i,j) && ~CONNECT(i,j))
            maxtimes = maxtimes + 1;
        end
        end
        maxvector1 = [maxvector1 maxtimes];
    end
    
    
    maxvector2 = [];
    for i = 1:Maxnum
        timesum = 0;
        for j = 1:3
            if(Datain(j,i) == 1)
            timesum = timesum + 1;
            end
        end
        maxvector2 = [maxvector2 timesum];
    end
    
    finalmax = max([maxvector1 maxvector2]);


end

