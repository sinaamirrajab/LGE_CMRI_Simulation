function x = ifft2c(x)
fctr=1;
x = sqrt(fctr)*fftshift(ifft2(ifftshift(x)));

  