%-------------------------------------------------------------
% plik menu Metody matematyczne
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
%uicontrol(gcf,'style','text','FontSize',8,'FontWeight','bold',...
%    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center',...
%    'String',['OZK'],'Position',[100 wysokoscrzedu1 30 15]);
w1=uitable(gcf,'Data',Xij,'ColumnName',KKK(1:w511),...
    'RowName',WWW(1:w411),'Position',[textpos wysokoscrzedu1-10 230 160]);
set(w1,'ColumnWidth',{40})
w2=uitable(gcf,'Data',SD,'ColumnName',KKK(1:w511),...
    'RowName','SD','Position',[textpos 350 230 45]);
set(w2,'ColumnWidth',{30})
w3=uitable(gcf,'Data',Vij,'ColumnName',KKK(1:w511),...
    'RowName','Vj','Position',[textpos 300 230 45]);
set(w3,'ColumnWidth',{30})
%w2=uicontrol(gcf,'style','edit','FontSize',8,'FontWeight','bold',...
%    'BackGroundColor',kol2(6,:),...
%    'String',SD','Position',[textpos-10 wysokoscrzedu2 180 20]);
%set(w2,'Max',30);
%w3=uicontrol(gcf,'style','edit','FontSize',8,'FontWeight','bold',...
%    'BackGroundColor',kol2(6,:),...
%    'String',Vij','Position',[textpos-10 wysokoscrzedu3 180 20]);
%set(w3,'Max',30);
%-------------------------------------------------------------
h = uibuttongroup('visible','on','BackGroundColor',kol2(5,:),...
    'Position',[320/wymiarx 480/wymiary 180/wymiarx 100/wymiary],'SelectionChangeFcn','wczytaj_dane8');
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
h2 = uibuttongroup('visible','on','BackGroundColor',kol2(5,:),...
    'Position',[540/wymiarx 380/wymiary 225/wymiarx 200/wymiary],'SelectionChangeFcn','wczytaj_dane8');
oo2(1)=uicontrol(gcf,'style','radiobutton','String','wska�nik multiplikacyjny',...
    'Position',[10 170 190 20],'parent',h2,...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center');
oo2(2)=uicontrol(gcf,'style','radiobutton','String','wska�nik multiplikacyjny skorygowany',...
    'Position',[10 150 210 20],'parent',h2,'HandleVisibility','on',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center');
oo2(3)=uicontrol(gcf,'style','radiobutton','String','wska�nik sumacyjny',...
    'Position',[10 130 190 20],'parent',h2,'HandleVisibility','on',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center');
oo2(4)=uicontrol(gcf,'style','radiobutton','String','wska�nik sumacyjny skorygowany',...
    'Position',[10 110 200 20],'parent',h2,'HandleVisibility','on',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center');
oo2(5)=uicontrol(gcf,'style','radiobutton','String','wska�nik addytywny',...
    'Position',[10 90 190 20],'parent',h2,'HandleVisibility','on',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center');
oo2(6)=uicontrol(gcf,'style','radiobutton','String','wska�nik addytywny skorygowany',...
    'Position',[10 70 200 20],'parent',h2,'HandleVisibility','on',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center');
oo2(7)=uicontrol(gcf,'style','radiobutton','String','�rednia arytmetyczna wa�ona',...
    'Position',[10 50 190 20],'parent',h2,'HandleVisibility','on',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center');
oo2(8)=uicontrol(gcf,'style','radiobutton','String','�rednia harmoniczna wa�ona',...
    'Position',[10 30 190 20],'parent',h2,'HandleVisibility','on',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center');
oo2(9)=uicontrol(gcf,'style','radiobutton','String','�rednia geometryczna wa�ona',...
    'Position',[10 10 190 20],'parent',h2,'HandleVisibility','on',...
    'BackGroundColor',kol2(5,:),'HorizontalAlignment','center');

    set(oo1(1),'Visible','on')



hp1=uipanel('Title','Dane wej�ciowe','FontSize',8,...
    'BackgroundColor',kol2(5,:),'ForeGroundColor','b',...
    'Position',[ 30/wymiarx 280/wymiary 270/wymiarx 310/wymiary]);
hp2=uipanel('Title','Kodowanie','FontSize',8,...
    'BackgroundColor',kol2(5,:),'ForeGroundColor','b',...
    'Position',[ 320/wymiarx 370/wymiary 190/wymiarx 220/wymiary]);
hp3=uipanel('Title','Formu�y ocen syntetycznych','FontSize',8,...
    'BackgroundColor',kol2(5,:),'ForeGroundColor','b',...
    'Position',[ 530/wymiarx 370/wymiary 250/wymiarx 220/wymiary]);
hp4=uipanel('Title','Wykres','FontSize',8,...
   'BackgroundColor',kol2(5,:),'ForeGroundColor','b',...
   'Position',[ 30/wymiarx 30/wymiary 270/wymiarx 240/wymiary]);
hp5=uipanel('Title','Wyniki liczbowe','FontSize',8,...
    'BackgroundColor',kol2(5,:),'ForeGroundColor','b',...
    'Position',[ 320/wymiarx 30/wymiary 460/wymiarx 330/wymiary]);


if n>1
    w1122=uitable(gcf,'Data',Zij(:,:,wyznacznikZij),'ColumnName',KKK(1:w511),...
        'RowName',WWW(1:w411),'Position',[340 50 305 280]);
    set(w1122,'ColumnWidth',{53})
    w111=uitable(gcf,'Data',J1(:,wyznacznikJ1,wyznacznikZij),'ColumnName','Wynik',...
        'RowName',WWW(1:w411),'Position',[650 50 110 280]);
    set(w111,'ColumnWidth',{60})
end
pp1 = uicontrol(gcf,'style','pushbutton',...
    'BackGroundColor',kol2(6,:),...
    'ForeGroundColor','b',...
    'FontWeight','normal',...
    'FontSize',8,...
    'String','Zestawienie wynik�w',...
    'Position',[400 5 150 20],...
    'Callback', 'mgr1; mgr2; l_zestawienie1');

wczytaj_dane8;