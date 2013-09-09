function Data = GetData()
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
Data(3,:,1) = DataProcess(importdata('2013-7-23/living_room.csv'));
Data(4,:,1) = DataProcess(importdata('2013-7-23/kitchen.csv'));
Data(5,:,1) = DataProcess(importdata('2013-7-23/hallway_near_study.csv'));
Data(6,:,1) = DataProcess(importdata('2013-7-23/foyer.csv'));
Data(7,:,1) = DataProcess(importdata('2013-7-23/family_room.csv'));
Data(8,:,1) = DataProcess(importdata('2013-7-23/child_bedroom.csv'));
Data(9,:,1) = DataProcess(importdata('2013-7-23/recreation_room.csv'));
Data(10,:,1) = DataProcess(importdata('2013-7-23/utility_room.csv'));

Data(1,:,2) = DataProcess(importdata('2013-7-24/study.csv'));
Data(2,:,2) = DataProcess(importdata('2013-7-24/master_bedroom.csv'));
Data(3,:,2) = DataProcess(importdata('2013-7-24/living_room.csv'));
Data(4,:,2) = DataProcess(importdata('2013-7-24/kitchen.csv'));
Data(5,:,2) = DataProcess(importdata('2013-7-24/hallway_near_study.csv'));
Data(6,:,2) = DataProcess(importdata('2013-7-24/foyer.csv'));
Data(7,:,2) = DataProcess(importdata('2013-7-24/family_room.csv'));
Data(8,:,2) = DataProcess(importdata('2013-7-24/child_bedroom.csv'));
Data(9,:,2) = DataProcess(importdata('2013-7-24/recreation_room.csv'));
Data(10,:,2) = DataProcess(importdata('2013-7-24/utility_room.csv'));

Data(1,:,3) = DataProcess(importdata('2013-7-25/study.csv'));
Data(2,:,3) = DataProcess(importdata('2013-7-25/master_bedroom.csv'));
Data(3,:,3) = DataProcess(importdata('2013-7-25/living_room.csv'));
Data(4,:,3) = DataProcess(importdata('2013-7-25/kitchen.csv'));
Data(5,:,3) = DataProcess(importdata('2013-7-25/hallway_near_study.csv'));
Data(6,:,3) = DataProcess(importdata('2013-7-25/foyer.csv'));
Data(7,:,3) = DataProcess(importdata('2013-7-25/family_room.csv'));
Data(8,:,3) = DataProcess(importdata('2013-7-25/child_bedroom.csv'));
Data(9,:,3) = DataProcess(importdata('2013-7-25/recreation_room.csv'));
Data(10,:,3) = DataProcess(importdata('2013-7-25/utility_room.csv'));

Data(1,:,4) = DataProcess(importdata('2013-7-26/study.csv'));
Data(2,:,4) = DataProcess(importdata('2013-7-26/master_bedroom.csv'));
Data(3,:,4) = DataProcess(importdata('2013-7-26/living_room.csv'));
Data(4,:,4) = DataProcess(importdata('2013-7-26/kitchen.csv'));
Data(5,:,4) = DataProcess(importdata('2013-7-26/hallway_near_study.csv'));
Data(6,:,4) = DataProcess(importdata('2013-7-26/foyer.csv'));
Data(7,:,4) = DataProcess(importdata('2013-7-26/family_room.csv'));
Data(8,:,4) = DataProcess(importdata('2013-7-26/child_bedroom.csv'));
Data(9,:,4) = DataProcess(importdata('2013-7-26/recreation_room.csv'));
Data(10,:,4) = DataProcess(importdata('2013-7-26/utility_room.csv'));

Data(1,:,5) = DataProcess(importdata('2013-7-29/study.csv'));
Data(2,:,5) = DataProcess(importdata('2013-7-29/master_bedroom.csv'));
Data(3,:,5) = DataProcess(importdata('2013-7-29/living_room.csv'));
Data(4,:,5) = DataProcess(importdata('2013-7-29/kitchen.csv'));
Data(5,:,5) = DataProcess(importdata('2013-7-29/hallway_near_study.csv'));
Data(6,:,5) = DataProcess(importdata('2013-7-29/foyer.csv'));
Data(7,:,5) = DataProcess(importdata('2013-7-29/family_room.csv'));
Data(8,:,5) = DataProcess(importdata('2013-7-29/child_bedroom.csv'));
Data(9,:,5) = DataProcess(importdata('2013-7-29/recreation_room.csv'));
Data(10,:,5) = DataProcess(importdata('2013-7-29/utility_room.csv'));

