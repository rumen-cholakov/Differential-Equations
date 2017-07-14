function phasemove
    clc
    tmax=9;
    x=-5:0.3:5;
    y=-3:0.3:3;
    [X,Y]=meshgrid(x,y);
    plot(pi,0,'m*',-pi,0,'m*',0,0,'m*')
    axis([-6,6,-4,4])
    hold on
    eps=0.1;
    
    function z=ff(t,y)
        %z=[y(2);sin(y(1)+y(2))];
        z=[-y(2)+eps*y(1)^2;y(1)+eps*y(2)^3];
    end
    %deltax=Y;
    %deltay=sin(X+Y);
    deltax=-Y+eps*X.^2;
    deltay=X+eps*Y.^3;
    d=sqrt(deltax.^2+deltay.^2);
    quiver(X,Y,deltax./d,deltay./d,0.5,'k')
    [x0,y0]=ginput(1);
    plot(x0,y0,'go')
    [T,Z]=ode45(@ff,[0,tmax],[x0,y0]);
    for k=1:length(T)
        plot(Z([1:k],1),Z([1:k],2),'b')
        M(k)=getframe;
    end
end
