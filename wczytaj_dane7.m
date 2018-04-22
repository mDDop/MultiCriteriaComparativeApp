%-------------------------------------------------------------
% plik kreœl¹cy wyniki
%-------------------------------------------------------------
% Hubert Gawryœ   2014-03-16
% Instytut Zarz¹dzania w Budownictwie i Transporcie (L-3)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% Zij        - macierze ocen po kodowaniu
%-------------------------------------------------------------
for i=1:4
    kodowanie(i)=get(oo1(i),'Value');
end
for i=1:4
    if kodowanie(i)==1
        wyznacznikZij=i;
    end
end
for i=1:2
    wskaznikoc3(i)=get(oo4,'Value');
end
for i=1:2
    if wskaznikoc3(i)==1
        wyznacznikDDDi=i;
    end
end
%-------------------------------------------------------------
if n>1
    w1122=uitable(gcf,'Data',Zij(:,:,wyznacznikZij),'ColumnName',KKK(1:w511),...
        'RowName',WWW(1:w411),'Position',[340 50 305 380]);
    set(w1122,'ColumnWidth',{53})
    if wyznacznikDDDi==1
        w111=uitable(gcf,'Data',DDDi(:,wyznacznikZij),'ColumnName','Wynik',...
            'RowName',WWW(1:w411),'Position',[650 50 110 380]);
        set(w111,'ColumnWidth',{60})
    elseif wyznacznikDDDi==2
        w111=uitable(gcf,'Data',DDDi(:,wyznacznikZij),'ColumnName','Wynik',...
            'RowName',WWW(1:w411),'Position',[650 50 110 380]);
        set(w111,'ColumnWidth',{60})
    end
end
%-------------------------------------------------------------
hold off
subplot(5,3,[10,13]);
FF=bar(DDDi(:,wyznacznikZij),'g','EdgeColor',kol2(1,:));%,'Parent',hp4)
%-------------------------------------------------------------