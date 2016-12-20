%Lyle Olsen
%Assignment 3

function [filteredIm] = MedianFiltering(im,mask) 

[maskRow,maskCol] = size(mask);
[row,col] = size(im);

RowToAdd = floor(maskRow/2);
ColToAdd = floor(maskCol/2);
maskSum = sum(sum(mask));

newRow = row+(RowToAdd*2);
newCol = col+(ColToAdd*2);

paddedIm = zeros(newRow,newCol);

if maskRow == maskCol
    if mod(maskRow,2)==0
        disp('error not and odd matrix size')
    end
    for i=1:row
        for j=1:col
            paddedIm(i+RowToAdd,j+ColToAdd) = im(i,j);
        end
    end
    
    newIm = zeros(row,col);
    meanArray = zeros(1,maskSum);
    
    index =1;
    for i=1:newRow-2
        for j=1:newCol-2
            
            for k=i:maskRow
                for l=j:maskCol
                    u = repelem(paddedIm(i+k,i+l),mask(k,l));
                    for h=1:length(u)
                        meanArray(index) = u(h);
                        index = index+1;
                    end
                end
            end
            
            sortedmeanarray = sort(meanArray);
            middle = median(sortedmeanarray);
            newIm(i,j) = middle;
            index = 1;
        end
    end
    filteredIm = uint8(newIm);
    
else
    disp('error, not an equal matrix')
    filteredIm = 0;
end

end
