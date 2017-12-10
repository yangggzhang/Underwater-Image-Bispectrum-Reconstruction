function [ img ] = mean_patch(patches)
%average for each patch

[h,w] = size(patches);
img = cell(h,w);

for ii = 1:w
    for jj = 1:h
        temp_img = zeros(size(patches{jj,ii}{1}));
        ser_size = max(size(patches{jj,ii}));
        if ser_size < 1
            warning('Not enough images');
        end
        for kk = 1:ser_size
            temp_img = temp_img + patches{jj,ii}{kk};
        end
        img{jj,ii} = temp_img/ser_size;
        
    end
end


end

