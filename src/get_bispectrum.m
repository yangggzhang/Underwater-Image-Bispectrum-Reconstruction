function [Bspec] = get_bispectrum(img)
% bispectrum for a single image
[h,w] = size(img);
Bspec = zeros(h,w,h,w);



img_fft = fft2(img);

for ii_u = 1:w
    for jj_u = 1:h
        for ii_v = 1:w
            for jj_v = 1:h
                ii = ii_u + ii_v - 2;
                jj = jj_u + jj_v - 2;
                ii = mod(ii,w);
                jj = mod(jj,h);
                ii = ii + 1;
                jj = jj + 1;
                Bspec(jj_u,ii_u,jj_v,ii_v) = img_fft(jj_u,ii_u) * img_fft(jj_v,ii_v) * conj(img_fft(jj,ii));
            end
        end
    end
end



end

