x=-10:0.00001:10;
f=(x.^2-9).^2/3-1;

ylim([-2,20]);
hold on;
xlim([1,4]);
hold on;
plot(x,f);
title("Auksinis pjuvis");
hold on;

zingsniai=0;
kvietimai=0;
l=0;
r=10;
tikslumas=0.0001;
tau=(-1+sqrt(5))/2;
L= r- l;

x1=r-(tau*L);
x2=1+(tau*L);
y1=funkcija(x1);
y2=funkcija(x2);
kvietimai=kvietimai+2;
zingsniai=0;

fileID = fopen('reiksmesauksinis.txt','w');

fprintf(fileID,'L, x1, y1, x2, y2, zingsniai, l, r \n');

xlabel('x') 
ylabel('y') 

while(L>tikslumas)
zingsniai=zingsniai+1;
if y2<y1
    l=x1;
    L=r-l;
    x1=x2;
    y1=y2;
    x2=l+(tau*L);
    y2=funkcija(x2);
    kvietimai=kvietimai+1;
    hold on;
else
    r=x2;
    L=r-l;
    x2=x1;
    y2=y1;
    x1=r-(tau*L);
    y1=funkcija(x1);
    kvietimai=kvietimai+1;
end

plot(x1,y1,'or');
hold on;

plot(x2,y2,'ob');
hold on;
fprintf(fileID,'%f, %f, %f, %f, %f, %d, %f, %f \n',L,x1,y1,x2,y2,zingsniai,l,r);


end

x1
x2

y1
y2

hold on;

kvietimai
zingsniai

fclose(fileID)
function y= funkcija(x)
    y=((x.^2-9)).^2/3-1;
end