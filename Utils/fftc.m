function x = fftc(x,n,dim)
fctr=1;
x = (1/sqrt(fctr))*fftshift(fft(ifftshift(x),n,dim));