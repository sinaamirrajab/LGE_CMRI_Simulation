function x = fft2c(x)
fctr=1;
x = (1/sqrt(fctr))*fftshift(fft2(ifftshift(x)));

