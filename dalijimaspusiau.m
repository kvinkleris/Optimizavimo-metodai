gamma=-10:0.00001:10;
var1=1;
var2=1;
var3=0.25;
var4=0.25;
f=(var1*var1*(1-var1-var2))/8-((var3*var4*(1-var3-var4)/8)*gamma);
 
ylim([-2,20]);
hold on;
xlim([0,20]);
hold on;
plot(gamma,f);
title("Dalijimas pusiau");
hold on;
 
zingsniai=0;
kvietimai=0;
l=0;
r=10;
tikslumas=0.0001;
 
xm=l+r/2;
ym=funkcija(xm);
kvietimai=kvietimai+1;
L= r - l


fileID = fopen('reiksmes2.txt','w');

fprintf(fileID,'L,x1, y1 ,x2 ,y2 ,xm ,yv ,zingsniai \n');



xlabel('Iteracijų skaičius') 
ylabel('Bandymo taškų y reikšmės') 

while(L>tikslumas)
    
   
    x1=l+L/4;
    x2=r-L/4;
    y1=funkcija(x1);
    kvietimai=kvietimai+1;
    y2=funkcija(x2);
    kvietimai=kvietimai+1;
    fprintf(fileID,'%.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %d,%.10f ,%.10f \n',L,x1,y1,x2,y2,xm,ym,zingsniai,l,r);
    plot(zingsniai,y1,'ob');
    plot(zingsniai,y2,'ob');
    plot(zingsniai,ym,'*g');
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


     L

     

  
     hold on;
end
fprintf(fileID,'%.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %.10f, %d,%.10f ,%.10f \n',L,x1,y1,x2,y2,xm,ym,zingsniai,l,r);
%plot(zingsniai,'*g');
xm
ym
kvietimai
zingsniai

fclose(fileID);

function y= funkcija(gamma)
    var1=1;
var2=1;
var3=0.25;
var4=0.25;
y=(var1*var1*(1-var1-var2))/8-((var3*var4*(1-var3-var4)/8)*gamma);
end
