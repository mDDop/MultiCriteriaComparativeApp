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
Scr2 = get(0,'Screensize');
%-------------------------------------------------------------
wymiarx2=1300;
wymiary2=700;
fig2=figure('Position',[(Scr2(3)-wymiarx2)/2 (Scr2(4)-wymiary2)/2 wymiarx2 wymiary2],...
    'Name','Zestawienie wyników - MWAP_2014','Resize','off');
%-------------------------------------------------------------
Scr2 = get(fig2,'Position');
set(fig2,'Name','Metody Wielokryterialnej Analizy Porównawczej - Zestawienie wyników', ...
    'NumberTitle','off','Color',kol2(1,:));
%-------------------------------------------------------------
clear_fig2(fig2,0)
%-------------------------------------------------------------
ZESTKOL={'WM','WMS','WS','WSS','WA','WAS','ŒAW','ŒHW','ŒGW'};
%1 standaryzowanie
    G1122=uitable(gcf,'Data',Zij(:,:,1),'ColumnName',KKK(1:w511),...
        'RowName',WWW(1:w411),'Position',[30 530 250 150]);
    set(G1122,'ColumnWidth',{53})
%-------------------------------------------------------------
    G111=uitable(gcf,'Data',J1(:,1:8,1),'ColumnName',ZESTKOL,...
        'RowName',WWW(1:w411),'Position',[300 530 580 150]);
    set(G111,'ColumnWidth',{60})
    
    %2 normowanie
    G1123=uitable(gcf,'Data',Zij(:,:,2),'ColumnName',KKK(1:w511),...
        'RowName',WWW(1:w411),'Position',[30 360 250 150]);
    set(G1123,'ColumnWidth',{53})
%-------------------------------------------------------------
    G114=uitable(gcf,'Data',J1(:,:,2),'ColumnName',ZESTKOL,...
        'RowName',WWW(1:w411),'Position',[300 360 580 150]);
    set(G114,'ColumnWidth',{60})
    
    %3 Neumana-Morgensterna
    G1124=uitable(gcf,'Data',Zij(:,:,3),'ColumnName',KKK(1:w511),...
        'RowName',WWW(1:w411),'Position',[30 190 250 150]);
    set(G1124,'ColumnWidth',{53})
%-------------------------------------------------------------
    G115=uitable(gcf,'Data',J1(:,:,3),'ColumnName',ZESTKOL,...
        'RowName',WWW(1:w411),'Position',[300 190 580 150]);
    set(G115,'ColumnWidth',{60})
    
    %1 Pattern
    G1125=uitable(gcf,'Data',Zij(:,:,4),'ColumnName',KKK(1:w511),...
        'RowName',WWW(1:w411),'Position',[30 20 250 150]);
    set(G1125,'ColumnWidth',{53})
%-------------------------------------------------------------

    G115=uitable(gcf,'Data',J1(:,:,4),'ColumnName',ZESTKOL,...
        'RowName',WWW(1:w411),'Position',[300 20 580 150]);
    set(G115,'ColumnWidth',{60});
    
    % siec pajecza
    for k=1:4
        if k==1
                        sp1(k)=uitable(gcf,'Data',Fi(:,[]),'ColumnName','MSP',...
            'RowName',WWW(1:w411),'Position',[900 530+170-k*170 100 150]);
        set(sp1(k),'ColumnWidth',{60})
        else
            sp1(k)=uitable(gcf,'Data',Fi(:,k),'ColumnName','MSP',...
            'RowName',WWW(1:w411),'Position',[900 530+170-k*170 100 150]);
        set(sp1(k),'ColumnWidth',{60})
        end
    end
    %metoda wektora wypadkowego
    for k=1:4
        if k==1
            sp1(k)=uitable(gcf,'Data',J3(:,[]),'ColumnName','MWW',...
            'RowName',WWW(1:w411),'Position',[1020 530+170-k*170 100 150]);
        set(sp1(k),'ColumnWidth',{60})
        else
            sp1(k)=uitable(gcf,'Data',J3(:,k),'ColumnName','MWW',...
            'RowName',WWW(1:w411),'Position',[1020 530+170-k*170 100 150]);
        set(sp1(k),'ColumnWidth',{60})
        end
    end
        %taksonomiczna miara rozwoju
    for k=1:4
            sp1(k)=uitable(gcf,'Data',DDDi(:,k),'ColumnName','TMR',...
            'RowName',WWW(1:w411),'Position',[1140 530+170-k*170 100 150]);
        set(sp1(k),'ColumnWidth',{60})
    end