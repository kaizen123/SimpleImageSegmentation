%read the images from the folder
Image=imread('Images/170057.jpg');
ImageHuman=imread('Images/170057_human.jpg');
ImageGray=rgb2gray(Image);
%Imagegray=rgb2gray(ImageHuman);
Real=edge(ImageGray,'sobel', .04);

%Color Gradient
c1 = imadjust(Image, [0 0 0;0.2 1 1], [0 0 0;1 1 1],1);
c2 = imadjust(Image, [0 0 0;1 0.2 1], [0 0 0;1 1 1],1);
c3=rgb2gray(c2);
c11=edge(c3,'sobel', .06);

%Brightness greadient
g1=imadjust(Image, [0 1], [0 1],2);
g3=rgb2gray (g1);
g2=imadjust(Image, [0 1], [0 1],0.6);
g4=rgb2gray(g2);
I5=edge(g3,'sobel', .06);
I6=edge(g4,'sobel', .06);

%K-means
BW3=imsegkmeans(Image,2,'NumAttempts',10); 
BW7=edge(BW3,'sobel') ;

%MeanShift
bw=0.02;                    % Mean Shift Bandwidth
[Ims, Nms]=Ms(Image,bw);    % Mean Shift (color)
Ims1=rgb2gray(Ims);
Ims2=edge(Ims1,'sobel') ;

% imshow(BW7);title('K-Means');

%Show the Image
subplot(151);imshow(Real);%  title('Original');
subplot(152);imshow(c11); % title('Color');
subplot(153);imshow(I6); % title('Brigthness');
subplot(154);imshow(BW7); % title('K-Means');
subplot(155);imshow(Ims2); % title('Mean Shift');



