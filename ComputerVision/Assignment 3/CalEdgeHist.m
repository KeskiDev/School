%Lyle Olsen
%assignment 3
function edgeHist = CalEdgeHist(im, bin) 

edgeIm = edge(im);

[row,col] = size(edgeIm);

histMap = containers.Map('KeyType','double','ValueType','double');
bins = zeros(1,bin);


gX = [-1,-2,-1;
       0,0,0;
       1,2,1];
gY = [-1,0,1;
       -2,0,2;
       -1,0,1];
   
FImx = imfilter(im2double(im),gX);
FImy = imfilter(im2double(im),gY);

for i=1:row
    for j=1:col
        value = floor(atand(FImx(i,j)/FImy(i,j)));
        
        if isnan(value)
            break
        elseif isKey(histMap,value)
            current = values(histMap,{value});
            numCurrent = cell2mat(current);
           histMap(value) = numCurrent + 1;
        else
           histMap(value) = 1;
        end
    end
end

histSize = size(histMap);
total = size(histMap);
indieBins = floor(total(1)/bin);
histArr = zeros(1,histSize(1));

index = -90;
for i=1:histSize(1)
    histArr(i) = histMap(index);
    index = index +1;
end

histIndex = 1;
for b=1:bin
    nextOne = histIndex+indieBins-1;
    if nextOne > 181
        break;
    else
        bins(b) = sum(histArr(histIndex:nextOne));
    
        histIndex = histIndex + indieBins;
    end
    
end
edgeHist = bins;





end