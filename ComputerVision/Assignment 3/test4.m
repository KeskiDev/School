img = imread('Text1.gif');

edgeIm = edge(img,.20);

figure
subplot(1,2,1)
imshow(img)
title('Original')
subplot(1,2,2)
imshow(edgeIm)

[newRow,newCol] = size(edgeIm);


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