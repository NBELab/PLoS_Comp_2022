function Yxy = XYZ2Yxy(XYZ)

X = XYZ(:,:,1);
Y = XYZ(:,:,2);
Z = XYZ(:,:,3);

x = X ./ ( X + Y + Z );
y = Y ./ ( X + Y + Z );

Yxy = cat(3,Y,x,y);
end
