function [ samples ] = read_samples(folder_name)
%read test samples
files = dir([folder_name,'/*.png']);
num = size(files,1);
samples= cell(num,1);

for ii = 1:num
    samples_name = [files(ii).folder,'/',files(ii).name];
    img = imread(samples_name);
    if (size(img,3) == 3)
        img = rgb2gray(img);
    end
    img = im2double(img);
    samples{ii} = img;
end

end

