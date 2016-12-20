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
%scaledMoon = zeros(row,col);
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
title('Origianl')
subplot(2,2,2)
imshow(filterMoon)
title('filtered')
subplot(2,2,3)
imshow(scaledMoon)
subplot(2,2,4)
imshow(enhancedIm)