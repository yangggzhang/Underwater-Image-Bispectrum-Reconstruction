function [R_patch] = reconstruct_patch(mean_img,mean_bispectrum_phase)
%reconstruct each patch
[h,w] = size(mean_img);
R_patch = cell(h,w);

for ii = 1:w
    for jj = 1:h
        R_patch{jj,ii} = reconstruct_img(mean_img{jj,ii},mean_bispectrum_phase{jj,ii});
    end
end
end

