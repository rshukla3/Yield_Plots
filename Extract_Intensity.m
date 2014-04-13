function [ Cell0, Cell1, Cell2, Cell3 ] = Extract_Intensity( filename, Sequence )

[Matrix1,Matrix2, Matrix3, Matrix4, Matrix5] = textread(filename,'%s %s %d %d %d', 'delimiter', '\t');

if(strcmpi(Sequence, 'VSV'))
    Matrix_Size = 34;
    next_entry = 103;
elseif(strcmpi(Sequence, 'EColi'))
    Matrix_Size = 26;
    next_entry = 79;
else
    fprintf('Sequence not specified');
end

Matrix2 = Matrix2{1};

placementCriteria = Matrix2(1:4);

if(strcmpi(placementCriteria, '4to4')||strcmpi(placementCriteria, '4to9')||strcmpi(placementCriteria, '4to25')||strcmpi(placementCriteria, '4to16'))
    incrementVal = 2;
    Matrix_Size = 2*Matrix_Size;
    next_entry = 2*next_entry;
else
    incrementVal = 1;
end

Cell0 = zeros(Matrix_Size,Matrix_Size);
Cell1 = zeros(Matrix_Size,Matrix_Size);
Cell2 = zeros(Matrix_Size,Matrix_Size);
Cell3 = zeros(Matrix_Size,Matrix_Size);

entry1 = 1;
entry1_start = 1;
Row = 1;
Column = 1;
for i = 1:Matrix_Size
    for j = entry1:incrementVal:(entry1+Matrix_Size-1)
        if(incrementVal == 1)
            Cell0(Row,Column) = Matrix5(j);
        else
            Cell0(Row,Column) = (Matrix5(j)+Matrix5(j+1))/2;
        end
        Column = Column + 1;
    end
    entry1 = entry1 + Matrix_Size-1 +next_entry;
    Column = 1;
    Row = Row + 1;
end

% entry2 = entry1_start + Matrix_Size;
% entry2_start = entry1_start + Matrix_Size;
% Row = 1;
% Column = 1;
% for i = 1:Matrix_Size
%     for j = entry2:(entry2+Matrix_Size-1)
%         Cell1(Row,Column) = Matrix5(j);
%         Column = Column + 1;
%     end
%     entry2 = entry2 + next_entry + Matrix_Size-1;
%     Column = 1;
%     Row = Row + 1;
% end
% 
% entry3 = entry2_start + Matrix_Size;
% entry3_start = entry2_start + Matrix_Size;
% Row = 1;
% Column = 1;
% for i = 1:Matrix_Size
%     for j = entry3:(entry3+Matrix_Size-1)
%         Cell2(Row,Column) = Matrix5(j);
%         Column = Column + 1;
%     end
%     entry3 = entry3 + next_entry + Matrix_Size-1;
%     Column = 1;
%     Row = Row + 1;
% end
% 
% entry4 = entry3_start + Matrix_Size;
% entry4_start = entry3_start + Matrix_Size;
% Row = 1;
% Column = 1;
% for i = 1:Matrix_Size
%     for j = entry4:(entry4+Matrix_Size-1)
%         Cell3(Row,Column) = Matrix5(j);
%         Column = Column + 1;
%     end
%     entry4 = entry4 + next_entry + Matrix_Size-1;
%     Column = 1;
%     Row = Row + 1;
% end
%         
% 
% %ind = find(ismember(Matrix1, 'TCCCTACTATGCGACAACCTATCGGGTCATAGTGTGACCAAAGGCGTCGTCGAAG'));

  