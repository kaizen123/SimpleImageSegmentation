close all;
clear all;
clc;
tp1 = 0;
fp1 = 0;
fn1 = 0;
tn1 = 0;

tp2 = 0;
fp2 = 0;
fn2 = 0;
tn2 = 0;

tp3 = 0;
fp3 = 0;
fn3 = 0;
tn3 = 0;

tp4 = 0;
fp4 = 0;
fn4 = 0;
tn4 = 0;
number = 0;

%read the processed images from the folder

path = 'Images/Results/';
imNumber = '170057';

str1=strcat(path,imNumber,'_real','.jpg');
str2=strcat(path,imNumber,'_color','.jpg');
str3=strcat(path,imNumber,'_brightness','.jpg');
str4=strcat(path,imNumber,'_kmeans','.jpg');
str5=strcat(path,imNumber,'_meanshift','.jpg');

I_prediction = imread(str1);
I_1 = imread(str2);
I_2 = imread(str3);
I_3 = imread(str4);
I_4 = imread(str5);



I_pre_post = imadjust(I_prediction,[0.17 0.170000000001],[0 1]);
[m,n,i] = size(I_pre_post);

I_1 = imresize(I_1,[m n]);
I_1_post = imadjust(I_1,[0.17 0.170000000001],[0 1]);

I_2 = imresize(I_2,[m n]);
I_2_post = imadjust(I_2,[0.17 0.170000000001],[0 1]);

I_3 = imresize(I_3,[m n]);
I_3_post = imadjust(I_3,[0.17 0.170000000001],[0 1]);

I_4 = imresize(I_4,[m n]);
I_4_post = imadjust(I_4,[0.17 0.170000000001],[0 1]);

[m1,n1,i1] = size(I_1_post);
[m2,n2,i2] = size(I_2_post);
[m3,n3,i3] = size(I_3_post);
[m4,n4,i4] = size(I_4_post);

fprintf('m,n ='), disp([m,n]);
fprintf('m1,n1 ='),disp([m1,n1]);
fprintf('m2,n2 ='),disp([m2,n2]);
fprintf('m3,n3 ='),disp([m3,n3]);
fprintf('m4,n4 ='),disp([m4,n4]);


figure;imshow(I_pre_post);
figure,imshow(I_1_post);
figure,imshow(I_2_post);
figure,imshow(I_3_post);
figure,imshow(I_4_post);

% Compare each image pixel by pixel

tic
for d = 1:m
    for r1 = 1:n
     P_post = impixel(I_pre_post,d,r1);
     P_1 = impixel(I_1_post,d,r1);
     P_2 = impixel(I_2_post,d,r1);
     P_3 = impixel(I_3_post,d,r1);
     P_4 = impixel(I_4_post,d,r1);
     if (P_post == 255) & (P_1 == 255), tp1 = tp1+1;
     elseif (P_post == 255) & (P_1 == 0), fp1 = fp1+1;
         elseif (P_post == 0) & (P_1 == 255), fn1 = fn1+1;
             else tn1 = tn1+1;
     end
     
     if (P_post == 255) & (P_2 == 255), tp2 = tp2+1;
     elseif (P_post == 255) & (P_2 == 0), fp2 = fp2+1;
         elseif (P_post == 0) & (P_2 == 255), fn2 = fn2+1;
             else tn2 = tn2+1;
     end
     
     if (P_post == 255) & (P_3 == 255), tp3 = tp3+1;
     elseif (P_post == 255) & (P_3 == 0), fp3 = fp3+1;
         elseif (P_post == 0) & (P_3 == 255), fn3 = fn3+1;
             else tn3 = tn3+1;
     end
     
     if (P_post == 255) & (P_4 == 255), tp4 = tp4+1;
     elseif (P_post == 255) & (P_4 == 0), fp4 = fp4+1;
         elseif (P_post == 0) & (P_4 == 255), fn4 = fn4+1;
             else tn4 = tn4+1;
     end
         number = number+1,fprintf('number='),disp(number);
      
     end
end
toc
% Calculate Recall, Precision and F Measure by usin tp,tn,fp,fn
Recall1 = tp1/(tp1+fn1);
Precision1 = tp1/(tp1+fp1);
F_measure1 = (2*Precision1*Recall1)/(Precision1+Recall1);
fprintf('tp1='),disp(tp1);
fprintf('fp1='),disp(fp1);
fprintf('fn1='),disp(fn1);
fprintf('tn1='),disp(tn1);
fprintf('Recall1='),disp(Recall1);
fprintf('Precision1='),disp(Precision1);
fprintf('F_measure1='),disp(F_measure1);

Recall2 = tp2/(tp2+fn2);
Precision2 = tp2/(tp2+fp2);
F_measure2 = (2*Precision2*Recall2)/(Precision2+Recall2);
fprintf('tp2='),disp(tp2);
fprintf('fp2='),disp(fp2);
fprintf('fn2='),disp(fn2);
fprintf('tn2='),disp(tn2);
fprintf('Recall2='),disp(Recall2);
fprintf('Precision2='),disp(Precision2);
fprintf('F_measure2='),disp(F_measure2);

Recall3 = tp3/(tp3+fn3);
Precision3 = tp3/(tp3+fp3);
F_measure3 = (2*Precision3*Recall3)/(Precision3+Recall3);
fprintf('tp3='),disp(tp3);
fprintf('fp3='),disp(fp3);
fprintf('fn3='),disp(fn3);
fprintf('tn3='),disp(tn3);
fprintf('Recall3='),disp(Recall3);
fprintf('Precision3='),disp(Precision3);
fprintf('F_measure3='),disp(F_measure3);

Recall4 = tp4/(tp4+fn4);
Precision4 = tp4/(tp4+fp4);
F_measure4 = (2*Precision4*Recall4)/(Precision4+Recall4);
fprintf('tp4='),disp(tp4);
fprintf('fp4='),disp(fp4);
fprintf('fn4='),disp(fn4);
fprintf('tn4='),disp(tn4);
fprintf('Recall4='),disp(Recall4);
fprintf('Precision4='),disp(Precision4);
fprintf('F_measure4='),disp(F_measure4);
