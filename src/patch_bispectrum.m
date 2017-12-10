function [bispectrum_phase] = patch_bispectrum(patches)
%mean spectrum for each patch

bispectrum_phase = cell(size(patches));
[h,w] = size(patches);

%calculation mean bispectrum for each patch
for ii = 1:w
    for jj = 1:h
        [img_h,img_w] = size(patches{jj,ii}{1});
        ser_size = max(size(patches{jj,ii}));
        if ser_size < 1
            warning('Not enough images!');
            return
        else
            temp_B = zeros(img_h,img_w,img_h,img_w);
            for kk = 1:ser_size
                temp_B = temp_B + get_bispectrum(patches{jj,ii}{kk});
            end
            bispectrum_phase{jj,ii} = angle(temp_B/ser_size);
        end
    end
    
end



end

