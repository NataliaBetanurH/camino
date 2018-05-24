function [val] = vecinos1 (x,y,z)
global   V x2 y2 z2 x1 y1 z1 
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here

A=round(x);
B=round(y);
C=round(z);


distanciaI=sqrt((x2-x1)^2+(y2-y1)^2+(z2-z1)^2)
%distanciaI=600;

posIN=[A-1 B-1 C-1;A B-1 C-1;A+1 B-1 C-1;A-1 B C-1;A B C-1;A+1 B C-1;A-1 B+1 C-1;A B+1 C-1;A+1 B+1 C-1;A-1 B-1 C;A B-1 C;A+1 B-1 C;A-1 B C;A+1 B C;A-1 B+1 C;A B+1 C;A+1 B+1 C;A-1 B-1 C+1;A B-1 C+1;A+1 B-1 C+1;A-1 B C+1;A B C+1;A+1 B C+1;A-1 B+1 C+1;A B+1 C+1;A+1 B+1 C+1];

pos=[x-1 y-1 z-1;x y-1 z-1;x+1 y-1 z-1;x-1 y z-1;x y z-1;x+1 y z-1;x-1 y+1 z-1;x y+1 z-1;x+1 y+1 z-1;x-1 y-1 z; x y-1 z;x+1 y-1 z;x-1 y z;x+1 y z;x-1 y+1 z;x y+1 z;x+1 y+1 z;x-1 y-1 z+1;x y-1 z+1;x+1 y-1 z+1;x-1 y z+1;x y z+1; x+1 y z+1;x-1 y+1 z+1;x y+1 z+1;x+1 y+1 z+1];

t=size(pos);



posi1=0;
VALOR=zeros(t(1),1);
for i=1:t(1)
    posi1=posIN(i,:)
    VALOR(i,:)=V.img(posi1(1),posi1(2),posi1(3))
end

posi=0;
menor=0;
dis=zeros(t(1),1);
menor=distanciaI;
PS=0;
posi2=0;

for i=1:t(1)
    posi=pos(i,:)
    posi2=posIN(i,:)
    
    
    if VALOR(i,1)~=0
        %      dis(i,1)=distancia(posi(1),posi(2),posi(3),x2,y2,z2);
        dis(i,1)=sqrt((x2-posi(1)).^2+(y2-posi(2)).^2+(z2-posi(3)).^2)
        if dis(i,1)<menor & dis(i,1)~0 
            menor=dis(i,1);
            PS=[posi2(1),posi2(2),posi2(3)];
           % V.img(round(x),round(y),round(z))=127;
        end
     
        
   
    end
end


val(1,1)=menor;
val(1,2)=PS(1);
val(1,3)=PS(2);
val(1,4)=PS(3);






end

