% EECS 351 Project Underwater Image Reconstruction
% Team member: Chengjia Shao, Mingxiao Zhang, Tianjun Zhang, Yang Zhang 
% Underwater Image Simulator
clc;clear;close all;

addpath('src/');

% Directory to the original image
groundtruth_dir = 'Ground Truth Images/gt3.png';

% Folder saving simulation results
folder_dir = 'Test Image Cluster 3';

%Parameter for simution
% 1. Time inverval for simulation (s)
% 2. Simulation Time (s)

time_interval = 0.1;
simulation_time = 10;

%Simulation. You should be able to check the results in the corresponding
%folder
UnderWater_simulate(groundtruth_dir,folder_dir,time_interval,simulation_time);