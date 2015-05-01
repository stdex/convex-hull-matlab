function p=recu(X,x,t)
    Xd=X-mean(X);
    xd_n=x-mean(X);
    xd_n=xd_n*exp(1i*pi/2);

    prov=real(Xd)*real(xd_n)+imag(Xd)*imag(xd_n);
    zz=X(prov<=0);
    
    figure(1)
    hold all
    plot(X,'g*')
    plot(x,'bo')
    plot(([mean(X) x]))
    plot(zz,'r*')

    if numel(zz)==1
        p=zz(1)
    else
        p=recu(zz,x,t)
    end