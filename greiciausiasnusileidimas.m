fileID = fopen('greiciausiasreiksmes.txt','w');
fprintf(fileID,'x, y, grad x , grad y ,gamma, funkcijos reiksme, iteracija , norma(grad) \n');


f=@(x,y)(x*y*(x+y-1))/8;
f(0.25,-0.25)
gradf=@(x,y) [(y*(2*x+y-1))/8;(x*(2*y+x-1))/8];

hold on;    
initialguess=[0.9;0.3];
iterations=0;
%stepsize=4;
recordguesses=[initialguess];
nextguess=initialguess;
tol = 1e-4;
norma=Inf;
figure
[x,y] =meshgrid(0:0.05:1,0:0.05:1);
z=(x.*y.*(x+y-1))/8;
contour(x,y,z,100)  
while norma>tol
    iterations=iterations+1;
    n1=nextguess;
    n2=gradf(nextguess(1),nextguess(2));
    norma=norm(n2);
  
    answ=minfunkcija(n1(1),n1(2),n2(1),n2(2))
    nextguess=nextguess-(answ*gradf(nextguess(1),nextguess(2)))
   % nextguess=nextguess-(answ*gradf(nextguess)); 
    text(nextguess(1),nextguess(2),num2str(iterations))
    f_value=f(nextguess(1),nextguess(2));
    hold on;
    recordguesses=[recordguesses,nextguess];
    fprintf(fileID,'%.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %d, %.10f \n',nextguess(1),nextguess(2),gradf(nextguess(1),nextguess(2)),answ,f_value,iterations,norma);
end
iterations
plot(recordguesses(1,:),recordguesses(2,:),'ro');
hold on;
plot(0.3333,0.3333,'b^');
xlabel('dvigubo a sienos ploto reiksme')
ylabel('dvigubo b sienos ploto reiksme')
hold off;

recordguesses;
fclose(fileID);

function answer=minfunkcija(var1,var2,var3,var4)


zingsniai=0;
kvietimai=0;
l=0;
r=35;
tikslumas=0.0001;
%grad=gradf([var1,var2]);



%f1=@(gamma) myfun(var1,var2)-(myfun(var3,var4)*gamma);
f1=@(gamma)((var1-(var3*gamma))*(var2-(var4*gamma))*((var1-(var3*gamma))+(var2-(var4*gamma))-1))/8;
%f1=@(gamma)((var1-(var3*gamma))*(var2-(var4*gamma))*(1-(var1-(var3*gamma))-(var2-(var4*gamma)))/8);
xm=l+r/2;
ym=f1(xm);
kvietimai=kvietimai+1;
L= r - l;
while(L>tikslumas)

   
    x1=l+L/4;
    x2=r-L/4;
    y1=f1(x1);
    kvietimai=kvietimai+1;
    y2=f1(x2);
    kvietimai=kvietimai+1;
    zingsniai=zingsniai+1;
    if y1<ym
        r=xm;
        xm=x1;
        ym=y1;
    else if y2<ym
            l=xm;
            xm=x2;
            ym=y2;
        else
        l=x1;
        r=x2;
        end
    end
     L=r-l;


     L;


end

answer=xm


function y = myfun(x1,x2)

y = (x1*x2*(x1+x2-1))/8;


end

end

    