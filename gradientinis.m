%f=@(x) (x(1)-5).^2+(x(2)+1).^2;

%gradf=@(x) [2*(x(1)-5);2*(x(2)+1)];

f=@(x,y)(x*y*(x+y-1))/8;

gradf=@(x,y) [(y*(2*x+y-1))/8;(x*(2*y+x-1))/8];
%f2=@(x) x(1)*x(2)*(1-2*x(1)*x(2))/2*x(1)+2*x(2);
%gradf2=@(x) [(x(2)*(-2*x(1).^2*x(2)-4*x(1)*x(2).^2+x(2)))/2*(x(1)+x(2)).^2;
    %(x(1)*(-2*x(1)*x(2).^2-4*x(1).^2*x(2)+x(1)))/2*(x(1)+x(2)).^2];
    
fileID = fopen('gradientdescentreiksmes.txt','w');
fprintf(fileID,'x, y, grad x , grad y , funkcijos reiksme, iteracija , tikslumas \n');

%[X,Y] = meshgrid(1:0.5:10,1:20);
%Z= X.*Y.*(1-2.*X.*Y)/2.*X+2.*Y;
%surf(X,Y,Z)
%ats=sqrt(f([0.333;0.333])
hold on;    
initialguess=[0.9;0.3];
iterations=0;
stepsize=7;
recordguesses=[initialguess];
nextguess=initialguess;

tol = 1e-4;
norma=Inf;


figure
[x,y] =meshgrid(0:0.05:0.5,0:0.05:0.5);
z=(x.*y.*(x+y-1))/8;


contour(x,y,z)  
while norma>tol
    norma;
    
    
    iterations=iterations+1;
    norma=norm(gradf(nextguess(1),nextguess(2)));
    nextguess=nextguess-stepsize*gradf(nextguess(1) ,nextguess(2)) ;
    gradf(nextguess(1),nextguess(2))
    text(nextguess(1),nextguess(2),num2str(iterations))
    hold on
    f_value=f(nextguess(1),nextguess(2));
    recordguesses=[recordguesses,nextguess];
    fprintf(fileID,'%.10f, %.10f, %.10f, %.10f, %.10f, %d, %.10f \n',nextguess(1),nextguess(2),gradf(nextguess(1),nextguess(2)),f_value,iterations,norma);
end
plot(recordguesses(1,:),recordguesses(2,:),'ro');
hold on;
plot(0.3333,0.3333,'b^');
xlabel('dvigubo a sienos ploto reiksme')
ylabel('dvigubo b sienos ploto reiksme')
hold off;
fclose(fileID);
iterations
    


