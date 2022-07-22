function XYZ = rgb2XYZ(RGB)
sR = RGB(:,:,1);
sG = RGB(:,:,2);
sB = RGB(:,:,3);
%sR, sG and sB (Standard RGB) input range = 0 ÷ 255
%X, Y and Z output refer to a D65/2° standard illuminant.
m = 1;
var_R = ( sR ./ m );
var_G = ( sG ./ m );
var_B = ( sB ./ m );

if ( var_R > 0.04045 ) 
    var_R = ( ( var_R + 0.055 ) / 1.055 ) .^ 2.4;
else
    var_R = var_R ./ 12.92;
end
if ( var_G > 0.04045 ) 
    var_G = ( ( var_G + 0.055 ) / 1.055 ) .^ 2.4;
else
    var_G = var_G / 12.92;
end
if ( var_B > 0.04045 ) 
    var_B = ( ( var_B + 0.055 ) / 1.055 ) .^ 2.4;

else
    var_B = var_B / 12.92;
end

var_R = var_R .* 100;
var_G = var_G .* 100;
var_B = var_B .* 100;

X = var_R * 0.4124 + var_G * 0.3576 + var_B * 0.1805;
Y = var_R * 0.2126 + var_G * 0.7152 + var_B * 0.0722;
Z = var_R * 0.0193 + var_G * 0.1192 + var_B * 0.9505;

XYZ = cat(3,X,Y,Z);
end