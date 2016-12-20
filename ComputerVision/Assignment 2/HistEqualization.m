%Lyle Olsen
%Assignment 2

function [enhancedIm, transFunc] = HistEqualization(inputIm) 

[row,col] = size(inputIm);
%inputIm = im2double(inputIm);

sumArray = containers.Map('KeyType','double','ValueType','double');

%getting the counts for each pixel
for i = 1:row
    for j=1:col
        sumArray(inputIm(i,j)) = sum(inputIm(:)== inputIm(i,j));
    end
end

y = zeros(1,max(max(inputIm)));

for i=1:length(y)
    if ~isKey(sumArray,i)
        y(i) = 0;
    else
        y(i) = sumArray(i);
    end
end
transImage = y;
%summ of previous array element
for i=2:length(y)
    transImage(i) = transImage(i-1) + y(i);
end

for i=1:length(transImage)
    newTransform(i)=(transImage(i)/(row*col))*255;
    sumArray(i) = newTransform(i);
end

transFunc = newTransform;
enhancedIm = inputIm;

for i=1:row
    for j=1:col
        if isKey(sumArray,enhancedIm(i,j))
            enhancedIm(i,j) = sumArray(enhancedIm(i,j));
        end
    end
end

enhancedIm = im2uint8(enhancedIm);

end