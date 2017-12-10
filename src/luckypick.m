function [ patches ] = luckypick(ori_patches,ori_mean_img,lucky_threshold)
%luck image tech

[h,w] = size(ori_patches);
patches = cell(h,w);

for ii = 1:w
    for jj = 1:h
        ser_num = max(size(ori_patches{jj,ii}));
        quality_index = ones(ser_num,1);
        for kk = 1:ser_num
            quality_index(kk) = IQI(ori_patches{jj,ii}{kk},ori_mean_img{jj,ii});
        end
        [ind] = find(quality_index > lucky_threshold);
        
        if isempty(ind)
            [~,ind] = sort(quality_index,'descend');
            ind = ind(1:3);
        end
        len = max(size(ind));
        for kk = 1:len
            patches{jj,ii}{kk} = ori_patches{jj,ii}{ind(kk)};
        end
    end
end


end

