function UnderWater_simulate(groundtruth_dir,folder_dir,time_interval,simulation_time)


gt=imread(groundtruth_dir);

[height,width,dim]=size(gt);
if dim == 3
    gt=rgb2gray(gt);
end

gt(gt==255)=250;
gt(gt==0)=10;

a=[10        , 9         , 10];
u=[2*pi/-200 , 2*pi/80   , 2*pi/-80];
v=[2*pi/200  , 2*pi/50   , 2*pi/1000];
w=[2*pi/2   , 2*pi/2    , 2*pi/5]; % omega=2pi/T=2pif

count = 1;
for t = 0:time_interval:simulation_time
    
    p=zeros(height,width);
    q=zeros(height,width);
    
    x=repmat([1:width],height,1);
    y=repmat([1:height].',1,width);
    
    for i=1:length(a)
        p=p-a(i)*u(i)*cos(u(i)*x+v(i)*y-w(i)*t);
        q=q-a(i)*v(i)*cos(u(i)*x+v(i)*y-w(i)*t);
    end
    
    n=1.333; % refractive index of water
    N=wgn(height,width,0)*0.2; % height*width WGN matrix with power=0
    h=10;
    dx=h*p*(1-1/n)+N;
    dy=h*q*(1-1/n)+N;
    
    new_x=x+dx;
    new_y=y+dy;
    
    new_gt=uint8(ones(height,width)*1);
    for i=1:height
        for j=1:width
            xaxis=round(new_x(i,j));
            yaxis=round(new_y(i,j));
            if xaxis>0 & xaxis<=width & yaxis>0 & yaxis<=height
                if(new_gt(i,j)==1)
                    new_gt(i,j)=gt(yaxis,xaxis);
                else
                    new_gt(i,j)=(new_gt(i,j)+gt(yaxis,xaxis))/2;
                end
            end
        end
    end
    
    new_gt(new_gt==1)=255;
    
    img_name = [folder_dir,'/Sample',num2str(count),'.png'];
    imwrite(new_gt,img_name);
    count = count + 1;
end


end

