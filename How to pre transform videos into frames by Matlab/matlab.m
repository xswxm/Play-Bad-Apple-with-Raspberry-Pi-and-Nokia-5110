clear;clc;
xyloObj = VideoReader('BadApple.mp4');
nFrames = xyloObj.NumberOfFrames;

% Read one frame at a time.
for k = 1 : nFrames
    frame = im2bw(imresize(read(xyloObj, k), [48,84]));
    imwrite(frame, strcat('BadApple/img', num2str(k), '.bmp'), 'bmp');
    disp(k);
end
