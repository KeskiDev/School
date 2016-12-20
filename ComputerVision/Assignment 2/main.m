%Lyle Olsen
%Assignment 2

food = imread('Food.jpg');

%---------------------problem 1----------------------------
[scaledFood, transform] = Scaling(double(food), [0,255]);
low = min(min(food));
high = max(max(food));
xAxis = linspace(0,255,length(transform));
figure;
subplot(1,1,1)
plot(xAxis,transform)
%axis([0,255,low,high])
xlabel('New Intensity')
ylabel('Old Intensity')

disp('Finish solving question 1')
pause

%---------------------problem 2 ---------------------------
%needs work
matScaledFood = imadjust(food);
figure;
subplot(1,2,1)
imshow(matScaledFood)
title('Matlab scaled food')
subplot(1,2,2)
imshow(scaledFood)
title('My Scaled food')

disp('Finish solving question 2')
pause

%---------------------problem 3 ---------------------------
disp('Working on problem 3')
[myHist,myNormalized] = CalHist(scaledFood);
[matHist,matNormalized] = CalHist(matScaledFood);

xAxis = linspace(0,length(myHist),length(myHist));
figure
subplot(1,2,1)
bar(myNormalized);
title('My Normalized Histogram')
xlabel('intensity')
ylabel('count')

subplot(1,2,2)
bar(matNormalized);
title('Matlab Normalized Historgram')
xlabel('intensity')
ylabel('count')

disp('Finish solving question 3')
pause

%---------------------problem 4 ---------------------------
disp('working on problem 4')
tic;
[enhancedFood, transHistogram] = HistEqualization(food);
time = toc;
fprintf('Time Elapsed: %d\n',time)
disp('Finish solving question 4')
pause

%---------------------problem 5 ---------------------------
tic
matlabEnhanced = histeq(food);
matlabTime = toc;
fprintf('matlab time elapsed: %d\n',matlabTime)
fprintf('My time compared to the matlab time is quite slower. My time problem comes from the multiple for loops \n I needed to get the values in the image. Given more time it could have been refactored to be faster.\n')
fprintf('While looking at the implementation of histeq it was interesting to see the use of finding an error value \n to find a number that is within the acutal and desired cumulative histogram.\n')

figure
subplot(1,2,1)
imshow(matlabEnhanced)
title('Matlab Enhanced')
subplot(1,2,2)
imshow(enhancedFood)
title('My Enhanced image')


figure
subplot(1,2,1)
imhist(matlabEnhanced)
title('theirs')
subplot(1,2,2)
bar(transHistogram)
title('mine')


disp('Finish solving question 5')
pause