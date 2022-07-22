function [x,y] = uv2xy(u,v)
%u = uv(:,:,1);
%v = uv(:,:,2);

x = 9.*u./(6*u-16*v+12);
y = 4.*v./(6*u-16*v+12);


end

