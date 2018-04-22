%-------------------------------------------------------------
% plik podstawowy programu mwap
%-------------------------------------------------------------
% Hubert Gawryœ   2014-03-16
% Instytut Zarz¹dzania w Budownictwie i Transporcie (L-3)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% Xij        - macierz ocen wariantów dla kryteriów
% SD         - wektor charakteru kryteriów
% Vij        - wektor wag kryteriów
% Zij        - macierze ocen po kodowaniu
%-------------------------------------------------------------
Zij=0;
Fi=0;
J3=0;
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
    if n>=2
        for i=1:n
            for k=1:4
                Zzero1=0;
                Zpierwsze=Zij(i,1,k)*Zij(i,m,k);
                for j=1:(m-1)
                    Zzero1=Zzero1+Zij(i,j,k)*Zij(i,j+1,k);
                end
                Zdrugie=Zzero1;
                Fi(i,k)=0.5*sin(pi/m)*(Zpierwsze+Zdrugie);
            end
        end
    end
    %-------------------------------------------------------------
    for i=1:n
        for k=1:4
            Jzero=0;
            for j=1:m
                Jzero=Jzero+(Zij(i,j,k)*Vij(j))^2;
                if m<=3
                    Jgraf(i,j,k)=Zij(i,j,k)*Vij(j);
                end
            end
            J3(i,k)=sqrt(Jzero);
        end
    end
    %-------------------------------------------------------------
end
%-------------------------------------------------------------
