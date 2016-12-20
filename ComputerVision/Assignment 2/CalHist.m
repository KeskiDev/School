%Lyle Olsen
%Assignment 2

function [histogram,normalizedHist] = CalHist(inputIm) 
%Normalized histogram is just the sums of the values of pixels divided by
%the number of pixels

%histogram is just the sums of intensity
[row,col] = size(inputIm);

histMap = containers.Map('KeyType','double','ValueType','double');
normMap = containers.Map('KeyType','double','ValueType','double');

for i=1:row
    for j=1:col
        theSum = sum(inputIm(:)== inputIm(i,j));
        histMap(inputIm(i,j)) = theSum;
        normMap(inputIm(i,j)) = theSum/(row*col);
    end
end

normArr = zeros(1,max(max(inputIm)));
histArr = zeros(1,max(max(inputIm)));

for i=1:length(normArr)
    if ~isKey(normMap,i)
        normArr(i) = 0;
    else
        normArr(i) = normMap(i);
    end
    
    if ~isKey(histMap,i)
        histArr(i) = 0;
    else
        histArr(i) = histMap(i);
    end
end

histogram = histArr;
normalizedHist = normArr;

end
