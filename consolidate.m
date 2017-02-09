function [ekg_new]=consolidate(imf,y,residual)
i=1;
l=[zeros(1,length(y))];
p=size(imf);
%lol=[];
%k=1;
%while(k<length(imf)

while (i<=p(2))
    j=1;
    s=[];
    while(j<=length(y))
        if(abs(imf(j,i))>(median(abs(imf(:,1)-median(imf(:,1))))*1.4826)*(2*log(length(imf)/16)^0.5)/2^(i-1))
            s=[s imf(j,i)];
        else
            s=[s 0];
        end
        j=j+1;
    end
    l=l+s;
    i=i+1;
end
%l=l+residual;
ekg_new=l(1001:1983)+residual(1001:1983)';
figure(5)
plot(ekg_new)