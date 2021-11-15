function x = ifftnc(x,n)
fctr=1;
x = (sqrt(fctr))*fftshift(ifftn(ifftshift(x),n));