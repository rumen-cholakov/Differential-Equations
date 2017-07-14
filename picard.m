function picard
    clc
    Xmin=-4;
    Xmax=4;
    x0=0;
    y0=1;
    function z=ff(x,y)
        z=y;
    end
    hold on
    grid on
    axis([Xmin,Xmax,-10,20])
    [T,Y]=ode45(@ff,[x0,Xmax],y0);
    [T1,Y1]=ode45(@ff,[x0,Xmin],y0);
    plot(T,Y,'k',T1,Y1,'k')
    x=x0:(Xmin-x0)/100:Xmin;
    xx=x0:(Xmax-x0)/100:Xmax;
    y_0=y0*ones(1,length(x));
    yy_0=y0*ones(1,length(xx));
    plot(x,y_0,'b',xx,yy_0,'b')
    N=7;
    z=y_0;
    zz=yy_0;
    for k = 1:N
        y_k=y0+cumtrapz(x,ff(x,z));
        yy_k=y0+cumtrapz(xx,ff(xx,zz));
        if k == 1
            plot(x,z,'g',xx,zz,'g')
        elseif k == 2
            plot(x,z,'m',xx,zz,'m')
        elseif k == 7
            plot(x,z,'r',xx,zz,'r')
        end
        z=y_k;
        zz=yy_k;
    end 
end
