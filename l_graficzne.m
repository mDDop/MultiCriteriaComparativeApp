%-------------------------------------------------------------
% plik menu Metody graficzne
%-------------------------------------------------------------
% Hubert Gawry�   2014-03-16
% Instytut Zarz�dzania w Budownictwie i Transporcie (L-3)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
% Xij        - macierz ocen wariant�w dla kryteri�w
% SD         - wektor charakteru kryteri�w
% Vij        - wektor wag kryteri�w
% Zij        - macierze ocen po kodowaniu
%-------------------------------------------------------------
mgr1;
mgr2;
mgr3;

All_alert;

clear_fig(1,lmenu);
bb=10;
wysokoscrzedu1=410;
wysokoscrzedu2=390;
wysokoscrzedu3=330;
wysokoscrzedu4=555;
wysokoscrzedu5=555;
textpos=50;
textpos2=340;
textszer=140;
textwys=20;
Pos2=get(fig,'Position');
%-------------------------------------------------------------
%-------------------------------------------------------------
w1=uitable(gcf,'Data',Xij,'ColumnName',KKK(1:w511),...
    'RowName',WWW(1:w411),'Position',[textpos wysokoscrzedu1-10 230 160]);
set(w1,'ColumnWidth',{40})
w2=uitable(gcf,'Data',SD,'ColumnName',KKK(1:w511),...
    'RowName','SD','Position',[textpos 350 230 45]);
set(w2,'ColumnWidth',{30})
w3=uitable(gcf,'Data',Vij,'ColumnName',KKK(1:w511),...
    'RowName','Vj','Position',[textpos 300 230 45]);
set(w3,'ColumnWidth',{30})
%-------------------------------------------------------------
h = uibuttongroup('visible','on','BackGroundColor',kol2(5,:),...
    'Position',[320/wymiarx 480/wymiary 180/wymiarx 100/wymiary],'SelectionChangeFcn','wczytaj_dane9');
oo1(1)=uicontrol(gcf,'style','radiobutton','String','standaryzowanie',...
    'Position',[10 70 150 20],'parent',h,...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center');
oo1(2)=uicontrol(gcf,'style','radiobutton','String','normowanie',...
    'Position',[10 50 150 20],'parent',h,'HandleVisibility','on',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center');
oo1(3)=uicontrol(gcf,'style','radiobutton','String','Neumana-Morgensterna',...
    'Position',[10 30 150 20],'parent',h,'HandleVisibility','on',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center');
oo1(4)=uicontrol(gcf,'style','radiobutton','String','Pattern',...
    'Position',[10 10 150 20],'parent',h,'HandleVisibility','on',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center');
%-------------------------------------------------------------
h3 = uibuttongroup('visible','on','BackGroundColor',kol2(5,:),...
    'Position',[540/wymiarx 480/wymiary 225/wymiarx 100/wymiary],'SelectionChangeFcn','wczytaj_dane9');
oo3(1)=uicontrol(gcf,'style','radiobutton','String','metoda sieci paj�czej',...
    'Position',[10 70 190 20],'parent',h3,...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center');
oo3(2)=uicontrol(gcf,'style','radiobutton','String','metoda wektora wypadkowego',...
    'Position',[10 50 210 20],'parent',h3,'HandleVisibility','on',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center');
    set(oo1(1),'Enable','off')
    set(oo1(2),'Value', 1)
%-------------------------------------------------------------
hp1=uipanel('Title','Dane wej�ciowe','FontSize',8,...
    'BackgroundColor',kol2(5,:),'ForeGroundColor','b',...
    'Position',[ 30/wymiarx 280/wymiary 270/wymiarx 310/wymiary]);
hp2=uipanel('Title','Kodowanie','FontSize',8,...
    'BackgroundColor',kol2(5,:),'ForeGroundColor','b',...
    'Position',[ 320/wymiarx 470/wymiary 190/wymiarx 120/wymiary]);
hp3=uipanel('Title','Metoda oblicze�','FontSize',8,...
    'BackgroundColor',kol2(5,:),'ForeGroundColor','b',...
    'Position',[ 530/wymiarx 470/wymiary 250/wymiarx 120/wymiary]);
hp4=uipanel('Title','Wykres','FontSize',8,...
   'BackgroundColor',kol2(5,:),'ForeGroundColor','b',...
   'Position',[ 30/wymiarx 30/wymiary 270/wymiarx 240/wymiary]);
hp5=uipanel('Title','Wyniki liczbowe','FontSize',8,...
    'BackgroundColor',kol2(5,:),'ForeGroundColor','b',...
    'Position',[ 320/wymiarx 30/wymiary 460/wymiarx 430/wymiary]);
%-------------------------------------------------------------
if n>1
    w1122=uitable(gcf,'Data',Zij(1:w411,1:w511,wyznacznikZij),'ColumnName',KKK(1:w511),...
        'RowName',WWW(1:w411),'Position',[340 50 305 380]);
   set(w1122,'ColumnWidth',{53})
    w111=uitable(gcf,'Data',Fi(1:w411,wyznacznikZij),'ColumnName','Wynik',...
        'RowName',WWW(1:w411),'Position',[650 50 110 380]);
    set(w111,'ColumnWidth',{60})
end
%-------------------------------------------------------------
pp1 = uicontrol(gcf,'style','pushbutton',...
    'BackGroundColor',kol2(6,:),...
    'ForeGroundColor','b',...
    'FontWeight','normal',...
    'FontSize',8,...
    'String','Zestawienie wynik�w',...
    'Position',[400 5 150 20],...
    'Callback', 'mgr1; mgr2; l_zestawienie1');

wczytaj_dane9;
