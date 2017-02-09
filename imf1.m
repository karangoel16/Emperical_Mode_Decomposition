function [imf,residual] = imf1(z,y)
threshold=0.23;
%for getting imf
%till here wave has been added with noise
imf=[];
%this is used to save imf 
[p_max,loc_max]=findpeaks(z);
[p_min,loc_min]=findpeaks(-1*z);
residual=z;
inner=1;
while(length(p_min)>1 && length(p_max)>1 && inner <5)
    residual_new=residual;
%inner 
    SD=3;%this is used to remove the rest of the part
    while (SD>threshold )
        [p_max,loc_max]=findpeaks(residual_new);
        [p_min,loc_min]=findpeaks(-1*residual_new);
        if(length(p_max)>2 && length(p_min)>2)
            p=spline(loc_max,p_max,1:length(y));
            q=spline(loc_min,-1*p_min,1:length(y));
            hold on;
            figure(10);
            plot(p);
            plot(q);
            mid=(p+q)/2;
            plot(mid);
              hold off;
            residual_new=residual_new-mid';
            SD=0;
            temp_length_counter=1;
            %here we are trying to find the SD so that loop could be stopped
            while(temp_length_counter<length(mid))
             SD=SD+((abs(mid(temp_length_counter))^2)/(residual_new(temp_length_counter)^2));
             temp_length_counter=temp_length_counter+1;
            end
            if(SD<threshold)
             SD
             threshold
            end
        else
            threshold=10;
        end
            % inner_i=inner_i+1;6
    end
    threshold=0.23;
    imf=[imf residual_new];
    residual=residual-residual_new;
    [p_max,loc_max]=findpeaks(residual);
    [p_min,loc_min]=findpeaks(-1*residual);
    inner=inner+1;
end