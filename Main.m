%read the images from the folder
path = 'Images/';
imName = '170057.jpg';
imHumanName = '170057_human.jpg';
imNumber = extractBefore(imName, 7);

Image=imread(fullfile (path,imName));
ImageHuman=imread(fullfile (path,imHumanName));
ImageGray=rgb2gray(Image);
%Imagegray=rgb2gray(ImageHuman);
Real=edge(ImageGray,'sobel', .04);

%Color Gradient
c1 = imadjust(Image, [0 0 0;0.2 1 1], [0 0 0;1 1 1],1);
c2 = imadjust(Image, [0 0 0;1 0.2 1], [0 0 0;1 1 1],1);
c3=rgb2gray(c2);
color=edge(c3,'sobel', .06);

%Brightness greadient
g1=imadjust(Image, [0 1], [0 1],2);
g3=rgb2gray (g1);
g2=imadjust(Image, [0 1], [0 1],0.6);
g4=rgb2gray(g2);
I5=edge(g3,'sobel', .06);
brightness=edge(g4,'sobel', .06);



%K-means
BW3=imsegkmeans(Image,2,'NumAttempts',10); 
kmeans=edge(BW3,'sobel') ;

%MeanShift
bw=0.06;                    % Mean Shift Bandwidth
[Ims, Nms]=Ms(Image,bw);    % Mean Shift (color)
Ims1=rgb2gray(Ims);
meanshift=edge(Ims1,'sobel') ;

%create 
str1=strcat(path,'Results/',imNumber,'_real','.jpg');
str2=strcat(path,'Results/',imNumber,'_color','.jpg');
str3=strcat(path,'Results/',imNumber,'_brightness','.jpg');
str4=strcat(path,'Results/',imNumber,'_kmeans','.jpg');
str5=strcat(path,'Results/',imNumber,'_meanshift','.jpg');

%Writing data in to 'Results' Folder
imwrite(Real,str1);
imwrite(color,str2);
imwrite(brightness,str3);
imwrite(kmeans,str4);
imwrite(meanshift,str5);



%Show the Image
subplot(151);imshow(Real);%  title('Original');
subplot(152);imshow(color); % title('Color');
subplot(153);imshow(brightness); % title('Brigthness');
subplot(154);imshow(kmeans); % title('K-Means');
subplot(155);imshow(meanshift); % title('Mean Shift');



