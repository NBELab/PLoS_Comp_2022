function XYZ = Yxy2XYZ(Yxy)

Y = Yxy(:,:,1);
x = Yxy(:,:,2);
y = Yxy(:,:,3);

X = x .* ( Y ./ y );
Z = ( 1 - x - y ) .* ( Y ./ y );

XYZ = cat(3,X,Y,Z);
end
