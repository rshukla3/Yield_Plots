clc;
clear all;
close all;

filename1 = 'Median Values\VSV_1to1_RandomMatrix';
[M_Random_1, M_Random_2, M_Random_3, M_Random_4] = Extract_Intensity(filename1, 'VSV');

[m1, n1] = size(M_Random_1);

count = 1;
for i = 1:m1
for j = 1:n1
    if M_Random_1(i,j) >= 0
        RandomVector(count,1) = M_Random_1(i,j);
        count = count + 1;
    end
end
end

filename2 = 'Median Values\VSV_1to1_YieldMatrix';
[M_Yield_1, M_Yield_2, M_Yield_3, M_Yield_4] = Extract_Intensity(filename2, 'VSV');

[m1, n1] = size(M_Yield_1);

count = 1;
for i = 1:m1
for j = 1:n1
    if M_Yield_1(i,j) >= 0
        YieldVector(count,1) = M_Yield_1(i,j);
        count = count + 1;
    end
end
end

filename3 = 'Median Values\VSV_1to1_RegionMatrix';
[M_Region_1, M_Region_2, M_Region_3, M_Region_4] = Extract_Intensity(filename3, 'VSV');

[m1, n1] = size(M_Region_1);

count = 1;
for i = 1:m1
for j = 1:n1
    if M_Region_1(i,j) >= 0
        RegionVector(count,1) = M_Region_1(i,j);
        count = count + 1;
    end
end
end


YieldVector = sort(YieldVector);
RandomVector = sort(RandomVector);
RegionVector = sort(RegionVector);

Xmin = 0;
% Xmax = max(YieldVector);
Xmax = max(RandomVector);

Xline = Xmin:0.1:Xmax;
Yline = Xline;

figure(1);
scatter(RandomVector, YieldVector);
hold on;
scatter(RandomVector, RegionVector);
scatter(RandomVector, RandomVector);
plot(Xline,Yline, 'lineWidth', 1.5);
xlabel('Random Placement of Oligos', 'fontSize', 13);
ylabel('Yield/Kahng Based Placement Algorithm','fontSize', 13);
title('Comparison of Yield Based Placement and Kahng Algorithm for VSV','fontSize', 13);
hleg1 = legend('Yield placement algorithm', 'Kahng placement algorithm', 'Random placement algorithm');
hold off




Averaged_Matrix_Random_1 = PixelAverage_2_by_2(M_Random_1);
Averaged_Matrix_Random_2 = PixelAverage_2_by_2(M_Random_2);

% figure(1);
% colormap('hot');
% colormap(flipud(colormap))
% imagesc(Averaged_Matrix_Random_1);
% colorbar;
% title('Random Placement VSV Experimental Data');
% 
% 
% figure(2);
% colormap('hot');
% colormap(flipud(colormap))
% imagesc(Averaged_Matrix_Random_2);
% colorbar;
% title('Random Placement VSV Experimental Data');

Z1 = trapz(RandomVector,YieldVector);
Z2 = trapz(RandomVector,RegionVector);
Z3 = trapz(RandomVector,RandomVector);
maxRandomYield = max(RandomVector);

fprintf('Yield placement algorithm = %f, Kahng Placement algorithm = %f, Random placement algorithm after swapping = %f\n', (Z1/maxRandomYield), (Z2/maxRandomYield), (Z3/maxRandomYield));

