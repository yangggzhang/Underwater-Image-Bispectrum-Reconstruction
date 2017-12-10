function [img] = reconstruct_UnderwaterImage( img_ser,patch_size,lucky_threshold )

if ~exist('patch_size')
    patch_size = 10;
end

if ~exist('lucky_threshold')
    lucky_threshold = 0.3;
end
% patch
ori_patches = patch_ser(patch_size,img_ser);

%mean img before select
ori_mean_img = mean_patch(ori_patches);

%lucky image tech
patches = luckypick(ori_patches,ori_mean_img,lucky_threshold);

%mean img
mean_img = mean_patch(patches);

% mean bispectrum phase for each patch
[mean_bispectrum_phase] = patch_bispectrum(patches);

% reconstruct each patch
reconstructed_patches = reconstruct_patch(mean_img,mean_bispectrum_phase);

% combine patch into an entire image
img = combine_patch(reconstructed_patches);



end