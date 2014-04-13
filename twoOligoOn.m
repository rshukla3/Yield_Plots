function [ count ] = twoOligoOn( oligoMask, o1, o2, o3, o4, o5 )

[Om, On] = size(oligoMask);
if(o1 < 0)
    maskArray1 = zeros(1,On);
else
    maskArray1 = oligoMask(o1,:);
end

if(o2 < 0)
    maskArray2 = zeros(1,On);
else
    maskArray2 = oligoMask(o2,:);
end

if(o3 < 0)
    maskArray3 = zeros(1,On);
else
    maskArray3 = oligoMask(o3,:);
end

if(o4 < 0)
    maskArray4 = zeros(1,On);
else
    maskArray4 = oligoMask(o4,:);
end

%if(o5 < 0)
%    maskArray5 = zeros(1,On);
%else
    maskArray5 = oligoMask(o5,:);
%end


bitOperation1 = bitand(bitand(~maskArray1,~maskArray2),bitand(maskArray3,maskArray4));
bitOperation2 = bitand(bitand(~maskArray1,maskArray2),bitand(~maskArray3,maskArray4));
bitOperation3 = bitand(bitand(~maskArray1,maskArray2),bitand(maskArray3,~maskArray4));
bitOperation4 = bitand(bitand(maskArray1,~maskArray2),bitand(~maskArray3,maskArray4));
bitOperation5 = bitand(bitand(maskArray1,~maskArray2),bitand(maskArray3,~maskArray4));
bitOperation6 = bitand(bitand(maskArray1,maskArray2),bitand(~maskArray3,~maskArray4));

bitResult1 = bitor(bitor(bitOperation1, bitOperation2), bitor(bitOperation3, bitOperation4));
bitResult2 = bitor(bitor(bitOperation5, bitOperation6), bitResult1);


bitResult = bitand(bitResult2, ~maskArray5);


%bitResult = bitand(bitResultMask, ~oligoMask(o5, :));

count = sum(bitResult);
