function [ powers, hours ] = wind_power_matcher( wind_speeds, power_reference )
    
    %this function takes in a vector of windspeeds and for each
    %windspeed finds the power that corresponds to that windspeed
    %for some windmill
    
    %this function also returns a 2 column matrix that shows the frequency
    %of each windspeed in the wind_speeds array
     
    %wind_speeds = csvread('CrabbPeninsula_Antigua_Chunk.csv',1,1);
    %power_reference = csvread('V1_8PowerCurve.csv',1,0);
        
    number_of_datas = length(wind_speeds);
    powers = zeros(1,number_of_datas);    
    
    for i = 1:number_of_datas
        power_row = find(power_reference(:,1) == wind_speeds(i));
        powers(i) = power_reference(power_row,2); 
    end
    
    %plot a histogram of the powers
    figure;
    hist(powers);
    title('Windmill Powers Histogram for 10 minute intervals');
    xlabel('Power');ylabel('Frequency (# of 10 minute intervals)');
    
    %power duration curve

    %hours for which power is yielded
    hours = zeros(1,length(power_reference));
    for i=1:length(power_reference)
        hours(i) = sum(powers(:) > power_reference(i,2))/6;
    end
    
    figure;
    plot(hours,power_reference(:,1));
    title('Power Duration Curve');xlabel('Duration, hours');ylabel('Power');
    
end

