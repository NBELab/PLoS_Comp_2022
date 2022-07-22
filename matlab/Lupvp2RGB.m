function RGB = Lupvp2RGB(L,u,v)
%//X, Y and Z input refer to a D65/2° standard illuminant.
%//sR, sG and sB (standard RGB) output range = 0 ÷ 255

%convert from uv to Yxy
[x,y] = uv2xy(u,v);
Yxy(:,:,1) = L;
Yxy(:,:,2) = x;
Yxy(:,:,3) = y;

% convert from Yxy to XYZ
XYZ = Yxy2XYZ(Yxy);

%convert from XYZ to RGB
RGB = XYZ2sRGB(XYZ);
end