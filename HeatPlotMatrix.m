clc;
clear all;
close all;
placementMatrix_random = dlmread('RandomMatrix_VSV.txt', '\t');
placementMatrix_kahng = dlmread('RegionMatrix_KahngAlgo_VSV.txt', '\t');
placementMatrix_yield = dlmread('YieldMatrix_VSV.txt', '\t');
oligoMask = dlmread('OligoMasks_VSV_1.txt', '\t');
[Rm Rn] = size(placementMatrix_random);
Yield_Matrix_Start_X = 1;
Yield_Matrix_Start_Y = 1;
Yield_Matrix_End_X = Rm;
Yield_Matrix_End_Y = Rn;
onePositionMisMatch = 0.99;
twoPositionMisMatch = 0.978;
threePositionMisMatch = 0.95;
fourPositionMisMatch = 0.90;
YieldMatrix_Random = calculateYield( Rm, Rn, Yield_Matrix_Start_X, Yield_Matrix_End_X, Yield_Matrix_Start_Y, Yield_Matrix_End_Y, placementMatrix_random, oligoMask, onePositionMisMatch, twoPositionMisMatch, threePositionMisMatch, fourPositionMisMatch);
YieldMatrix_Kahng = calculateYield( Rm, Rn, Yield_Matrix_Start_X, Yield_Matrix_End_X, Yield_Matrix_Start_Y, Yield_Matrix_End_Y, placementMatrix_kahng, oligoMask, onePositionMisMatch, twoPositionMisMatch, threePositionMisMatch, fourPositionMisMatch);
YieldMatrix_Yield = calculateYield( Rm, Rn, Yield_Matrix_Start_X, Yield_Matrix_End_X, Yield_Matrix_Start_Y, Yield_Matrix_End_Y, placementMatrix_yield, oligoMask, onePositionMisMatch, twoPositionMisMatch, threePositionMisMatch, fourPositionMisMatch);

Averaged_Matrix_Random = PixelAverage_2_by_2(YieldMatrix_Random);
Averaged_Matrix_Kahng = PixelAverage_2_by_2(YieldMatrix_Kahng);
Averaged_Matrix_Yield = PixelAverage_2_by_2(YieldMatrix_Yield);

figure(3);
colormap('hot');
colormap(flipud(colormap))
imagesc(Averaged_Matrix_Yield);
colorbar;
title('Yield Placement EColi');

figure(1);
colormap('hot');
colormap(flipud(colormap))
%image(YieldMatrix_Yield,'CDataMapping', 'scaled');
imagesc(Averaged_Matrix_Random);
colorbar;
title('Random Placement EColi');

figure(2);
colormap('hot');
colormap(flipud(colormap))
imagesc(Averaged_Matrix_Kahng);
colorbar;
title('Kahng Algorithm Placement EColi');

