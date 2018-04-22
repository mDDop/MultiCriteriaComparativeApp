symulacja3=zeros(16,4,4);
for hhy=1:33
    Vij(2)=Vij(2)+0.02;
    Vij(1)=Vij(1)-0.01;
    Vij(3)=Vij(3)-0.01;
    mgr1;
    mgr2;
    mgr3;
    symulacja3(hhy,1,2)=hhy;
    symulacja3(hhy,2,2)=J3(1,2);
    symulacja3(hhy,3,2)=J3(2,2);
    symulacja3(hhy,4,2)=J3(3,2);
end
symulacja3