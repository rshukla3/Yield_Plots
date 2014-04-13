function [ PlacementMatrix_Yield ] = calculateYield( Rm, Rn, Yield_Matrix_Start_X, Yield_Matrix_End_X, Yield_Matrix_Start_Y, Yield_Matrix_End_Y, PlacementMatrix, oligoMask, onePositionMisMatch, twoPositionMisMatch, threePositionMisMatch, fourPositionMisMatch)
%Calculate yield of the placement matrices.

PlacementMatrixX = 0;

for i = Yield_Matrix_Start_X:Yield_Matrix_End_X
    
    PlacementMatrixX = PlacementMatrixX + 1;
    PlacementMatrixY = 0;
    for j = Yield_Matrix_Start_Y:Yield_Matrix_End_Y
        
        PlacementMatrixY = PlacementMatrixY + 1;
        if((i-1)>0&&(j-1)>0&&(i+1)<=Rm&&(j+1)<=Rn)
            o1 = PlacementMatrix(i,j-1)+1;
            o2 = PlacementMatrix(i+1,j)+1;
            o3 = PlacementMatrix(i,j+1)+1;
            o4 = PlacementMatrix(i-1,j)+1;
        elseif((i-1)<=0&&(j-1)>0&&(i+1)<=Rm&&(j+1)<=Rn)
            o1 = PlacementMatrix(i,j-1)+1;
            o2 = PlacementMatrix(i+1,j)+1;
            o3 = PlacementMatrix(i,j+1)+1;
            o4 = -3;
        elseif((i-1)>0&&(j-1)<=0&&(i+1)<=Rm&&(j+1)<=Rn)
            o1 = -3;
            o2 = PlacementMatrix(i+1,j)+1;
            o3 = PlacementMatrix(i,j+1)+1;
            o4 = PlacementMatrix(i-1,j)+1;
        elseif((i-1)<=0&&(j-1)<=0&&(i+1)<=Rm&&(j+1)<=Rn)
            o1 = -3;
            o2 = PlacementMatrix(i+1,j)+1;
            o3 = PlacementMatrix(i,j+1)+1;
            o4 = -3;
        elseif((i-1)>0&&(j-1)>0&&(i+1)>Rm&&(j+1)<=Rn)
            o1 = PlacementMatrix(i,j-1)+1;
            o2 = -3;
            o3 = PlacementMatrix(i,j+1)+1;
            o4 = PlacementMatrix(i-1,j)+1;
        elseif((i-1)>0&&(j-1)>0&&(i+1)<=Rm&&(j+1)>Rn)
            o1 = PlacementMatrix(i,j-1)+1;
            o2 = PlacementMatrix(i+1,j)+1;
            o3 = -3;
            o4 = PlacementMatrix(i-1,j)+1;
        elseif((i-1)>0&&(j-1)>0&&(i+1)>Rm&&(j+1)>Rn)
            o1 = PlacementMatrix(i,j-1)+1;
            o2 = -3;
            o3 = -3;
            o4 = PlacementMatrix(i-1,j)+1;
        end
        o5 = PlacementMatrix(i,j)+1;
        if o5 < 0
            PlacementMatrix_Yield(PlacementMatrixX,PlacementMatrixY) = -3;
        else
            oneOligoOnCount = oneOligoOn(oligoMask, o1, o2, o3, o4, o5);
            twoOligoOnCount = twoOligoOn(oligoMask, o1, o2, o3, o4, o5);
            threeOligoOnCount = threeOligoOn(oligoMask, o1, o2, o3, o4, o5);
            fourOligoOnCount = fourOligoOn(oligoMask, o1, o2, o3, o4, o5);
        
            PlacementMatrix_Yield(PlacementMatrixX,PlacementMatrixY) = (onePositionMisMatch^oneOligoOnCount)*(twoPositionMisMatch^twoOligoOnCount)*(threePositionMisMatch^threeOligoOnCount)*(fourPositionMisMatch^fourOligoOnCount);

        end
    end
end


end

