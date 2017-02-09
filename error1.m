function [snr_out]=error1(ekg_new,ekg)
i=1;
l=0;
k=0;
while(i<length(ekg))
    l=l+(ekg_new(i)^2;
    k=k+(ekg(i)-ekg_new(i))^2);
    i=i+1;
end
snr_out=10*log(l/k);