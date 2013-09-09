function Dataout = Datablock( Datain )
%This function do the preprocessing of the raw data from the motion
%sensors.
%The specific operation is the following: when the motion is detected in 30
%seconds, then we conclude it in a block.
%
%Last update: 08/06/2013

insize = size(Datain);
totalsensor = insize(1,1);
Dataout = zeros(totalsensor,86400);

%{    
for i = 1:totalsensor
        startpoint = 1;
        endpoint = 1;
        mode = 0;
        for j = 1:86400
            if(mode && Datain(i,j) == 1 && j - endpoint <= 30)
                endpoint = j;
            else if(mode && j - endpoint > 30)
                Dataout(i,startpoint:endpoint) = ones(1,endpoint - startpoint + 1);
                startpoint = j;
                endpoint = j;
                mode = 0;
                else if(~mode && Datain(i,j) == 0 )
                startpoint = j;
                endpoint = j;
                    else if(~mode && Datain(i,j) == 1 )
                startpoint = j;
                endpoint = j;
                mode = 1;
                        end
                    end
                end
            end
        end
    end
%}
    
    
    % Pre-process the raw data from various motion sensors in the house 


    starttime = 30;
    endtime = 30;
for i = 1:totalsensor
    if(i ~= totalsensor - 1)
    startpoint = 1;
    endpoint = 1;
    mode = 0;
    for j = 1:86400
        if(mode == 2 && Datain(i,j) == 1 && j - endpoint <= endtime)
            endpoint = j;
        else if(mode == 2 && j - endpoint > endtime)
                Dataout(i,startpoint:endpoint) = ones(1,endpoint - startpoint + 1);
                startpoint = j;
            	endpoint = j;
                mode = 0;
            else if(~mode && Datain(i,j) == 0 )
                      startpoint = j;
                      endpoint = j;
                else if(~mode && Datain(i,j) == 1 )
                       startpoint = j;
                       endpoint = j;
                       mode = 1;
                    else if(mode == 1 && Datain(i,j) == 1 && j - endpoint <= starttime)
                            endpoint = j;
                            mode = 2;
                        else if(mode == 1 && j - endpoint > starttime)
                            Dataout(i,startpoint) = 0;
                            startpoint = j;
                            endpoint = j;
                            mode = 0;
                            end
                        end
                    end
                end
            end
        end    
    end
    end
end





end

