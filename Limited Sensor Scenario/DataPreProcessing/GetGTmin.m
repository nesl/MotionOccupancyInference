function [ Truth1, Truth2, Truth3 ] = GetGTmin()
% This function can only be used in the 1-minute time slot

[Truth1(1,:), Truth2(1,:), Truth3(1,:)] = GTmin(importdata('Ground Truth/2013-7-23.csv'));
[Truth1(2,:), Truth2(2,:), Truth3(2,:)] = GTmin(importdata('Ground Truth/2013-7-24.csv'));
[Truth1(3,:), Truth2(3,:), Truth3(3,:)] = GTmin(importdata('Ground Truth/2013-7-25.csv'));
[Truth1(4,:), Truth2(4,:), Truth3(4,:)] = GTmin(importdata('Ground Truth/2013-7-26.csv'));
[Truth1(5,:), Truth2(5,:), Truth3(5,:)] = GTmin(importdata('Ground Truth/2013-7-29.csv'));
[Truth1(6,:), Truth2(6,:), Truth3(6,:)] = GTmin(importdata('Ground Truth/2013-7-31.csv'));
[Truth1(7,:), Truth2(7,:), Truth3(7,:)] = GTmin(importdata('Ground Truth/2013-8-1.csv'));
[Truth1(8,:), Truth2(8,:), Truth3(8,:)] = GTmin(importdata('Ground Truth/2013-8-2.csv'));
[Truth1(9,:), Truth2(9,:), Truth3(9,:)] = GTmin(importdata('Ground Truth/2013-8-9.csv'));


end

