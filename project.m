function project
    clc
    clf
    a=1/sqrt(5);
    L=1/3;
    t0=0;
    tmax=28;
    t=t0:(tmax-t0)/100:tmax;
    x=0:L/100:L;
    
    function y=phi(x)
        y=-(x.^3).*(3*x-1).^2;
    end

    function y=psi(x)
        y=sin(15*pi*x/2);
    end

    function y=fourieru(x,t,p)
        y=0;
        for k=0:p
            Xk=sin((2*k+1)*pi*x/(2*L));
            Ak=2*trapz(x,phi(x).*Xk)/L;
            Bk=4*trapz(x,psi(x).*Xk)/(a*(2*k+1)*pi);
            Tk=Ak*cos((2*k+1)*pi*t/(2*L))+Bk*sin((2*k+1)*pi*t/(2*L));
            y=y+Tk*Xk;
        end
    end

    for n=1:length(t)
        plot(x,fourieru(x,t(n),61))
        title('Анимация на трептенето на хомогенна идеално гъвкава неразтеглива струна');
        grid on
        axis([0,L,-0.1,0.1])
        M(n)=getframe;
    end
    
    movie(M,1,1)
end
