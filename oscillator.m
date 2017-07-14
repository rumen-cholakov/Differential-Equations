function oscillator
    clear
    clf
    tmax=30;
    %y=simplify(dsolve('D2y+16*y=0','y(0)=1','Dy(0)=1'));
    %y=simplify(dsolve('D2y++0.5*Dy+16*y=0','y(0)=1','Dy(0)=1'));
    %y=simplify(dsolve('D2y+16*y=3*sin(t/2)','y(0)=1','Dy(0)=1'));
    %y=simplify(dsolve('D2y++0.5*Dy+16*y=0=3*sin(t/2)','y(0)=1','Dy(0)=1'));
    %y=simplify(dsolve('D2y+16*y=3*sin(4.6*t)','y(0)=1','Dy(0)=1'));
    y=simplify(dsolve('D2y+16*y=3*sin(4*t)','y(0)=1','Dy(0)=1'));
    t=0:0.05:tmax;
    dy=diff(y);
    Y=eval(y);
    dY=eval(dy);
    for k=1:length(t)
        subplot(3,1,1)
        plot(t(1:k),Y(1:k))
        axis([0,tmax,-2.5,2.5])

        subplot(3,1,2)
        plot(t(1:k),dY(1:k))
        axis([0,tmax,-8,8])

        subplot(3,1,3)
        plot(Y(1:k),dY(1:k))
        axis([-8,8,-8,8])
        M(k)=getframe;
    end 
end
