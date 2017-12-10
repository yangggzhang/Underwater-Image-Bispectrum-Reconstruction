function [img] = combine_patch(reconstructed_patches)
%combine patches into an entire image
img = [];

[h,w] = size(reconstructed_patches);
for jj = 1:h
    temp_img = [];
    for ii = 1:w
        temp_img = [temp_img,reconstructed_patches{jj,ii}];
    end
    img = [img;temp_img];
end


end

