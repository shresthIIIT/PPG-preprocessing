
%Prepared by Dr. Shresth Gupta
%Kindly cite the article in which this codes are used:
%Gupta, S., Singh, A., & Sharma, A. (2021, August). Photoplethysmogram based mean arterial pressure estimation using LSTM. 
...In 2021 8th International Conference on Signal Processing and Integrated Networks (SPIN) (pp. 806-811). IEEE.


function [ x_prep ] = preprocess( x , Fs)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% x=input PPG signal
% Fs= sampling frequency of the PPG signal

x=resample(x,1000,Fs);

[c,l] = wavedec(x,12,'db8');

cnew = c;
idx=cumsum(l);
cnew(1:idx(4))=0;
cnew(idx(end-2)+1:idx(end))=0;
x_prep = waverec(cnew,l,'db8');

x_prep=resample(x_prep,Fs,1000);

% a=[0.7 0.2 0.1];
a=ones(1,10)/10;
x_prep=smooth_nc(x_prep,a);


end

