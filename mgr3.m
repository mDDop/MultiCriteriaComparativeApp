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
%-------------------------------------------------------------
Zij=0;
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
    % przeciêtna bezwzglêdna ró¿nic wartoœci zmiennych
    Crs=0;;
    Crs1=0;
    Crs2=0;
    Crs3=0;
    Crs4=0;
    Crs5=0;
    Crs6=0;
    Crs7=0;
    Crs8=0;
    Crs9=0;
    for k=1:4
        for R=1:n
            for S=1:n
                Czero=0;
                for j=1:m
                    Czero=Czero+abs(Zij(R,j,k)-Zij(S,j,k));
                end
                Crs(R,S,k)=Czero/m;
            end
        end
    end
    Crs2=Crs;
    Crs3=zeros(n,n,4);
    for k=1:4
    for i=1:n
        for j=1:n
            Crs3(i,j,k)=abs(i-j)^3;
        end
    end
    end
    Crs4=zeros(n,4);
    Crs4(1,1:4)=1;
    for k=1:4
    for i=2:n
        Crs4(i,k)=Crs4(i-1,k)+1;
    end
    end
    Crs4
    Crs8=Crs4
    for k=1:4
    for i=1:n
       for j=1:n
          if i~=n 
              if j~=n
                            Crs5(i,j,k)=Crs2(i,j,k)*Crs3(i,j,k);
                  Crs6=Crs2;
                  Crs4=Crs8;
                  GGG=Crs6(j,:,k);
                  ggg=Crs4(j,k);
                  Crs6(j,:,k)=Crs6(j+1,:,k);
                  Crs4(j,k)=Crs4(j+1,k);
                  Crs6(j+1,:,k)=GGG;
                  Crs4(j+1,k)=ggg;
                  GGGG=Crs6(:,j,k);
                  Crs6(:,j,k)=Crs6(:,j+1,k);
                  Crs6(:,j+1,k)=GGGG;
                  Crs7(i,j,k)=Crs6(i,j,k)*Crs3(i,j,k);
                  GGGG2=sum(sum(Crs5(:,:,k)));
                  GGGG3=sum(sum(Crs7(:,:,k)));
                  if GGGG2<GGGG3
                      Crs2(:,:,k)=Crs6(:,:,k);
                      Crs8(:,k)=Crs4(:,k);
                  end
              end
          end
              end
    end
           
    end
            
 ZzeroM=0;
 Cizero=0;
 Ci0=0;
 CC0=0;
 C0kres=0;
 ss0=0;
 CC2=0;
 C0ostat=0;
 DDDi=0;
            
            
    % skonstruowanie wzorca rozwoju
    for k=1:4
        for j=1:m
            if SD(j)==1
                ZzeroM(j,k)=max(Zij(:,j,k));
            elseif SD(j)==2
                ZzeroM(j,k)=min(Zij(:,j,k));
            end
        end
    end
    % obliczenie odle³oœci P0-wariant
    for k=1:4
        for i=1:n
            Cizero=0;
            for S=1:m
                Cizero=Cizero+(Zij(i,S,k)-ZzeroM(S,k))^2;
            end
            Ci0(i,k)=Cizero^(1/2);
        end
    end
    for k=1:4
        CC0=0;
        for i=1:n
            CC0=CC0+Ci0(i,k);
        end
        C0kres(k)=1/n*CC0;
    end
    for k=1:4
        CC2=0;
        for i=1:n
            CC2=CC2+(Ci0(i,k)-C0kres(k))^2;
        end
        ss0(k)=(1/n*CC2)^(1/2);
    end
    for k=1:4
        C0ostat(k)=C0kres(k)+2*ss0(k);
    end
    for k=1:4
        for i=1:n
            DDDi(i,k)=1-Ci0(i,k)/C0ostat(k);
        end
    end
end
%-------------------------------------------------------------
