clc;
clear all;
close all;

filename1 = 'VSV_1to1_RandomMatrix';
[M_Random_1, M_Random_2, M_Random_3, M_Random_4] = Extract_Intensity(filename1, 'VSV');

[m1, n1] = size(M_Random_1);

count = 1;
for i = 1:m1
for j = 1:n1
    if M_Random_1(i,j) >= 0
        RandomVector_1to1(count,1) = M_Random_1(i,j);
        count = count + 1;
    end
end
end

filename2 = 'VSV_1to1_YieldMatrix';
[M_Yield_1, M_Yield_2, M_Yield_3, M_Yield_4] = Extract_Intensity(filename2, 'VSV');

[m1, n1] = size(M_Yield_1);

count = 1;
for i = 1:m1
for j = 1:n1
    if M_Yield_1(i,j) >= 0
        YieldVector_1to1(count,1) = M_Yield_1(i,j);
        count = count + 1;
    end
end
end

filename3 = 'VSV_1to1_RegionMatrix';
[M_Region_1, M_Region_2, M_Region_3, M_Region_4] = Extract_Intensity(filename3, 'VSV');

[m1, n1] = size(M_Region_1);

count = 1;
for i = 1:m1
for j = 1:n1
    if M_Region_1(i,j) >= 0
        RegionVector_1to1(count,1) = M_Region_1(i,j);
        count = count + 1;
    end
end
end


YieldVector_1to1 = sort(YieldVector_1to1);
RandomVector_1to1 = sort(RandomVector_1to1);
RegionVector_1to1 = sort(RegionVector_1to1);



filename1 = 'VSV_1to4_RandomMatrix';
[M_Random_1, M_Random_2, M_Random_3, M_Random_4] = Extract_Intensity(filename1, 'VSV');

[m1, n1] = size(M_Random_1);

count = 1;
for i = 1:m1
for j = 1:n1
    if M_Random_1(i,j) >= 0
        RandomVector_1to4(count,1) = M_Random_1(i,j);
        count = count + 1;
    end
end
end

filename2 = 'VSV_1to4_YieldMatrix';
[M_Yield_1, M_Yield_2, M_Yield_3, M_Yield_4] = Extract_Intensity(filename2, 'VSV');

[m1, n1] = size(M_Yield_1);

count = 1;
for i = 1:m1
for j = 1:n1
    if M_Yield_1(i,j) >= 0
        YieldVector_1to4(count,1) = M_Yield_1(i,j);
        count = count + 1;
    end
end
end

filename3 = 'VSV_1to4_RegionMatrix';
[M_Region_1, M_Region_2, M_Region_3, M_Region_4] = Extract_Intensity(filename3, 'VSV');

[m1, n1] = size(M_Region_1);

count = 1;
for i = 1:m1
for j = 1:n1
    if M_Region_1(i,j) >= 0
        RegionVector_1to4(count,1) = M_Region_1(i,j);
        count = count + 1;
    end
end
end


YieldVector_1to4 = sort(YieldVector_1to4);
RandomVector_1to4 = sort(RandomVector_1to4);
RegionVector_1to4 = sort(RegionVector_1to4);


filename1 = 'VSV_1to2_RandomMatrix';
[M_Random_1, M_Random_2, M_Random_3, M_Random_4] = Extract_Intensity(filename1, 'VSV');

[m1, n1] = size(M_Random_1);

count = 1;
for i = 1:m1
for j = 1:n1
    if M_Random_1(i,j) >= 0
        RandomVector_1to2(count,1) = M_Random_1(i,j);
        count = count + 1;
    end
end
end

filename2 = 'VSV_1to2_YieldMatrix';
[M_Yield_1, M_Yield_2, M_Yield_3, M_Yield_4] = Extract_Intensity(filename2, 'VSV');

[m1, n1] = size(M_Yield_1);

count = 1;
for i = 1:m1
for j = 1:n1
    if M_Yield_1(i,j) >= 0
        YieldVector_1to2(count,1) = M_Yield_1(i,j);
        count = count + 1;
    end
end
end

filename3 = 'VSV_1to2_RegionMatrix';
[M_Region_1, M_Region_2, M_Region_3, M_Region_4] = Extract_Intensity(filename3, 'VSV');

[m1, n1] = size(M_Region_1);

count = 1;
for i = 1:m1
for j = 1:n1
    if M_Region_1(i,j) >= 0
        RegionVector_1to2(count,1) = M_Region_1(i,j);
        count = count + 1;
    end
end
end


YieldVector_1to2 = sort(YieldVector_1to2);
RandomVector_1to2 = sort(RandomVector_1to2);
RegionVector_1to2 = sort(RegionVector_1to2);

