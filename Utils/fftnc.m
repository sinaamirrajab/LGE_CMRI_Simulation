function x = fftnc(x,n)
fctr=1;
x = (1/sqrt(fctr))*fftshift(fftn(ifftshift(x),n));