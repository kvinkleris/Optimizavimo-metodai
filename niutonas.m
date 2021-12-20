x=-10:0.00001:10;
f=(x.^2-9).^2/3-1;

ylim([-2,9]);
hold on;
xlim([1,6]);
hold on;
%plot(x,f);
title("Niutodo metodas");
hold on;
xlabel("Iteracijų skaičius");
ylabel("bandymo taškų y reikšmės");
zingsniai=0;
kvietimai=0;
tikslumas=0.0001;
x0=5;
x=x0-(derivative1(x0)/derivative2(x0));
kvietimai=kvietimai+2;
zingsniai=zingsniai+1;
y=funkcija(x);
plot(zingsniai,y,'bo');
%plot(x,y,'bo');
hold on;

fileID = fopen('reiksmesniutonas.txt','w');
fprintf(fileID,'|x-x0|, x0, x, y, zingsniai \n');
fprintf(fileID,'%f, %f, %f, %f, %d \n',abs(x-x0),x0,x,y,zingsniai);
while(abs(x-x0)>tikslumas)
x0=x;
x=x0-(derivative1(x0)/derivative2(x0));
kvietimai=kvietimai+2;
zingsniai=zingsniai+1;
y=funkcija(x);

x

y
fprintf(fileID,'%.10f, %.10f, %.10f, %.10f, %d \n',abs(x-x0),x0,x,y,zingsniai);


plot(zingsniai,y,'bo');
hold on;
    
end

kvietimai
zingsniai
fclose(fileID);

function y= funkcija(x)
    y=((x.^2-9)).^2/3-1;
end

function y = derivative1(x)
    y=2*x*(x.^2-9);
end

function y = derivative2(x)
    y=2*(3*x.^2-9)
end