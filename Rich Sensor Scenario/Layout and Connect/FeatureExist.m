function Existout = FeatureExist( Datain )
%FEATUREEXIST
%   This function is used to detect the existence of motion in each room

Existout = zeros(1,10);
Datainsize = size(Datain);

for i = 1:Datainsize(1,2)
    if(Datain(1,i) == 1)
        Existout(1,1) = 1;
    end
    if(Datain(2,i) == 1)
        Existout(1,2) = 1;
    end
    if(Datain(3,i) == 1)
        Existout(1,3) = 1;
    end
    if(Datain(4,i) == 1)
        Existout(1,4) = 1;
    end
    if(Datain(5,i) == 1)
        Existout(1,5) = 1;
    end
    if(Datain(6,i) == 1)
        Existout(1,6) = 1;
    end
    if(Datain(7,i) == 1)
        Existout(1,7) = 1;
    end
    if(Datain(8,i) == 1)
        Existout(1,8) = 1;
    end
    if(Datain(9,i) == 1)
        Existout(1,9) = 1;
    end
    if(Datain(10,i) == 1)
        Existout(1,10) = 1;
    end
end

end

