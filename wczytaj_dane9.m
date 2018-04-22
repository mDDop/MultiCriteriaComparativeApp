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
    wskaznikoc2(i)=get(oo3(i),'Value');
end
for i=1:2
    if wskaznikoc2(i)==1
        wyznacznikF1=i;
    end
end
%-------------------------------------------------------------
if n>1
    w1122=uitable(gcf,'Data',Zij(:,:,wyznacznikZij),'ColumnName',KKK(1:w511),...
        'RowName',WWW(1:w411),'Position',[340 50 305 380]);
    set(w1122,'ColumnWidth',{53})
    if wyznacznikF1==1
        w111=uitable(gcf,'Data',Fi(:,wyznacznikZij),'ColumnName','Wynik',...
            'RowName',WWW(1:w411),'Position',[650 50 110 380]);
        set(w111,'ColumnWidth',{60})
    elseif wyznacznikF1==2
        w111=uitable(gcf,'Data',J3(:,wyznacznikZij),'ColumnName','Wynik',...
            'RowName',WWW(1:w411),'Position',[650 50 110 380]);
        set(w111,'ColumnWidth',{60})
    end
end
%-------------------------------------------------------------
hold off
subplot(5,3,[10,13]);
if wyznacznikF1==1
    for i=1:n
        if m==3
        fill3([0,0,Zij(i,1,wyznacznikZij)],[0,Zij(i,2,wyznacznikZij),0],[Zij(i,3,wyznacznikZij),0,0],'g','FaceAlpha',0.1,'EdgeAlpha',0.5);
        elseif m==2
        fill([0,0,Zij(i,1,wyznacznikZij)],[0,Zij(i,2,wyznacznikZij),0],'g','FaceAlpha',0.1,'EdgeAlpha',0.5);    
        end
        hold on
    end
elseif wyznacznikF1==2
    if m<=3
        for i=1:n
            if m==3
            plot3([0,Jgraf(i,1,wyznacznikZij)],[0,Jgraf(i,2,wyznacznikZij)],[0,Jgraf(i,3,wyznacznikZij)]);
            elseif m==2
                plot([0,Jgraf(i,1,wyznacznikZij)],[0,Jgraf(i,2,wyznacznikZij)]);
            end
            hold on
        end
    end
end
grid on
%-------------------------------------------------------------