%Lyle Olsen
%Assignment 1
%9/10/16

%Problem 1
A = imread('peppers.bmp');
figure;
imshow(A);
title('RGB Original Image');
%disp(A);

disp('-----------Finish solving Problem 1---------------')
pause

%Problem 2
B = rgb2gray(A);
TB = transpose(B);
FB = fliplr(B);

[row,col] = size(B);
halfSides = round([1,2] .* col/2);
left = A(:,1:halfSides(1),end);
right = A(:,halfSides(1)+1:halfSides(2),end);

VB = [right,left];

figure;
subplot(2,2,1);
imshow(B)
title('B');

subplot(2,2,2);
imshow(TB)
title('TB');

subplot(2,2,3);
imshow(VB)
title('VB');

subplot(2,2,4);
imshow(FB)
title('FB');

disp('-----------Finish solving Problem 2--------------')
pause

B_max = max(max(B));
B_min = min(min(B));
B_mean = mean(mean(B));
B_median = median(median(B));

[myMax,myMin,myMean,myMedian] = FindInfo(B);

if B_max == myMax
    disp('Max values match')
    disp(myMax)
else 
    disp('Max values do not match')
end
   
if B_min == myMin
    disp('Min values match')
    disp(myMin)
else 
    disp('Min values do not match')
end

if B_mean == myMean
    disp('Mean values match')
    disp(myMean)
else 
    disp('Mean values do not match')
    disp(myMean)
    disp(B_mean)
end

if B_median == myMedian
    disp('Median values match')
    disp(myMedian)
else 
    disp('Median values do not match')
    disp('Mine =')
    disp(myMedian)
    disp('Theirs =')
    disp(B_median)
end

disp('---------Finish solving Problem 3 ---------------')
pause


%Problem 4
%normalize B to C with range 0-1 as a double

doubleC = im2double(B);
C = imadjust(doubleC,[0,1]);
figure;
imshow(C);
title('Normalize Greyscale Image');

section = round([1,2,3] .* col/4);

Q{1} = C(:,1:section(1),end);
Q{1} = Q{1}.^.5;

Q{2} = C(:,section(1)+1:section(2),end);
Q{3} = C(:,section(2)+1:section(3),end);

Q{4} = C(:,section(3)+1:end,end);
Q{4} = Q{4}.^1.5;

D = [Q{1},Q{2},Q{3},Q{4}];
figure;
imshow(D)
title('Processed GrayScale Image')
imwrite(D,'Lyle_D.jpg')


disp('-----------Finish solving Problem 4 -----------------')
pause

%Problem 5


bw1 = im2double(C>mean(C(:)));
bw2 = C > mean([max(C),min(C)]);
bw3 = im2bw(C);

figure;
subplot(1,3,1);
imshow(bw1)
title('My First Method')

subplot(1,3,2);
imshow(bw2)
title('My Second Method')

subplot(1,3,3);
imshow(bw3)
title('Matlab Method')

if isequal(bw1,bw3),
    disp('My Method 1 worked')
end
if isequal(bw2,bw3),
    disp('My Method 2 worked')
end
if bw2 ~= bw3,
    disp('My Method 2 did not work')
end
if bw1 ~= bw3,
    disp('My Method 1 did not work')
end
    
disp('--------------- Finish sovling Problem 5 ---------------')
pause

%Problem 6
BA = BlurImage(A);
BB = BlurImage(B);

disp('Did not finish Problem 6')
pause

close all
clear;