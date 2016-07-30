function [ turbulance_intensity ] = turb( wind_speeds )

%wind_speeds = csvread('TracyCA_highres.csv',1,3);

Nminute = 456;
N = length(wind_speeds);
number_of_minutes = floor(N/Nminute);
turbulance_intensity = zeros(1,number_of_minutes);


function [ minute_sum ] = minSum(minute)
    stop = minute*456;
    start = stop - 455;
    minute_sum = 0;
        
    for j = start:stop 
        minute_sum = minute_sum + wind_speeds(j);
    end
end

function [ sqdif_sum ] = sqDifSum(minute,mean)
    stop = minute*456;
    start = stop - 455;
    sqdif_sum = 0;
        
    for j = start:stop 
        sqdif_sum = sqdif_sum + (mean-wind_speeds(j))^2;
    end
end


for i = 1:number_of_minutes
    mean_windspeed = minSum(i)/Nminute;
    standard_deviation = sqrt((1/(Nminute-1))*sqDifSum(i,mean_windspeed));
    turbulance_intensity(i) = standard_deviation/mean_windspeed;
end
    
figure;
times = linspace(1,number_of_minutes,number_of_minutes);
plot(times, turbulance_intensity);
title('Turbulance Intentsities for 1 hour interval');
xlabel('Minute');ylabel('Turbulance Intensity');
axis([0,60,0,0.3]);

end

