%Lyle Olsen
%Assignment 2

function [scaledIm,transFunc]=Scaling(inputIm,range)
y = zeros(size(inputIm));

[row,col] = size(inputIm);
minX = min(min(inputIm));
maxX = max(max(inputIm));
newMin = range(1);
newMax = range(2);
%{
fprintf('old min: %d\n',minX)
fprintf('old max: %d\n',maxX)
fprintf('new min: %d\n',newMin)
fprintf('new min: %d\n', newMax)
pause
%}

mSlope = (newMax-newMin)/(maxX - minX);
%disp(mSlope)
b = newMin - (mSlope * minX);
%disp('b')
%disp(b)
for i=1:row
    for j=1:col
        %disp(mSlope)
        %disp(inputIm(i,j))
        %disp(b)
        y(i,j) = mSlope*inputIm(i,j)+ b;
        y(i,j) = y(i,j)/255;
        %disp(y(i,j))
        %pause
    end
end
%fprintf('%d,%d - %d,%d',minX,newMin,maxX,newMax)
scaledIm = im2uint8(y);

%transFunc = zer%os(1,newMax-newMin+1);
test1 = unique(y');
transFunc = test1(:)';
%disp(transFunc)
end