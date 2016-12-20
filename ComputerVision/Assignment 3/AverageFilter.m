%Lyle Olsen
%Assignment 3

function [filteredIm] = AverageFilter(im,mask) 
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
    maskSize = maskRow*maskCol;
    
    for i=1:newRow-(RowToAdd*2)
        for j=1:newCol-(RowToAdd*2)
           values =zeros(maskRow,maskCol);
           summation =paddedIm(i,j);
            for k=i:maskRow
                for l=j:maskCol
                   values(k,l) = (paddedIm(k,l) * mask(k,l))*1/(maskRow*maskCol);
                   summation = summation + values(k,l);
                end
            end
            newIm(i,j) = summation;
            newIm(i,j) = newIm(i,j)*255;
            
        end
    end
    filteredIm = uint8(newIm);
    
else
    disp('error, not an equal matrix')
    filteredIm = 0;
end

end
