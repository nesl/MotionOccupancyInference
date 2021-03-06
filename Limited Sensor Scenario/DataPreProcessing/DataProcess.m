function Dataout = DataProcess(Datain)
% Preprocess the data from the .csv file

Datainsize = size(Datain);
if(Datainsize(1,1) > 1)

    k = 2;

    presentstr = cell2mat(Datain(k,1));
    presentmode = str2double(presentstr(31));
    while(presentmode == 0)
        k = k + 1;
        presentstr = cell2mat(Datain(k,1));
        presentmode = str2double(presentstr(31));
    end

    presenthour = str2double(presentstr(12:13));
    presentminute = str2double(presentstr(15:16));
    presentsecond = str2double(presentstr(18:19));
    presenttime = 3600*presenthour + 60*presentminute + presentsecond;


    Dataout = zeros(1,86400);
    Datasize = size(Datain);

    for j = 1:86400
           if(presenttime == j)
               Dataout(1,j) = 1;
               if( k < Datasize(1,1))
                   k = k + 1;
                   presentstr = cell2mat(Datain(k,1));
                   presentmode = str2double(presentstr(31));
                   while(presentmode == 0 && k < Datasize(1,1))
                     k = k + 1;
                     presentstr = cell2mat(Datain(k,1));
                     presentmode = str2double(presentstr(31));
                   end
                   presenthour = str2double(presentstr(12:13));
                   presentminute = str2double(presentstr(15:16));
                   presentsecond = str2double(presentstr(18:19));
                   presenttime = 3600*presenthour + 60*presentminute + presentsecond;
               end
           end
    end
else
    Dataout = zeros(1,86400);
end