Data(1,:,6) = DataProcess(importdata('2013-7-31/study.csv'));
Data(2,:,6) = DataProcess(importdata('2013-7-31/master_bedroom.csv'));
Data(3,:,6) = DataProcess(importdata('2013-7-31/living_room.csv'));
Data(4,:,6) = DataProcess(importdata('2013-7-31/kitchen.csv'));
Data(5,:,6) = DataProcess(importdata('2013-7-31/hallway_near_study.csv'));
Data(6,:,6) = DataProcess(importdata('2013-7-31/foyer.csv'));
Data(7,:,6) = DataProcess(importdata('2013-7-31/family_room.csv'));
Data(8,:,6) = DataProcess(importdata('2013-7-31/child_bedroom.csv'));
Data(9,:,6) = DataProcess(importdata('2013-7-31/recreation_room.csv'));
Data(10,:,6) = DataProcess(importdata('2013-7-31/utility_room.csv'));

Data(1,:,7) = DataProcess(importdata('2013-8-1/study.csv'));
Data(2,:,7) = DataProcess(importdata('2013-8-1/master_bedroom.csv'));
Data(3,:,7) = DataProcess(importdata('2013-8-1/living_room.csv'));
Data(4,:,7) = DataProcess(importdata('2013-8-1/kitchen.csv'));
Data(5,:,7) = DataProcess(importdata('2013-8-1/hallway_near_study.csv'));
Data(6,:,7) = DataProcess(importdata('2013-8-1/foyer.csv'));
Data(7,:,7) = DataProcess(importdata('2013-8-1/family_room.csv'));
Data(8,:,7) = DataProcess(importdata('2013-8-1/child_bedroom.csv'));
Data(9,:,7) = DataProcess(importdata('2013-8-1/recreation_room.csv'));
Data(10,:,7) = DataProcess(importdata('2013-8-1/utility_room.csv'));

Data(1,:,8) = DataProcess(importdata('2013-8-2/study.csv'));
Data(2,:,8) = DataProcess(importdata('2013-8-2/master_bedroom.csv'));
Data(3,:,8) = DataProcess(importdata('2013-8-2/living_room.csv'));
Data(4,:,8) = DataProcess(importdata('2013-8-2/kitchen.csv'));
Data(5,:,8) = DataProcess(importdata('2013-8-2/hallway_near_study.csv'));
Data(6,:,8) = DataProcess(importdata('2013-8-2/foyer.csv'));
Data(7,:,8) = DataProcess(importdata('2013-8-2/family_room.csv'));
Data(8,:,8) = DataProcess(importdata('2013-8-2/child_bedroom.csv'));
Data(9,:,8) = DataProcess(importdata('2013-8-2/recreation_room.csv'));
Data(10,:,8) = DataProcess(importdata('2013-8-2/utility_room.csv'));

Data(1,:,9) = DataProcess(importdata('2013-8-9/study.csv'));
Data(2,:,9) = DataProcess(importdata('2013-8-9/master_bedroom.csv'));
Data(3,:,9) = DataProcess(importdata('2013-8-9/living_room.csv'));
Data(4,:,9) = DataProcess(importdata('2013-8-9/kitchen.csv'));
Data(5,:,9) = DataProcess(importdata('2013-8-9/hallway_near_study.csv'));
Data(6,:,9) = DataProcess(importdata('2013-8-9/foyer.csv'));
Data(7,:,9) = DataProcess(importdata('2013-8-9/family_room.csv'));
Data(8,:,9) = DataProcess(importdata('2013-8-9/child_bedroom.csv'));
Data(9,:,9) = DataProcess(importdata('2013-8-9/recreation_room.csv'));
Data(10,:,9) = DataProcess(importdata('2013-8-9/utility_room.csv'));



end

