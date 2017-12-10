function [ p ] = patch_ser( patch_size,img_ser )
% divide image into nxn smaller size

ser_size = max(size(img_ser));
if ser_size <= 1
    warning('Not enough images!');
    return
else
    [h,w] = size(img_ser{1});
    i_count = 1;
    j_count = 1;
    p = cell(ceil(h/patch_size),ceil(w/patch_size));
    for i = 1:patch_size:h
        for j = 1:patch_size:w
            for kk = 1:ser_size
                p{i_count,j_count}{kk} = img_ser{kk}(i:min(i+patch_size-1,h),j:min(j+patch_size-1,w));
            end
            j_count = j_count+1;
        end
        j_count = 1;
        i_count = i_count + 1;
    end
end
end