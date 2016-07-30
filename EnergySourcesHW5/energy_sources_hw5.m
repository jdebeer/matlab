% NOTE: make sure the .csv files are in the main matlab directory


% 1. plot turbulance intensity

M = csvread('TracyCA_highres.csv',1,3);
turbulance_intensity = turb(M);


% 2. & 3. plot power histogram and power duration

B = csvread('CrabbPeninsula_Antigua_Chunk.csv',1,1);
Power = csvread('V1_8PowerCurve.csv',1,0);
[powers hours] = wind_power_matcher(B,Power);


% 4. plot wind

wind_power_spectral_density(powers);

% 4additional. Weibull and Rayleigh velocity distribution curves

raleigh_and_weibull(B);