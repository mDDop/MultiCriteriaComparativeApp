%-------------------------------------------------------------
% Hubert Gawryœ   2014-06-14
% Instytut Zarz¹dzania w Budownictwie i Transporcie (L-3)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% Xij        - macierz ocen wariantów dla kryteriów
% SD         - wektor charakteru kryteriów
% Vij        - wektor wag kryteriów
% Zij        - macierze ocen po kodowaniu
%-------------------------------------------------------------
%-------------------------------------------------------------
Zij=0;
J1=0;
[n,m]=size(Xij);
%-------------------------------------------------------------
%1 standaryzacja
if n>1
    for j=1:m
        Xjsred0=0;
        Sj0=0;
        for i=1:n
            Xjsred0=Xjsred0+Xij(i,j);
        end
        Xjsred=Xjsred0/n;
        for i=1:n
            Sj0=Sj0+(Xij(i,j)-Xjsred)^2;
        end
        Sj=sqrt(Sj0/n);
        for i=1:n
            if SD(j)==1
                Zij(i,j,1)=(Xij(i,j)-Xjsred)/Sj;
            elseif SD(j)==2
                Zij(i,j,1)=-(Xij(i,j)-Xjsred)/Sj;
            end
        end
    end
    %-------------------------------------------------------------
    %2 normowanie
        for j=1:m
        for i=1:n
            Xijprim(i,j)=1/Xij(i,j);
        end
    end
    for j=1:m
        Xijmaxk=Xij(1,j);
        for i=1:n
            if Xij(i,j)>Xijmaxk
                Xijmaxk=Xij(i,j);
            end
        end
        Xijmaxk2=Xijprim(1,j);
        for i=1:n
            if Xijprim(i,j)>Xijmaxk2
                Xijmaxk2=Xijprim(i,j);
            end
        end
        for i=1:n
            if SD(j)==1
                Zij(i,j,2)=Xij(i,j)/Xijmaxk;
            elseif SD(j)==2
                Zij(i,j,2)=Xijprim(i,j)/Xijmaxk2;
            end
        end
    end
    %-------------------------------------------------------------
    %3 wg Neumana-Morgensterna
    for j=1:m
        Xijmaxk=Xij(1,j);
        for i=1:n
            if Xij(i,j)>Xijmaxk
                Xijmaxk=Xij(i,j);
            end
        end
        Xijmink=Xij(1,j);
        for i=1:n
            if Xij(i,j)<Xijmink
                Xijmink=Xij(i,j);
            end
        end
        for i=1:n
            if SD(j)==1
                Zij(i,j,3)=(Xij(i,j)-Xijmink)/(Xijmaxk-Xijmink);
            elseif SD(j)==2
                Zij(i,j,3)=(Xijmaxk-Xij(i,j))/(Xijmaxk-Xijmink);
            end
        end
    end
    %-------------------------------------------------------------
    % Pattern
    for j=1:m
        for i=1:n
            Xijprim(i,j)=1/Xij(i,j);
        end
    end
    for j=1:m
        Xjsuma0=0;
        for i=1:n
            Xjsuma0=Xjsuma0+Xij(i,j);
        end
        Xjsuma1=0;
        for i=1:n
            Xjsuma1=Xjsuma1+Xijprim(i,j);
        end
        for i=1:n
            if SD(j)==1
                Zij(i,j,4)=Xij(i,j)/Xjsuma0;
            elseif SD(j)==2
                Zij(i,j,4)=Xijprim(i,j)/Xjsuma1;
            end
        end
    end
    %-------------------------------------------------------------
    %1 wsakŸnik multiplikacyjny 2- wskaŸnik multiplikacyjny skorygowany
    %3- wsk sumacyjny, 4- wsk sumacyjny skorygowany,5-wsk addytywny(œr
    %arytmetyczna), 6-wskaŸnik addytywny skorygowany, 7-œrednia arytmetyczna
    %wa¿ona, 8-œrednia harmoniczna wa¿ona, 9-Œrednia geometryczna wa¿ona
    for i=1:n
        J1(i,1:2,1:4)=1;
        J1(i,3:4,1:4)=0;
        for j=1:m
            for k=1:4
                J1(i,1,k)=J1(i,1,k)*Zij(i,j,k);
                J1(i,2,k)=J1(i,2,k)*Zij(i,j,k)*Vij(j);
                J1(i,3,k)=J1(i,3,k)+Zij(i,j,k);
                J1(i,4,k)=J1(i,4,k)+Zij(i,j,k)*Vij(j);
            end
        end
    end
    Vijsuma=0;
    for j=1:m
        Vijsuma=Vij(j)+Vijsuma;
    end
    for i=1:n
        for k=1:4
            J1(i,5,k)=J1(i,3,k)/m;
            J1(i,6,k)=J1(i,4,k)/m;
            J1(i,7,k)=J1(i,4,k)/Vijsuma;
        end
    end
    VijZij=zeros(n,4);
    for j=1:m
        for i=1:n
            for k=1:4
                VijZij(i,k)=Vij(j)/Zij(i,j,k)+VijZij(i,k)
            end
        end
    end
    for i=1:n
        for k=1:4
            J1(i,8,k)=Vijsuma/VijZij(i,k);
        end
    end
    ZijdoVij(1:n,1:4)=1;
    for i=1:n
        for j=1:m
            for k=1:4
                ZijdoVij(i,k)=ZijdoVij(i,k)*Zij(i,j,k)^(Vij(j));
            end
        end
    end
    for i=1:n
        for k=1:4
            J1(i,9,k)=ZijdoVij(i,k)^(1/Vijsuma);
        end
    end
end
%-------------------------------------------------------------
