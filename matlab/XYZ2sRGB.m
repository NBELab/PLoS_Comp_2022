function RGB = XYZ2sRGB(XYZ)
%//X, Y and Z input refer to a D65/2° standard illuminant.
%//sR, sG and sB (standard RGB) output range = 0 ÷ 255
X = XYZ(:,:,1);
Y = XYZ(:,:,2);
Z = XYZ(:,:,3);
var_X = X / 100;
var_Y = Y / 100;
var_Z = Z / 100;

var_R = var_X *  3.2406 + var_Y * -1.5372 + var_Z * -0.4986;
var_G = var_X * -0.9689 + var_Y *  1.8758 + var_Z *  0.0415;
var_B = var_X *  0.0557 + var_Y * -0.2040 + var_Z *  1.0570;

if ( var_R > 0.0031308 ) 
    var_R = 1.055 * ( var_R ^ ( 1 / 2.4 ) ) - 0.055;
else
    var_R = 12.92 * var_R;
end
if ( var_G > 0.0031308 ) 
    var_G = 1.055 * ( var_G ^ ( 1 / 2.4 ) ) - 0.055;
else
    var_G = 12.92 * var_G;
end
if ( var_B > 0.0031308 ) 
    var_B = 1.055 * ( var_B ^ ( 1 / 2.4 ) ) - 0.055;
else
    var_B = 12.92 * var_B;
end

sR = var_R * 1;
sG = var_G * 1;
sB = var_B * 1;
RGB = cat(3,sR,sG,sB);
end