Xmin = 0;
% Xmax = max(YieldVector);
Xmax = max(RandomVector_1to4);

Xline = Xmin:0.1:Xmax;
Yline = Xline;

scatterPlotSize = 85;
FontSize = 18;


figure(1);
subplot(2,1,1);
scatter(RandomVector_1to4, YieldVector_1to4, scatterPlotSize, '+');
hold on;
scatter(RandomVector_1to4, RegionVector_1to4, scatterPlotSize, '^');
scatter(RandomVector_1to4, RandomVector_1to4, scatterPlotSize);
plot(Xline,Yline, 'lineWidth', 1.5);
set(gca,'FontSize',FontSize);
xlabel('Random Placement of Oligos', 'fontSize', FontSize);
ylabel('Placement Algorithms','fontSize', FontSize);
hleg1 = legend('Yield based placement algorithm', 'Kahng placement algorithm', 'Random placement algorithm');
set(hleg1, 'FontSize', FontSize);
hold off

subplot(2,1,2);
scatter(RandomVector_1to1, YieldVector_1to1, scatterPlotSize, '+');
hold on;
scatter(RandomVector_1to1, RegionVector_1to1, scatterPlotSize, '^');
scatter(RandomVector_1to1, RandomVector_1to1, scatterPlotSize);
plot(Xline,Yline, 'lineWidth', 1.5);
set(gca,'FontSize',FontSize);
xlabel('Random Placement of Oligos', 'fontSize', FontSize);
ylabel('Placement Algorithms','fontSize', FontSize);
hleg1 = legend('Yield based placement algorithm', 'Kahng placement algorithm', 'Random placement algorithm');
set(hleg1, 'FontSize', FontSize);
hold off

scatterPlotSize = 85;
FontSize = 18;

figure(2)
scatter(RandomVector_1to4, YieldVector_1to4, scatterPlotSize, '+');
hold on;
scatter(RandomVector_1to4, RegionVector_1to4, scatterPlotSize, '^');
scatter(RandomVector_1to4, RandomVector_1to4, scatterPlotSize);
plot(Xline,Yline, 'lineWidth', 1.5);
set(gca,'FontSize',FontSize);
xlabel('Random Placement of Oligos', 'fontSize', FontSize);
ylabel('Placement Algorithms','fontSize', FontSize);
hleg1 = legend('Yield based placement algorithm', 'Kahng placement algorithm', 'Random placement algorithm');
set(hleg1, 'FontSize', FontSize);
hold off

figure(3)
scatter(RandomVector_1to1, YieldVector_1to1, scatterPlotSize, '+');
hold on;
scatter(RandomVector_1to1, RegionVector_1to1, scatterPlotSize, '^');
scatter(RandomVector_1to1, RandomVector_1to1, scatterPlotSize);
plot(Xline,Yline, 'lineWidth', 1.5);
set(gca,'FontSize',FontSize);
xlabel('Random Placement of Oligos', 'fontSize', FontSize);
ylabel('Placement Algorithms','fontSize', FontSize);
hleg1 = legend('Yield based placement algorithm', 'Kahng placement algorithm', 'Random placement algorithm');
set(hleg1, 'FontSize', FontSize);
hold off


Xmin = 0;
% Xmax = max(YieldVector);
Xmax = max(YieldVector_1to1);

Xline = Xmin:0.1:Xmax;
Yline = Xline;


figure(4);
scatter(YieldVector_1to1, YieldVector_1to4, scatterPlotSize, '+');
hold on;
scatter(YieldVector_1to1, YieldVector_1to1, scatterPlotSize);
%scatter(YieldVector_1to1, YieldVector_1to2);
plot(Xline,Yline, 'lineWidth', 1.5);
set(gca,'FontSize',FontSize);
xlabel('Yield based placement for 1:1 placement on array', 'fontSize', FontSize);
ylabel('Yield based placement for 1:4 placement on array','fontSize', FontSize);
hleg1 = legend('Yield based placement algorithm for 1:4 placement', 'Yield based placement algorithm for 1:1 placement');
set(hleg1, 'FontSize', FontSize);
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

Z1 = trapz(RandomVector_1to4,YieldVector_1to4);
Z2 = trapz(RandomVector_1to4,RegionVector_1to4);
Z3 = trapz(RandomVector_1to4,RandomVector_1to4);
maxRandomYield = max(RandomVector_1to4);

fprintf('Yield placement algorithm = %f, Kahng Placement algorithm = %f, Random placement algorithm after swapping = %f\n', (Z1/maxRandomYield), (Z2/maxRandomYield), (Z3/maxRandomYield));

