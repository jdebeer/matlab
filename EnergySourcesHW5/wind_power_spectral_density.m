function [ ] = wind_power_spectral_density( powers )
%This function plots a wind power density spectrum
%   Energy Sources and Conversion, Homework 5

    N = length(powers);

    fast_fourier = fft(powers);
    amp = abs(2/N*fast_fourier);
    freq = linspace(1,N,N)/600/N;
    
    figure;
    loglog(freq,amp);
    title('Wind Power Density Spectrum');
    xlabel('Frequency (Hz)');ylabel('Amplitude, (m/s)^2/Hz');

end

