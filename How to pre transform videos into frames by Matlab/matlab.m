clear;clc;
xyloObj = VideoReader('input.mp4');
nFrames = xyloObj.NumberOfFrames;
vidHeight = xyloObj.Height;
vidWidth = xyloObj.Width;
 
% Preallocate movie structure.
mov(1:nFrames) = ...
    struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'),...
           'colormap', []);
 
% Read one frame at a time.
for k = 1 : nFrames
    mov(k).cdata = read(xyloObj, k);
    disp(k);
end
 
% Size a figure based on the video's width and height.
hf = figure;
set(hf, 'position', [150 150 vidWidth vidHeight])
 
% Play back the movie once at the video's frame rate.
% movie(hf, mov, 1, xyloObj.FrameRate);
for I = 1 : nFrames
	% Use imresize to resize the formal matrix into your desired resolution, then transform it into a grey picture
    ls = im2bw(imresize(mov(i).cdata, [48,84]));
    % Save ls as a bmp image
    imwrite(ls, strcat([BMP\output', num2str(i), '.bmp]), bmp);
    % Disply the number of the frame
    disp(i);
end