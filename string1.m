function string1
    clc
    clf
    a=1/10;
    L=pi*sqrt(2);
    t0=0;
    tmax=30;
    t=t0:(tmax-t0)/100:tmax;
    x=0:L/100:L;
    function y=phi(x)
        % for i=1:length(x)
        % if 1 < x(i) && x(i)<2
        % y(i)=10*exp(4/((2*x(i)-3)^2-1));
        % else
        % y(i)=0;
        % end
        %end
        y=0*x;
    end
    function y=psi(x)
        %y=0*x;
        y=2*cos(4*x*sqrt(2))-0*cos(5*x*sqrt(2));
    end
    function y=fourieru(x,t)
        y=trapz(x,phi(x))/L+t*trapz(x,psi(x))/L;
        for k=1:30
            Xk=cos(k*pi*x/L);
            Ak=2*trapz(x,phi(x).*Xk)/L;
            Bk=2*trapz(x,psi(x).*Xk)/(a*k*pi);
            Tk=Ak*cos(a*k*pi*t/L)+Bk*sin(a*k*pi*t/L);
            y=y+Tk*Xk;
        end
    end
        for n=1:length(t)
        plot(x,fourieru(x,t(n)))
        grid on
        axis([0,L,-4,4])
        M(n)=getframe;
    end
    %movie(M,2)
    subplot(3,1,1)
    plot(x,fourieru(x,0))
    subplot(3,1,2)
    plot(x,fourieru(x,5))
    subplot(3,1,3)
    plot(x,fourieru(x,12))
end
