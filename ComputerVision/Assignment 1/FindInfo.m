%Lyle Olsen
%Assignment 1
%9/10/16

function[maxValue,minValue,meanValue,medianValue] = FindInfo(oriIm) %oriIm = original Grayscale image

gerth = size(oriIm);

maxPoint = oriIm(1);
minPoint = oriIm(1);

for i=1:gerth(1),
    for j=1:gerth(2),
        
       if maxPoint < oriIm(i,j)
           maxPoint = oriIm(i,j);
       end
       if minPoint > oriIm(i,j)
           minPoint = oriIm(i,j);
       end
    end
end

total = sum(oriIm(:));
meanPoint = total/(gerth(1)*gerth(2));

maxValue = maxPoint;
minValue = minPoint;
meanValue = meanPoint;

%Finding the median
s1 = sort(oriIm,2);
firstRow = s1(1:end);
len = numel(oriIm);
sortedArr = sort(firstRow);

medianPoint = sortedArr(len/2);
medianPoint2 = sortedArr(len/2+1);
medFinal = (medianPoint+medianPoint2)/2;


medianValue = medFinal;

end