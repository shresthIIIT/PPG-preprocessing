function [ y ] = smooth_nc( x,a )
%Summary of this function goes here
%   Detailed explanation goes here
xf=filter(a,1,x);
y=flip(filter(a,1,flip(xf,1)),1);

end

