function [ Cell0, Cell1, Cell2, Cell3 ] = Extract_Intensity( filename )

[Matrix1,Matrix2, Matrix3, Matrix4, Matrix5] = textread(filename,'%s %s %d %d %d', 'delimiter', '\t');

[seqCount, length] = size(Matrix1);

Cell0 = zeros(34,34);
Cell1 = zeros(34,34);
Cell2 = zeros(34,34);
Cell3 = zeros(34,34);



entry1 = 1;
entry1_start = 1;
Row = 1;
Column = 1;
for i = 1:34
    for j = entry1:(entry1+33)
        Cell0(Row,Column) = Matrix5(entry1);
        Column = Column + 1;
    end
    entry1 = entry1 + 103;
    Column = 1;
    Row = Row + 1;
end

entry2 = entry1_start + 34;
entry2_start = entry1_start + 34;
Row = 1;
Column = 1;
for i = 1:34
    for j = entry2:(entry2+33)
        Cell1(Row,Column) = Matrix5(entry2);
        Column = Column + 1;
    end
    entry2 = entry2 + 103;
    Column = 1;
    Row = Row + 1;
end

entry3 = entry2_start + 34;
entry3_start = entry2_start + 34;
Row = 1;
Column = 1;
for i = 1:34
    for j = entry3:(entry3+33)
        Cell2(Row,Column) = Matrix5(entry3);
        Column = Column + 1;
    end
    entry3 = entry3 + 103;
    Column = 1;
    Row = Row + 1;
end

entry4 = entry3_start + 34;
entry4_start = entry3_start + 34;
Row = 1;
Column = 1;
for i = 1:34
    for j = entry4:(entry4+33)
        Cell3(Row,Column) = Matrix5(entry4);
        Column = Column + 1;
    end
    entry4 = entry4 + 103;
    Column = 1;
    Row = Row + 1;
end
        

%ind = find(ismember(Matrix1, 'TCCCTACTATGCGACAACCTATCGGGTCATAGTGTGACCAAAGGCGTCGTCGAAG'));

  