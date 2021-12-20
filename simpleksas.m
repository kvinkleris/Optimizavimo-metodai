    x=[-0.25,-0.25];
    f=@(x,y)(x*y*(x+y-1))/8

    gradf=@(x,y) [(y*(2*x+y-1))/8;(x*(2*y+x-1))/8];
    %x0=[0,0];
    %x1=[1,1];
    x0=[1,1];
    
    xPrad=x0;
   
   

    
    i=1;    
    iMax=15;
    skaiciavimai=0;
    tol=1e-4;
    n=2;
    alpha=0.5;
    gamma=1.5;
    beta=0.5;
    niu=-0.5;
    teta=1;
    iterations=0;

    
    lastbest=-Inf;
     
    figure
    hold on
    plot(0.333,0.333,'bo');


    first=x0;
    second=Inf;
    last=Inf;
    norma=Inf;
    
    x1=virsunes(x0,1,alpha,n)
    x2=virsunes(x0,2,alpha,n)
    
    fileID = fopen('simpleksas reiksmes.txt','w');
    fprintf(fileID,'x0, y0, x1, y1, x2, y2, f0, f1, f2, naujasx, naujasy, naujasf,iteracijos, norma \n');

   while norma>tol && iterations<iMax
    %[first,second,last,firstf,secondf,lastf]=findvalues(x0,x1,x2,f1,f2,f3);
    f1=f(x0(1),x0(2))
    f2=f(x1(1),x1(2));
    f3=f(x2(1),x2(2));

    line([x0(1),x1(1)], [x0(2), x1(2)], 'Color', 'r');
    hold on;
    line([x1(1),x2(1)], [x1(2), x2(2)], 'Color', 'r');
    line([x2(1),x0(1)], [x2(2), x0(2)], 'Color', 'r');
    pause(1)
        hold on
%     x0
%     x1
%     x2
%     f1
%     f2
%     f3
    

    
 
     if f1>=f3&&f1>=f2
         first=x0;
         firstf=f1;
         if f3>=f2
             second=x2;
             secondf=f3;
             last=x1;
             lastf=f2;
         elseif f2>=f3
             secondf=f2;
             second=x1;
             last=x2;
             lastf=f3;
         end
     elseif f2>=f1&&f2>=f3
         first=x1;
         firstf=f2;
         if f1>=f3
             second=x0;
             secondf=f1;
             last=x2;
             lastf=f3;
         elseif f3>=f1
             second=x2;
             secondf=f3;
             last=x0;
             lastf=f1;
         end
     elseif f3>=f1&&f3>=f2
         first=x2;
         firstf=f3;
         if f1>=f2
             second=x0;
             secondf=f1;
             last=x1;
             lastf=f2;
         elseif f2>=f1
             second=x1;
             secondf=f2;
             last=x0;
             lastf=f1;
        end
     end
     
%      plot(first(1),first(2),'bo');
%      plot(second(1),second(2),'ro');
%      plot(last(1),last(2),'go');
%      text(first(1),first(2),num2str(i));
%      text(second(1),second(2),num2str(i));
%      text(last(1),last(2),num2str(i));
     
     xc=svoriocentras(second,last)
     xvirsune=naujavirsune(first,xc,1);
     fvirsune=f(xvirsune(1),xvirsune(2));
     if lastf<fvirsune&&fvirsune<secondf
         fvirsune=fvirsune;
     elseif fvirsune<lastf
         xvirsune=naujavirsune(first,xc,1.5 );
         fvirsune=f(xvirsune(1),xvirsune(2));
     elseif fvirsune>firstf
         xvirsune=naujavirsune(first,xc,-0.5);
         fvirsune=f(xvirsune(1),xvirsune(2));
     elseif secondf<fvirsune&&fvirsune<firstf
         xvirsune=naujavirsune(first,xc,0.5);
         fvirsune=f(xvirsune(1),xvirsune(2));
     end
    fprintf(fileID,'%.10f, %.10f, %.10f, %.10f, %.10f, %.10f, ',x0(1),x0(2),x1(1),x1(2),x2(1),x2(2));
    fprintf(fileID,'%.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %d, %.10f', f1, f2, f3,xvirsune(1),xvirsune(2),fvirsune,iterations,norma);
    fprintf(fileID,'\n');
     if(first==x0)
        x0=xvirsune;
        f1=fvirsune;

     elseif(first==x1)
        x1=xvirsune;
        f2=fvirsune;
%         x0=virsunes(x1,1,alpha,n);
%         x2=virsunes(x1,2,alpha,n);
     elseif(first==x2)
        x2=xvirsune;
        f3=fvirsune;
%         x0=virsunes(x2,1,alpha,n);
%         x1=virsunes(x2,2,alpha,n);
     end
    gradient=gradf(xvirsune(1),xvirsune(2));
    norma=norm(gradient);
    plot(xvirsune(1),xvirsune(2),'go');
    xvirsune
    fvirsune
    hold on;
    iterations=iterations+1;
   

      
   end
    [x,y] =meshgrid(0:0.1:20,-20:0.1:1);
    z=(x.*y.*(x+y-1))/8;
    contour(x,y,z,100) 
   iterations
   xlabel('dvigubo a sienos ploto reiksme')
   ylabel('dvigubo b sienos ploto reiksme')
   fclose(fileID);
    
  
     
  
    
    function y=virsunes(x0,i,alpha,n)
     delta1=alpha*((sqrt(n+1)+n-1)/(n*sqrt(2)));
     delta2=alpha*((sqrt(n+1)-1)/(n*sqrt(2)));
     y=[0;0];
     

 
        for j=1:2
         if i==j
             answer(j)=x0(j)+delta2;
         else
             answer(j)=x0(j)+delta1;
             
         
             

        
             
        end
        end
        y=answer;
    end
    function y=svoriocentras(x1,x2)
     answ1=0.5*(x1(1)+x2(1));
     answ2=0.5*(x1(2)+x2(2));
     
     fansw=[answ1,answ2];
     
     y=fansw;
    
    end
    
    function y=naujavirsune(xj,xc,lambda)
     answ(1)= xj(1)+(1+lambda)*(xc(1)-xj(1));
     answ(2)= xj(2)+(1+lambda)*(xc(2)-xj(2));
 
     
     y=answ;
    end
    
    function piesti(x1,x2,x3)
     x=[x1(1);x2(1);x3(1)];
     y=[x1(2);x2(2);x3(2)];
     plot(x,y,'g','Linewidth',3);
    end
    
    

            
             
             
    
   
    
    
    
    
