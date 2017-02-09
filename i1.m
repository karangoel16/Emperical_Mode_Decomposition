%%
% for intiialising
%%figure(3);
%y=ekg;
close all;
clear all;
%%
clc;
threshold=0.23;
t=[];

%C:\Users\karan\Desktop\fileserver1\MATLAB\lol.wav
[x,fs,N]=wavread('e:\sounds\sun2.wav');
k=[];
f=30001;
while(f<30983)
ekg=x(f:f+983)';
%f
j=-2;
x_axis=[];
y=[];
y_axis=[];
%ekg=x(25001:25983)';
while j<-1
    y=[zeros(1000,1); ekg; zeros(1000,1)];
    z=awgn(y,j,'measured');
   % i=1;
   % l=0;
  %  while(i<length(ekg))
  %      l=l+(ekg(i)^2/(ekg(i)-z(1000+i,1))^2);
  %      i=i+1;
  %  end 
   x_axis=[x_axis snr(z,y)];
   x_axis
  [k,residual]=imf1(z,y);
  [lol]=consolidate(k,y,residual);
 % y_axis=[y_axis snr(ekg,lol')];
  y_axis
  figure(8);
  plot(lol');
  figure(9);
  plot(ekg);
  j=j+1;
  t=[t lol];
end
f=f+1000;
end