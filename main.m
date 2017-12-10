% EECS 351 Project Underwater Image Reconstruction
% Team member: Chengjia Shao, Mingxiao Zhang, Tianjun Zhang, Yang Zhang 
% Image Reconstruction Function
clc;clear;close all;

addpath('src/');

% hyperparamter user can change
% 1. patch size n (nxn image)
% 2. lucky image threshold (0,1)

patch_size =4;
threshold = 0.3;

%change your test images folder name here
%images must be png files
folder_name = 'Test Image Cluster 3';


samples = read_samples(folder_name);
img = reconstruct_UnderwaterImage(samples, patch_size, threshold);


% Enhance constract
img = imadjust(img);
figure();
imshow(img);