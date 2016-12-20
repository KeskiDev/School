%Lyle Olsen
%Assignment 3

originalIm = imread('Circuit.jpg');

%Part 1 %**************************************************************************************
%Problem 1
weightedMask = [1,2,1;2,4,2;1,2,1]; % 3x3
standardMask = [1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;1,1,1,1,1]; %5x5

FilteredWeighted = AverageFilter(originalIm,weightedMask);
FilteredStandard = AverageFilter(originalIm,standardMask);

figure
subplot(1,3,1)
imshow(originalIm)
title('Original Image')

subplot(1,3,2)
imshow(FilteredWeighted)
title('Weighted Mask')

subplot(1,3,3)
imshow(FilteredStandard)
title('Standard Mask')
disp('Finished Sovling Part 1 Problem 1')
pause

%**************************************************************************

%Problem 2 ****************************************************************
weightedMedMask = [1,2,1;2,4,2;1,2,1]; % 3x3
standardMedMask = [1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;1,1,1,1,1]; %5x5

weightedFilteredIm = MedianFiltering(originalIm,weightedMedMask) ;
standardFilteredIm = MedianFiltering(originalIm,standardMedMask) ;

figure
subplot(1,3,1)
imshow(originalIm)
title('Original')
subplot(1,3,2)
imshow(weightedFilteredIm)
title('Weighted Filtered')
subplot(1,3,3)
imshow(standardFilteredIm)
title('Standard Filtered')

disp('Finished with part 1 problem 2')
pause

%Problem 3 %***************************************************************
moon = imread('Moon.jpg');
plusLapFilter = [1,1,1;
                 1,-8,1;
                 1,1,1;];
negLapFilter = [-1,-1,-1;
                 -1,8,-1;
                 -1,-1,-1;];
g=0;       
filterMoon = imfilter(moon,plusLapFilter);
[row,col] = size(filterMoon);
for i=2:row-1
    for j=2:col-1
        g(i,j)= moon(i-1,j)+moon(i,j-1)+moon(i,j+1)+moon(i+1,j)-4*moon(i,j);
        if g(i,j)>255
            g(i,j) = 255;
        elseif g(i,j)<0
            g(i,j) = 0;
        end
    end
end
scaledMoon = g;
enhnacedIm = zeros(row,col);
for i=1:row-1
    for j=1:col-1
        enhancedIm(i,j) = moon(i,j)-filterMoon(i,j)-scaledMoon(i,j);
    end
end

figure
subplot(2,2,1)
imshow(moon)
title('Original')
subplot(2,2,2)
imshow(filterMoon)
title('Filtered Image')
subplot(2,2,3)
imshow(scaledMoon)
title('Scaled Image')
subplot(2,2,4)
imshow(enhancedIm)
title('Enhanced Image')

disp('Finished with part 1 problem 3')
pause

%Part 2 %*****************************************************************************************
%problem 1 ****************************************************************
rice = imread('Rice.jpg');
[riceRow,riceCol] = size(rice);
edgeRice = zeros(riceRow,riceCol);
edge2Rice = zeros(riceRow,riceCol);
FIm = zeros(riceRow,riceCol);
FImx = zeros(riceRow,riceCol);
FImy = zeros(riceRow,riceCol);


gX = [-1,-2,-1;
       0,0,0;
       1,2,1];
gY = [-1,0,1;
       -2,0,2;
       -1,0,1];
   
FImx = imfilter(im2double(rice),gX);
FImy = imfilter(im2double(rice),gY);

for i=1:riceRow
    for j=1:riceCol
        edge2Rice(i,j) = sqrt(abs(FImx(i,j))+abs(FImy(i,j)));
        
        if edge2Rice(i,j) > 1.00
            edge2Rice(i,j) = edge2Rice(i,j);
        else
            edge2Rice(i,j) = 0;
        end
    end
end
disp('I think the best way to find the threshold would be to find the lowest count of high values and make that the threshold to use.')

disp('Finished with part 2 problem 1')
pause
%problem 2 ****************************************************************
edgeHist = CalEdgeHist(rice,20);

figure
subplot(1,3,1)
imshow(rice)
title('Original')
subplot(1,3,2)
imshow(edge2Rice)
title('Edge detect')
subplot(1,3,3)
xAxis = linspace(0,360,length(edgeHist));
plot(xAxis,edgeHist)
title('Histogram')


disp('Finished with part 2 problem 2')
pause
%Part 3 %********************************************************************

img = imread('Text1.gif');

edgeIm = edge(img);

figure
subplot(1,2,1)
imshow(img)
title('Original')
subplot(1,2,2)
imshow(edgeIm)

[newRow,newCol] = size(edgeIm);
newIm = zeros(newRow,newCol);

for i=1:newRow
    for j=1:newCol
        if edgeIm(i,j) == 1
            newIm(i,j)=0;
        else
            newIm(i,j)=1;
        end
    end
end

figure
imshow(newIm)
title('Enhanced Image')

disp('Finsihed with Part 3')
pause