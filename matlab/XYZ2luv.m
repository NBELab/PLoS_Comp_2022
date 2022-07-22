function [luv] = XYZ2luv(XYZ)
%http://www.easyrgb.com/en/math.php
%Reference-X, Y and Z refer to specific illuminants and observers.
%Common reference values are available below in this same page.
Reference_X= 95.047;
Reference_Y =100.000;
Reference_Z = 108.883;


X = 1.*XYZ(:,:,1);
Y = 1.*XYZ(:,:,2);
Z = 1.*XYZ(:,:,3);
var_U = ( 4 * X ) ./ ( X + ( 15 * Y ) + ( 3 * Z ) );
var_V = ( 9 * Y ) ./ ( X + ( 15 * Y ) + ( 3 * Z ) );

var_Y = Y / 100;
if ( var_Y > 0.008856 )
    var_Y = var_Y .^ ( 1/3 );

else
    var_Y = ( 7.787 * var_Y ) + ( 16 / 116 );
end

ref_U = ( 4 * Reference_X ) / ( Reference_X + ( 15 * Reference_Y ) + ( 3 * Reference_Z ) );
ref_V = ( 9 * Reference_Y ) / ( Reference_X + ( 15 * Reference_Y ) + ( 3 * Reference_Z ) );

CIE_L = ( 116 * var_Y ) - 16;
CIE_U = 13 * CIE_L .* ( var_U - ref_U );
CIE_V = 13 * CIE_L .* ( var_V - ref_V );

luv(:,:,1) = CIE_L;
luv(:,:,2) = CIE_U;
luv(:,:,3) = CIE_V;
end