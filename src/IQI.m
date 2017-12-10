function [score] = IQI( img1,img2 )
%Image quality index

[h,w] = size(img1);

x = zeros(h*w,1);
y = zeros(h*w,1);

for i = 1:h
    x((i-1)*w+1:w*i) = img1(i,:);
    y((i-1)*w+1:w*i) = img2(i,:);
end

mean_x = mean(x);
mean_y = mean(y);

var_x = var(x);
var_y = var(y);

cov_xy = cov(x,y);
cov_xy = cov_xy(1,2);

score = (4*cov_xy*mean_x*mean_y)/((var_x+var_y)*(mean_x^2+mean_y^2));

end

