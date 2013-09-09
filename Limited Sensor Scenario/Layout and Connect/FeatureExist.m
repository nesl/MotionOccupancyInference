function Existout = FeatureExist( Datain )
%FEATUREEXIST
%   This function is used to detect the existence of motion in each room

Existout = zeros(1,3);
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
end

end

