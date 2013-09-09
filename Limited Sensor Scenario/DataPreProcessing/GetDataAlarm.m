function Data = GetDataAlarm()
%
%Calling this function can load the raw data from the sensors.
%Data(:,:,1) is from 2013-7-23
%Data(:,:,2) is from 2013-7-24
%Data(:,:,3) is from 2013-7-25
%Data(:,:,4) is from 2013-7-26
%Data(:,:,5) is from 2013-7-29
%Data(:,:,6) is from 2013-7-31
%Data(:,:,7) is from 2013-8-1
%Data(:,:,8) is from 2013-8-2
%Data(:,:,9) is from 2013-8-9
%
Data(1,:,1) = DataProcess(importdata('2013-7-23/study.csv'));
Data(2,:,1) = DataProcess(importdata('2013-7-23/master_bedroom.csv'));
Data(3,:,1) = DataProcess(importdata('2013-7-23/foyer.csv'));

Data(1,:,2) = DataProcess(importdata('2013-7-24/study.csv'));
Data(2,:,2) = DataProcess(importdata('2013-7-24/master_bedroom.csv'));
Data(3,:,2) = DataProcess(importdata('2013-7-24/foyer.csv'));

Data(1,:,3) = DataProcess(importdata('2013-7-25/study.csv'));
Data(2,:,3) = DataProcess(importdata('2013-7-25/master_bedroom.csv'));
Data(3,:,3) = DataProcess(importdata('2013-7-25/foyer.csv'));

Data(1,:,4) = DataProcess(importdata('2013-7-26/study.csv'));
Data(2,:,4) = DataProcess(importdata('2013-7-26/master_bedroom.csv'));
Data(3,:,4) = DataProcess(importdata('2013-7-26/foyer.csv'));

Data(1,:,5) = DataProcess(importdata('2013-7-29/study.csv'));
Data(2,:,5) = DataProcess(importdata('2013-7-29/master_bedroom.csv'));
Data(3,:,5) = DataProcess(importdata('2013-7-29/foyer.csv'));

Data(1,:,6) = DataProcess(importdata('2013-7-31/study.csv'));
Data(2,:,6) = DataProcess(importdata('2013-7-31/master_bedroom.csv'));
Data(3,:,6) = DataProcess(importdata('2013-7-31/foyer.csv'));

Data(1,:,7) = DataProcess(importdata('2013-8-1/study.csv'));
Data(2,:,7) = DataProcess(importdata('2013-8-1/master_bedroom.csv'));
Data(3,:,7) = DataProcess(importdata('2013-8-1/foyer.csv'));

Data(1,:,8) = DataProcess(importdata('2013-8-2/study.csv'));
Data(2,:,8) = DataProcess(importdata('2013-8-2/master_bedroom.csv'));
Data(3,:,8) = DataProcess(importdata('2013-8-2/foyer.csv'));

Data(1,:,9) = DataProcess(importdata('2013-8-9/study.csv'));
Data(2,:,9) = DataProcess(importdata('2013-8-9/master_bedroom.csv'));
Data(3,:,9) = DataProcess(importdata('2013-8-9/foyer.csv'));

end

