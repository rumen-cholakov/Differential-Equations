function euler 
    clc
    x0=0;
    y0=1;
    a=1;
    %h=[0.3,0.1,0.03];
    h=[0.5,0.2,0.02];
    %t=x0:(a-x0)/100:a;
    %yy=dsolve('Dy=-y*tan(t)+(cos(t))^2','y(x0)=y0');
    %plot(t,eval(yy),'k')
    hold on
    %axis([x0,a,-3,3])
    c=['g','m','r'];
    for i = 1:3
        x=[];
        y=[];
        y(1)=y0;
        x=x0:h(i):a;
        for k = 1:length(x)-1
            %y(k+1)=y(k)+h(i)*(-y(k)*tan(x(k))+(cos(x(k)))^2);
            y(k+1)=y(k)+h(i)*(y(k)^2+x(k)^2);
        end
        plot(x,y,c(i))
    end 
end


