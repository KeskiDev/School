
%Lyle Olsen
%Assignment 3

%{
im = [5,1,2,31;
      8,9,4,5;
      1,2,3,4;
      1,2,3,5];
%}
im = imread('Circuit.jpg');
mask = [1,1,1;
        1,1,1;
        1,1,1;];
    
[row,col] = size(im);
[maskRow,maskCol] = size(mask);

RowToAdd = floor(maskRow/2);
ColToAdd = floor(maskCol/2);
maskSum = sum(sum(mask));

newRow = row+(RowToAdd*2);
newCol = col+(ColToAdd*2);

paddedIm = zeros(newRow,newCol);

%[paddedRow,paddedCol] = size(paddedIm);

for i=1:row
    for j=1:col
        paddedIm(i+RowToAdd,j+ColToAdd) = im(i,j);
    end
end

disp('padded')
disp(paddedIm)

meanArray = zeros(maskSum,1);

newIm = zeros(row,col);                                       
   %disp(paddedIm)
    %disp(mask)
 index =1;
    for i=1:newRow-2
        for j=1:newCol-2
           %newIm(i,j) = paddedIm(i+RowToAdd,j+ColToAdd) * expandedMask(i,j);
            
           value =zeros(maskSum,1);
           %disp(value)
           %pause
           %summation =paddedIm(i,j);
           %fprintf('outer %d,%d\n',i,j)
           %disp(meanArray)
           %pause
            for k=i:maskRow
                for l=j:maskCol
                    %meanArray(meanArrayIndex) = repelem(paddedIm(k,l),mask(k,l));
                    u = repelem(paddedIm(i+k,i+l),mask(k,l));
                    for h=1:length(u)
                        %fprintf('u @ %d: %d\n',h,u(h))
                        meanArray(index) = u(h);
                        %fprintf('meanArray: %d\n',meanArray(h))
                        index = index+1;
                    end
                    %disp(meanArray)
                    %meanArray(meanArrayIndex:mask(k,l)) = num2cell(u);
                    %meanArrayIndex = meanArrayIndex + mask(k,l);
                    %disp(u)
                    
                    % value(k,l) = paddedIm(k,l) * mask(k,l);
                   %fprintf('inner section value @ %d,%d = %d\n',k,l,value(k,l));
                   %summation = (summation + value(k,l))/maskSum;
                   %fprintf('inner section: sum = %d\n',summation)
                   %pause
                end
            end
            %disp(meanArray)
            sortedmeanarray = sort(meanArray);
            %disp(sortedmeanarray)
            %disp(length(sortedmeanarray))
            
            
            %middle = sortedmeanarray(ceil(end/2), :);
            middle = median(sortedmeanarray);
            %fprintf('middle: %d\n',middle)
            %pause
            newIm(i,j) = middle;
            index = 1;
            %newIm(i,j) = paddedIm(i+RowToAdd,j+ColToAdd)*1/maskSum;
            %newIm(i,j) = newIm(i,j);
        end
    end
    newIm = uint8(newIm);
    disp('original')
    disp(im)
    disp('mask')
    disp(mask)
    disp('my new im')
    disp(uint8(newIm))
    
    matlabIm = medfilt2(im);
    disp('matlab')
    disp(matlabIm)
    
    figure
    imshow(newIm)
    
    
    
    %{
    riceDob = im2double(rice);
for i=1:riceRow-2
    for j=1:riceCol-2
        Gx=((2*riceDob(i+2,j+1)+riceDob(i+2,j)+riceDob(i+2,j+2))-(2*riceDob(i,j+1)+riceDob(i,j)+riceDob(i,j+2)));
        %Sobel mask for y-direction:
        Gy=((2*riceDob(i+1,j+2)+riceDob(i,j+2)+riceDob(i+2,j+2))-(2*riceDob(i+1,j)+riceDob(i,j)+riceDob(i+2,j)));
        
        edgeRice(i,j) = abs(Gx)+abs(Gy);
        
        
        FIm(i,j)=sqrt(Gx.^2+Gy.^2);
                
    end
end
    %}