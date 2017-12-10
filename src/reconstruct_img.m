function [ img ] = reconstruct_img(mean_img,Bispecstrum_Phase)
%bispectrum reconstruct a single img

%phase diagram
[R,C]=size(mean_img);
phi_mat = zeros(R,C);
img = zeros(R,C);

fft_img = fft2(mean_img);
p1 = angle(fft_img);

phi_mat(0+1,0+1)=0; % 0,0
if (R>=2)
    phi_mat(1+1,0+1)=p1(1+1,0+1); % 1,0
end
if (C>=2)
    phi_mat(0+1,1+1)=p1(0+1,1+1); % 0,1
end

for col=3:C
    phi_mat(1,col)= minimizedAngle(phi_mat(0+1,1+1)+phi_mat(1,col-1)-Bispecstrum_Phase(1,2,1,col-1));
end
for row=3:R
    phi_mat(row,1)=minimizedAngle(phi_mat(1+1,0+1)+phi_mat(row-1,1)-Bispecstrum_Phase(2,1,row-1,1));
end
for row=2:R
    for col=2:C
        phi_mat(row,col)=minimizedAngle(phi_mat(row-1,col)+phi_mat(1+1,0+1)-Bispecstrum_Phase(row-1,col,2,1));
    end
end

img_mag = abs(fft_img);

for ii = 1:C
    for jj = 1:R
        img(jj,ii) = img_mag(jj,ii)*exp(j*phi_mat(jj,ii));
    end
end

img = real(ifft2(img));

end



