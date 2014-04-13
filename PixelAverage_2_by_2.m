function [ Averaged_Matrix ] = PixelAverage_2_by_2( matrix )
%Calculates the average of 2-by-2 pixel matrix.

[m,n] = size(matrix);

Averaged_Matrix_Row = 1;
Averaged_Matrix_Column = 1;

%Preallocating Averaged_Matrix to improve performance in terms of speed.
Averaged_Matrix = zeros(m/2, n/2);

for i = 1:2:m
    for j = 1:2:n
        
        Averaged_Matrix(Averaged_Matrix_Row, Averaged_Matrix_Column) = (matrix(i,j) + matrix(i+1,j) + matrix(i,j+1) + matrix(i+1,j+1))/4;
        
        Averaged_Matrix_Column = Averaged_Matrix_Column + 1;
    end
    Averaged_Matrix_Row = Averaged_Matrix_Row + 1;
    Averaged_Matrix_Column = 1;
end


end

